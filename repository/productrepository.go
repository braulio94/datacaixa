package repository

import (
	"fmt"
	"github.com/braulio94/datacaixa/database"
	"github.com/braulio94/datacaixa/types"
	"log"
)

func (r *DatabaseRepository) GetProducts(group, page int) (products []types.Product) {
	n, n1 := PageLength(page)
	rows, err := database.Query(database.SelectProductsFromGroup, group, n, n1)
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
		products = append(products, p)
		fmt.Println(p)
	}
	fmt.Println(len(products))
	return products
}

func (r *DatabaseRepository) GetProductGroups() (groups []types.ProductGroup) {
	rows, _ := database.Query(database.SelectProductGroups)
	g := types.ProductGroup{}
	for rows.Next() {
		_ = rows.Scan(
			&g.HotelId,
			&g.ProductGroupId,
			&g.Description,
			&g.DisplayProduct,
			&g.Code,
			&g.Printer,
			&g.Printer2,
		)
		groups = append(groups, g)
		fmt.Println(g)
	}
	return groups
}
