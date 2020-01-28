package main

import "github.com/braulio94/datacaixa/repository"

func main() {
	repo := repository.NewRepository()
	repo.GetOrder(32059)
}
