package fgi18n

import "net/http"

var supportedLanguages = []string{"en", "es", "fr", "de", "zh"}

func GetLang(lang string) string {
	for _, l := range supportedLanguages {
		if lang == l {
			return l
		}
	}
	return "en"
}

func GetTranslation(lang, key string) string {
	english := map[string]string{
		"help_title": "Available routes:",
		"route_root": "/            - Alias for /help",
		"route_help": "/help       - List available routes (this page)",
	}
	if val, ok := english[key]; ok {
		return val
	}
	return key
}

// GetLangFromRequest extracts the language from the request's query parameters and returns the supported language.
func GetLangFromRequest(r *http.Request) string {
	lang := r.URL.Query().Get("lang")
	return GetLang(lang)
}
