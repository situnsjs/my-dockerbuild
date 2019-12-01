package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	fmt.Println("Hello from server")

	var port string

	if len(os.Args[1]) != 0 {
		port = os.Args[1]
	}
	fmt.Println("PORT", port)
	// server
	server := &http.Server{
		Addr: ":" + port,
	}
	http.HandleFunc("/greeting", greet)
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Helloo World , navigate to /greeting"))
	})

	log.Fatal(server.ListenAndServe())

}
func greet(w http.ResponseWriter, req *http.Request) {
	w.Write([]byte(" Helloo Again !!"))
}
