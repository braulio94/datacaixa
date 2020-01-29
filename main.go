package main

import "github.com/braulio94/datacaixa/repository"

func main() {
	repo := repository.NewRepository()
	//repo.GetProducts(19, 1)
	//repo.GetOrder(32059)
	//repo.GetOrderItems(32059)
	repo.CreateOrder(2, 1, 104, 1)
}
