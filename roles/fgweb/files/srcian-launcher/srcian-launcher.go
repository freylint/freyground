package main

import (
	_ "embed" // for embedding files
	"fmt"
	"os"
	"path/filepath"

	"github.com/freylint/fgutil"
	"github.com/freylint/fgutil/fgassets/fgzip"
)

//go:embed dosbox.conf
var dosboxConf []byte

type GameDirs struct {
	BaseDir   string
	GameDir   string
	DosboxDir string
}

func GetGameDirs() GameDirs {
	baseDir, err := fgutil.GetExecutablePath()
	if err != nil {
		panic(err)
	}

	gameDir := filepath.Join(baseDir, "srcian")
	dosboxDir := filepath.Join(baseDir, "dosbox")

	return GameDirs{
		BaseDir:   baseDir,
		GameDir:   gameDir,
		DosboxDir: dosboxDir,
	}
}

func unpackZipArchive(dest string, zipArchive []byte) {
	exists, err := fgutil.ParentDirExists(dest)
	if err != nil {
		panic(fmt.Errorf("failed to check if parent directory exists: %w", err))
	} else if !exists {
		if err := fgutil.EnsureDirExists(dest); err != nil {
			panic(fmt.Errorf("failed to create game directory: %w", err))
		}
	}
	fgzip.ExtractZip(zipArchive, dest)
}

func main() {
	// Download dependencies and game files
	srcerian, dosboxBin := download()
	// Unpack the downloaded files
	unpack(srcerian, dosboxBin, dosboxConf)
}

func download() ([]byte, []byte) {
	// Download the srcerian game files
	SrcerianBin, err := fgutil.DownloadManifest(fgutil.MakeDLManifest(
		"https://www.abandoscdn.com/public/aw-remote-download.php?dlc=Zy9zb3JjZXJpYW4uemlw",
		"AF4ECC584FBC17213F432ABCF00383129194B03D34886B817ABB25CA74D09601",
	))
	if err != nil {
		panic(fmt.Errorf("failed to download srcerian game files: %w", err))
	}

	// Download the dosbox-x binary files
	dosboxBin, err := fgutil.DownloadManifest(fgutil.MakeDLManifest(
		"https://github.com/joncampbell123/dosbox-x/releases/download/dosbox-x-v2025.05.03/dosbox-x-vsbuild-win64-20250503164337.zip",
		"88357F37D087BA860B0810AF880AB9CDDB82244207EF288C5C5D762AAD836CAE",
	))
	if err != nil {
		panic(fmt.Errorf("failed to download dosbox-x binary files: %w", err))
	}

	return SrcerianBin, dosboxBin
}

// unpack extracts the srcerian dependencies and game files
//
// Note: Requires the depending files to be downloaded
func unpack(srcerian []byte, dosboxBin []byte, dosboxConf []byte) {
	// Get game directories
	gameDirs := GetGameDirs()
	tmpdir := os.TempDir()
	dboxTemp := filepath.Join(tmpdir, "dosbox-srcian")
	dboxBin := filepath.Join(dboxTemp, "bin", "x64", "Release")
	gameTemp := filepath.Join(tmpdir, "srcian-srcian")
	dboxConfPath := filepath.Join(gameDirs.BaseDir, "dosbox.conf")

	fmt.Printf("BaseDir: %s\n", gameDirs.BaseDir)
	fmt.Printf("GameDir: %s\n", gameDirs.GameDir)
	fmt.Printf("DosboxDir: %s\n", gameDirs.DosboxDir)

	// Extract the Srcerian game files
	fmt.Printf("Unpacking Srcerian game files to: %s\n", gameTemp)
	unpackZipArchive(gameTemp, srcerian)

	// Extract the DOSBox binary files
	fmt.Printf("Unpacking DOSBox binary files to: %s\n", dboxTemp)
	unpackZipArchive(dboxTemp, dosboxBin)

	// Create the dosbox.conf file if it doesn't exist
	fmt.Printf("Creating dosbox.conf in: %s\n", gameDirs.BaseDir)
	err := fgutil.IfParentDirExists(dboxConfPath, func() {
		os.WriteFile(dboxConfPath, dosboxConf, 0644)
	})
	if err != nil {
		fmt.Printf("Error creating dosbox.conf: %s\n", err)
	}
	fmt.Printf("dosbox.conf created at: %s\n", dboxConfPath)
	// Move the DOSBox-x binary files to the dosbox directory
	fgutil.EnsureDirExists(gameDirs.DosboxDir)
	err = fgutil.IfDirExists(dboxBin, func() {
		fgutil.CopyContents(dboxBin, gameDirs.DosboxDir)
	})
	if err != nil {
		fmt.Printf("Error copying DOSBox binaries: %s\n", err)
	}
	fmt.Printf("DOSBox binaries copied to: %s\n", gameDirs.DosboxDir)
	// Get base folder of the game files
	contentDirs, err := fgutil.GetChildDirs(gameTemp)
	if err != nil {
		panic(err)
	}
	contentRoot := filepath.Join(gameTemp, contentDirs[0])
	fgutil.EnsureDirExists(gameDirs.GameDir)
	err = fgutil.IfDirExists(gameTemp, func() {
		fgutil.CopyContents(contentRoot, gameDirs.GameDir)
	})
	if err != nil {
		fmt.Printf("Error copying Srcian game files: %s\n", err)
	}
	fmt.Printf("Srcian game files copied to: %s\n", gameDirs.GameDir)
}
