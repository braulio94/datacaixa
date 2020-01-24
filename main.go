package main

import "github.com/braulio94/datacaixa/repository"

func main() {
	repo := repository.NewRepository()
	repo.GetProducts(19, 1)
}
