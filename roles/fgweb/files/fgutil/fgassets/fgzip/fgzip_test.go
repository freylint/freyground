package fgzip_test

import (
	"archive/zip"
	"bytes"
	"os"
	"testing"

	"github.com/freylint/fgutil/fgassets/fgzip"
)

func createValidZipArchive() []byte {
	sample_text := "Hello, World!"
	// Create a zip archive with a file containing sample text.
	buf := new(bytes.Buffer)
	zipWriter := zip.NewWriter(buf)
	// Create sample.txt in the zip archive.
	fileWriter, err := zipWriter.Create("sample.txt")
	if err != nil {
		panic(err)
	}
	// Write sample text to sample.txt.
	_, err = fileWriter.Write([]byte(sample_text))
	if err != nil {
		panic(err)
	}
	// Close the zip writer to finalize the archive.
	if err := zipWriter.Close(); err != nil {
		panic(err)
	}
	// Return the byte slice of the zip archive.
	return buf.Bytes()
}

func createInvalidZipArchive() []byte {
	buf := new(bytes.Buffer)
	// Use a fixed but non-zip pattern to simulate randomness without using rand
	pattern := []byte("THIS_IS_NOT_A_ZIP_FILE_AND_IS_RANDOM_ENOUGH_1234567890!")
	buf.Write(pattern)
	return buf.Bytes()
}

func createNestedZipArchive() ([]byte, map[string]string) {
	buf := new(bytes.Buffer)
	zipWriter := zip.NewWriter(buf)
	// Create nested directories and files
	files := map[string]string{
		"dir1/file1.txt":           "Content 1",
		"dir1/dir2/file2.txt":      "Content 2",
		"dir1/dir2/dir3/file3.txt": "Content 3",
	}
	for name, content := range files {
		fw, err := zipWriter.Create(name)
		if err != nil {
			panic(err)
		}
		_, err = fw.Write([]byte(content))
		if err != nil {
			panic(err)
		}
	}
	if err := zipWriter.Close(); err != nil {
		panic(err)
	}
	return buf.Bytes(), files
}

func makeTempDir() string {
	dir, err := os.MkdirTemp("", "fgutil_test_")
	if err != nil {
		panic(err)
	}
	return dir
}

func TestExtract_ValidArchive_NoError(t *testing.T) {
	validArchive := createValidZipArchive()
	extractor := &fgzip.ZipExtractor{}
	tmp := makeTempDir()
	defer os.RemoveAll(tmp)

	// Attempt to extract
	err := extractor.Extract(validArchive, tmp)
	if err != nil {
		t.Errorf("Expected no error when extracting a valid zip archive, but got: %v", err)
	} else {
		t.Logf("Successfully extracted valid zip archive to %s", tmp)
	}
}

func TestExtract_InvalidArchive_ReturnsError(t *testing.T) {
	invalidArchive := createInvalidZipArchive()
	extractor := &fgzip.ZipExtractor{}

	// Attempt to extract
	err := extractor.Extract(invalidArchive, "test_destination")
	// Check for expected error
	if err == nil {
		t.Errorf("Expected an error when extracting an invalid zip archive, but got nil")
	} else {
		t.Logf("Correctly received error: %v", err)
	}
}

func TestExtract_ExtractsFile_CreatesFile(t *testing.T) {
	validArchive := createValidZipArchive()
	extractor := &fgzip.ZipExtractor{}
	tmp := makeTempDir()
	defer os.RemoveAll(tmp)

	err := extractor.Extract(validArchive, tmp)
	if err != nil {
		t.Fatalf("Expected no error when extracting a valid zip archive, but got: %v", err)
	}

	filePath := tmp + "/sample.txt"
	if _, err := os.Stat(filePath); err != nil {
		t.Fatalf("Expected file %s to exist, but got error: %v", filePath, err)
	}
}

func TestExtract_ExtractsFile_CorrectContent(t *testing.T) {
	validArchive := createValidZipArchive()
	extractor := &fgzip.ZipExtractor{}
	tmp := makeTempDir()
	defer os.RemoveAll(tmp)

	err := extractor.Extract(validArchive, tmp)
	if err != nil {
		t.Fatalf("Expected no error when extracting a valid zip archive, but got: %v", err)
	}

	filePath := tmp + "/sample.txt"
	data, err := os.ReadFile(filePath)
	if err != nil {
		t.Fatalf("Expected file %s to exist, but got error: %v", filePath, err)
	}
	if string(data) != "Hello, World!" {
		t.Errorf("Expected file contents 'Hello, World!', got %q", string(data))
	}
}

func TestExtract_HandlesNestedDirectories(t *testing.T) {
	archive, file_lut := createNestedZipArchive()
	extractor := &fgzip.ZipExtractor{}
	tmp := makeTempDir()
	defer os.RemoveAll(tmp)

	err := extractor.Extract(archive, tmp)
	if err != nil {
		t.Fatalf("Expected no error when extracting nested zip archive, but got: %v", err)
	}

	for expectedPath, expectedContent := range file_lut {
		filePath := tmp + "/" + expectedPath
		data, err := os.ReadFile(filePath)
		if err != nil {
			t.Errorf("Expected file %s to exist, but got error: %v", filePath, err)
			continue
		}
		if string(data) != expectedContent {
			t.Errorf("Expected file contents %q, got %q for %s", expectedContent, string(data), expectedPath)
		}
	}
}
