package router

import (
	"github.com/braulio94/datacaixa/controllers"
)

func RegisterRoutes(core *controllers.Datacaixa) {
	core.Router.HandleFunc("/api/products/{group}", core.FetchProducts).Methods("GET").Queries("page", "{pageNumber}")
	core.Router.HandleFunc("/api/products/search/{description}", core.FetchProducts).Methods("GET")
	core.Router.HandleFunc("/api/product/{id}", core.FetchProduct).Methods("GET")
	core.Router.HandleFunc("/api/categories", core.FetchCategories).Methods("GET")
	core.Router.HandleFunc("/api/table/{id}", core.FetchTable).Methods("GET")
	core.Router.HandleFunc("/api/tables", core.FetchTables).Methods("GET")
	core.Router.HandleFunc("/api/order/{id}", core.FetchOrder).Methods("GET")
	core.Router.HandleFunc("/api/orders", core.FetchOrders).Methods("GET")
	core.Router.HandleFunc("/api/orders", core.FetchOrders).Methods("GET")
	core.Router.HandleFunc("/api/order/{id}/items", core.FetchOrderItems).Methods("GET")
}
