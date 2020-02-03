package router

import (
	"github.com/braulio94/datacaixa/controllers"
)

func RegisterRoutes(core *controllers.Datacaixa) {
	core.Router.HandleFunc("/api/products/{group}", core.FetchProducts).Methods("GET").Queries("page", "{pageNumber}")
	core.Router.HandleFunc("/api/products/search/{description}", core.FetchProducts).Methods("GET")
	core.Router.HandleFunc("/api/product/{id}", core.FetchProduct).Methods("GET")

}
