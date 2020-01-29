package main

import (
	"github.com/braulio94/datacaixa/repository"
)

func main() {
	repo := repository.NewRepository()
	//repo.GetProducts(19, 1)
	//repo.GetOrder(32059)
	//repo.GetOrderItems(32059)
	//order := mock.GetOrder()
	//repo.CreateOrder(order)
	//repo.GetTable(48)
	//repo.GetTables()
	repo.GetClient(104)
	repo.GetClients(1)
}
