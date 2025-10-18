package fgutil_test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/freylint/fgutil"
)

func createFileWithContent(t *testing.T, dir, name, content string) string {
	if err := os.MkdirAll(dir, 0755); err != nil {
		t.Fatalf("Failed to create dir %s: %v", dir, err)
	}
	filePath := filepath.Join(dir, name)
	if err := os.WriteFile(filePath, []byte(content), 0644); err != nil {
		t.Fatalf("Failed to write file %s: %v", filePath, err)
	}
	return filePath
}

// Helper to check file existence and content in destination
func checkFileInDestination(t *testing.T, dst, fileName, expectedContent string) {
	dstFile := filepath.Join(dst, fileName)
	if _, err := os.Stat(dstFile); os.IsNotExist(err) {
		t.Errorf("Expected file %s to exist in destination, but it does not", dstFile)
	} else {
		content, err := os.ReadFile(dstFile)
		if err != nil {
			t.Fatalf("Failed to read destination file %s: %v", dstFile, err)
		}
		if string(content) != expectedContent {
			t.Errorf("Expected destination file content to be %q, got: %q", expectedContent, string(content))
		}
	}
}

func TestCopyContents_EmptyFolder_NoError(t *testing.T) {
	src := filepath.Join(os.TempDir(), "fgutil_copy_empty_src_")
	dst := filepath.Join(os.TempDir(), "fgutil_copy_empty_dst_")
	defer os.RemoveAll(src)
	defer os.RemoveAll(dst)

	if err := os.MkdirAll(src, 0755); err != nil {
		t.Fatalf("Failed to create empty src dir: %v", err)
	}

	err := fgutil.CopyContents(src, dst)
	if err != nil {
		t.Errorf("Expected no error when copying from empty folder, got: %v", err)
	}
}

func TestCopyContents_DoesNotOverwriteExistingDestination(t *testing.T) {
	src := filepath.Join(os.TempDir(), "fgutil_copy_src_existing_")
	dst := filepath.Join(os.TempDir(), "fgutil_copy_dst_existing_")
	defer os.RemoveAll(src)
	defer os.RemoveAll(dst)

	createFileWithContent(t, src, "file.txt", "src content")
	createFileWithContent(t, dst, "file.txt", "dst content")

	err := fgutil.CopyContents(src, dst)
	if err != nil {
		t.Fatalf("CopyContents failed: %v", err)
	}

	checkFileInDestination(t, dst, "file.txt", "dst content")
}

func TestCopyContents_SourceHasFile_NoError(t *testing.T) {
	src := filepath.Join(os.TempDir(), "fgutil_copy_src_file_")
	dst := filepath.Join(os.TempDir(), "fgutil_copy_dst_file_")
	defer os.RemoveAll(src)
	defer os.RemoveAll(dst)

	fileName := "file.txt"
	fileContent := "hello from src"
	createFileWithContent(t, src, fileName, fileContent)

	err := fgutil.CopyContents(src, dst)
	if err != nil {
		t.Fatalf("Expected no error when copying from source with a file, got: %v", err)
	}

	checkFileInDestination(t, dst, fileName, fileContent)
}
