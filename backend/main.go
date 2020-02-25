package main

import (
	"github.com/braulio94/datacaixa/backend/controllers"
	"github.com/braulio94/datacaixa/backend/router"
	"github.com/rs/cors"
	"net/http"
)

func main() {
	core := controllers.NewCore()
	router.RegisterRoutes(core)
	handler := cors.Default().Handler(core.Router)
	_ = http.ListenAndServe(":9090", handler)
}
