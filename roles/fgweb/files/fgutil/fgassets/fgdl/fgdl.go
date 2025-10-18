package fgdl

type Downloader interface {
	// DownloadFile downloads a file from the specified asset URL and saves it to the destination path.
	DownloadFile(url string, checksum_url string, dest string) error
	DownloadSum(url string) (Checksum, error)
}

type Checksum struct {
	Type  string // e.g., "sha256", "md5"
	Sum   string // the actual checksum value
}

// HTTPSDownloader implements the Downloader interface for HTTPS URLs.
type HTTPSDownloader struct {
	Client *http.Client
}

func NewHTTPSDownloader() *HTTPSDownloader {
	return &HTTPSDownloader{
		Client: &http.Client{},
	}
}

func (d *HTTPSDownloader) DownloadFile(url string, checksum_url string, dest string) error {
	// TODO: Implement file download and checksum verification
	return nil
}

func (d *HTTPSDownloader) DownloadSum(url string) (Checksum, error) {
	// TODO: Implement checksum download and parsing
	return Checksum{}, nil
}
