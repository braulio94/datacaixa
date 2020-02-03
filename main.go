package main

import (
	"github.com/braulio94/datacaixa/controllers"
	"github.com/braulio94/datacaixa/router"
	"net/http"
)

func main() {
	core := controllers.NewCore()
	router.RegisterRoutes(core)
	_ = http.ListenAndServe(":9090", core.Router)
	//go func() {
	//	fmt.Println("Starting server on port 9090")
	//	err := http.ListenAndServe(":9090", core.Router)
	//	if err != nil {
	//		log.Fatalf("Error starting server: %s\n", err)
	//		os.Exit(1)
	//	}
	//}()
}
