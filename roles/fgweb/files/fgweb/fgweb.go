package main

import (
	"fmt"
	"log"
	"net/http"

	i18n "github.com/freylint/fgutil/fgi18n"
)

// WriteResponse writes a translated message (by key) to the http.ResponseWriter.
// It looks up the translation for the given key and language, and writes it as a line.
func WriteResponse(w http.ResponseWriter, key string, lang string) {
	fmt.Fprintf(w, "%s\n", i18n.GetTranslation(lang, key))
}

func helpHandler(w http.ResponseWriter, r *http.Request) {
	lang := i18n.GetLangFromRequest(r)
	WriteResponse(w, "help_title", lang)
	WriteResponse(w, "route_root", lang)
	WriteResponse(w, "route_help", lang)
}

func main() {

	http.HandleFunc("/favicon.ico", http.NotFound)
	http.HandleFunc("/", helpHandler)

	log.Println("Starting server on :8080...")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatalf("Server failed: %v", err)
	}
}
