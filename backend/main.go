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
}
