package router

import "C"
import (
	"github.com/braulio94/datacaixa/controllers"
)

func CreateRoutes(core *controllers.Datacaixa) {
	core.Router.
		HandleFunc("/api/products", core.FetchProducts).
		Queries("group").
		Methods("GET")
}
