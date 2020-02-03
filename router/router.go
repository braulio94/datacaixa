package router

import (
	"github.com/braulio94/datacaixa/controllers"
)

func CreateRoutes(core *controllers.Datacaixa) {
	core.Router.
		HandleFunc("/api/products/{group}", core.FetchProducts).
		Methods("GET").
		Queries("page", "{pageNumber}")
}
