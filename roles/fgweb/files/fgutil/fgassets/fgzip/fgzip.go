package fgzip

import (
	"archive/zip"
	"bytes"
	"io"
	"os"
	"path/filepath"

	"github.com/freylint/fgutil"
)

func ExtractZip(archive []byte, dest string) error {
	// Create a new ZipExtractor instance
	extractor := &ZipExtractor{}
	// Use the Extract method to extract the archive to the destination
	return extractor.Extract(archive, dest)
}

// ZipExtractor implements the Extractor interface for zip archives.
type ZipExtractor struct{}

// Extract extracts all files from the zip archive to the destination,
// creating files with the correct name and location.
func (z *ZipExtractor) Extract(archive []byte, dest string) error {
	// Create a new zip reader from the archive bytes
	reader, err := zip.NewReader(bytes.NewReader(archive), int64(len(archive)))
	if err != nil {
		return err // Return error if the archive is not a valid zip
	}
	// Iterate over each file in the zip archive
	for _, f := range reader.File {
		// Skip directories
		if f.FileInfo().IsDir() {
			continue
		}
		// Extract the zip file entry
		if err := extractZipFileEntry(f, dest); err != nil {
			return err
		}
	}
	return nil // Extraction successful
}

// extractZipFileEntry extracts a single file entry from a zip archive to the destination directory.
func extractZipFileEntry(f *zip.File, dest string) error {
	// Build the full path for the extracted file
	filePath := filepath.Join(dest, f.Name)
	// Ensure the parent directory exists
	if err := fgutil.EnsureParentDirExists(filePath); err != nil {
		return err
	}
	// Open the file inside the zip archive
	rc, err := f.Open()
	if err != nil {
		return err
	}
	defer rc.Close() // Defer closing until function returns
	// Create the destination file
	out, err := os.Create(filePath)
	if err != nil {
		return err
	}
	defer out.Close() // Defer closing until function returns
	// Copy the contents from the zip file to the destination file
	_, err = io.Copy(out, rc)
	if err != nil {
		return err
	}
	return nil // Extraction of the file entry successful
}
