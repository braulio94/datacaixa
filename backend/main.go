package main

import (
	"github.com/braulio94/datacaixa/backend/controllers"
	"github.com/braulio94/datacaixa/backend/router"
	"net/http"
)

func main() {
	core := controllers.NewCore()
	router.RegisterRoutes(core)
	_ = http.ListenAndServe(":9090", core.Router)
}
