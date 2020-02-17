package router

import (
	"github.com/braulio94/datacaixa/backend/controllers"
)

func RegisterRoutes(core *controllers.Datacaixa) {
	core.Router.HandleFunc("/api/products/{group}", core.FetchProductsByGroup).Methods("GET").Queries("page", "{pageNumber}", "orderBy", "{order}")
	core.Router.HandleFunc("/api/products", core.FetchProductsInOrder).Methods("GET").Queries("page", "{pageNumber}", "orderBy", "{order}")
	core.Router.HandleFunc("/api/products/search/{description}", core.SearchProducts).Methods("GET")
	core.Router.HandleFunc("/api/product/{id}", core.FetchProduct).Methods("GET")
	core.Router.HandleFunc("/api/groups", core.FetchProductGroups).Methods("GET")
	core.Router.HandleFunc("/api/table/{id}", core.FetchTable).Methods("GET")
	core.Router.HandleFunc("/api/tables", core.FetchTables).Methods("GET")
	core.Router.HandleFunc("/api/order/{id}", core.FetchOrder).Methods("GET").Queries("withItems", "{withItems}")
	core.Router.HandleFunc("/api/orders", core.FetchOrders).Methods("GET")
	core.Router.HandleFunc("/api/orders", core.FetchOrders).Methods("GET")
	core.Router.HandleFunc("/api/order/{id}/items", core.FetchOrderItems).Methods("GET")
	core.Router.HandleFunc("/api/order", core.CreateNewOrder).Methods("PUT")
	core.Router.HandleFunc("/api/order/{orderId}/item", core.CreateNewOrderItem).Methods("PUT")
	core.Router.HandleFunc("/api/order/{orderId}/item", core.UpdateOrderItem).Methods("POST")
	core.Router.HandleFunc("/api/order/item/{id}", core.DeleteOrderItem).Methods("DELETE")
	core.Router.HandleFunc("/api/clients", core.FetchClients).Methods("GET").Queries("page", "{pageNumber}")
	core.Router.HandleFunc("/api/clients/search/{name}", core.FetchClients).Methods("GET")
	core.Router.HandleFunc("/api/client/{id}", core.FetchClient).Methods("GET")
	core.Router.HandleFunc("/api/user/{id}", core.FetchUser).Methods("GET")
	core.Router.HandleFunc("/api/user/login", core.LoginUser).Methods("POST")
	core.Router.HandleFunc("/api/users", core.FetchUsers).Methods("GET")
}
