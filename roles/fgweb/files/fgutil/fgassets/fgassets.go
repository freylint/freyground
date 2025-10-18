package fgassets

import (
	"net/http"
)

type Extractor interface {
	// Extract extracts the contents of the archive to the specified destination directory.
	ExtractArchive(archive []byte, dest string) error
}
