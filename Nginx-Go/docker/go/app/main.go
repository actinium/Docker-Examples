package main

import (
	"fmt"
	"net/http"
	"os"
)

func hostname() string {
	hostname, err := os.Hostname()

	if err == nil {
		return hostname
	}

	return ""
}

func hello(w http.ResponseWriter, req *http.Request) {
	w.Header().Set("X-Server", hostname())
	fmt.Fprintf(w, "Hello World\n")
}

func main() {
	http.HandleFunc("/", hello)
	http.ListenAndServe(":8080", nil)
}
