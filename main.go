package main

import (
	"fmt"
	"github.com/braulio94/datacaixa/controllers"
	"github.com/braulio94/datacaixa/router"
	"log"
	"os"
)

func main() {
	core := controllers.NewCore()
	router.CreateRoutes(core)
	go func() {
		fmt.Println("Starting server on port 9090")

		err := core.Server.ListenAndServe()
		if err != nil {
			log.Fatalf("Error starting server: %s\n", err)
			os.Exit(1)
		}
	}()
}
