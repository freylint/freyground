package fgutil

import (
	"fmt"
	"io"
	"os"
	"path/filepath"
)

// DLManifest represents a manifest for downloading game files.
type DLManifest struct {
	url    string
	sha256 string
}

func MakeDLManifest(url, sha256 string) DLManifest {
	return DLManifest{
		url:    url,
		sha256: sha256,
	}
}

// DownloadManifest downloads files based on the provided manifest.
func DownloadManifest(manifest DLManifest) ([]byte, error) {
	
	return []byte{}, nil
}

// Get the path of the current executable.
func GetExecutablePath() (string, error) {
	ex, err := os.Executable()
	if err != nil {
		return "", fmt.Errorf("failed to get executable path: %w", err)
	}
	return filepath.Dir(ex), nil
}

// EnsureParentDirExists ensures the parent directory of the given file path exists.
func EnsureParentDirExists(filePath string) error {
	parentDir := filepath.Dir(filePath)
	return EnsureDirExists(parentDir)
}

// EnsureDirExists ensures that the specified directory exists, creating it if necessary.
func EnsureDirExists(dirPath string) error {
	return os.MkdirAll(dirPath, 0755)
}

// ParentDirExists checks if the parent directory of the given file path exists.
func ParentDirExists(filePath string) (bool, error) {
	return DirExists(filepath.Dir(filePath))
}

func DirExists(dirPath string) (bool, error) {
	info, err := os.Stat(dirPath)
	if err != nil {
		if os.IsNotExist(err) {
			return false, nil // Directory does not exist
		}
		return false, fmt.Errorf("error checking directory: %w", err)
	}
	return info.IsDir(), nil
}

func IfParentDirExists(filePath string, fn func()) error {
	// Get the parent directory of the file path
	parentDir := filepath.Dir(filePath)
	return IfDirExists(parentDir, fn)
}

// IfDirExists executes the provided function if the specified directory exists.
//
// The function will only be executed if the directory exists.
// Handles generic errors related to directory existence checks.
//
// Returns an error if the directory does not exist
// Returns an error if there is an error checking the directory.
func IfDirExists(dirPath string, fn func()) error {
	// Check if the directory exists
	exists, err := DirExists(dirPath)
	if err != nil {
		return fmt.Errorf("error checking directory existence: %w", err)
	}
	if !exists {
		return fmt.Errorf("directory does not exist: %s", dirPath)
	}
	fn()
	return nil
}

// CopyContents copies the contents of the source directory to the destination directory.
func CopyContents(srcDir string, destDir string) error {
	type dirPair struct{ src, dst string }
	stack := []dirPair{{srcDir, destDir}}

	for len(stack) > 0 {
		current := stack[len(stack)-1]
		stack = stack[:len(stack)-1]

		entries, err := os.ReadDir(current.src)
		if err != nil {
			return err
		}

		for _, entry := range entries {
			srcPath := filepath.Join(current.src, entry.Name())
			destPath := filepath.Join(current.dst, entry.Name())

			if entry.IsDir() {
				if err := EnsureDirExists(destPath); err != nil {
					return err
				}
				stack = append(stack, dirPair{srcPath, destPath})
				continue
			}

			if fileExists(destPath) {
				continue // Do not overwrite existing files
			}
			if err := EnsureParentDirExists(destPath); err != nil {
				return err
			}
			if err := copyFile(srcPath, destPath); err != nil {
				return err
			}
		}
	}
	return nil
}

// fileExists returns true if the file at path exists.
func fileExists(path string) bool {
	_, err := os.Stat(path)
	return err == nil
}

// copyFile copies a file from src to dst.
func copyFile(src, dst string) error {
	srcFile, err := os.Open(src)
	if err != nil {
		return err
	}
	defer srcFile.Close()
	dstFile, err := os.Create(dst)
	if err != nil {
		return err
	}
	defer dstFile.Close()
	_, err = io.Copy(dstFile, srcFile)
	return err
}

func GetChildDirs(dir string) ([]string, error) {
	entries, err := os.ReadDir(dir)
	if err != nil {
		return nil, fmt.Errorf("failed to read directory %s: %w", dir, err)
	}

	var childDirs []string
	for _, entry := range entries {
		if entry.IsDir() {
			childDirs = append(childDirs, filepath.Join(dir, entry.Name()))
		}
	}
	return childDirs, nil
}
