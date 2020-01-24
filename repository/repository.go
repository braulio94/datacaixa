package repository

import (
	"database/sql"
	"fmt"
	"github.com/braulio94/datacaixa/types"
	"github.com/braulio94/datacaixa/database"
	"log"
)

type Repository interface {
	GetProducts(group, page int) []types.Product
}

type DatabaseRepository struct {
	DB *sql.DB
}

func NewRepository() *DatabaseRepository {
	database.InitFirebirdDB()
	return &DatabaseRepository{DB: database.Database}
}

func (r *DatabaseRepository) GetProducts(group, page int) (products []types.Product) {
	rows, err := database.Query(database.ProductsQuery, group, page, 2)
	if err != nil {
		log.Fatalf("Could not load ROWS: %v", err)
	}
	defer rows.Close()
	var p = types.Product{}
	for rows.Next() {
		_ = rows.Scan(
			&p.Id,
			&p.Group,
			&p.Description,
			&p.Price,
			&p.Sales,
		)
	}
	products = append(products, p)
	fmt.Print(products)
	return products
}