package repository

import (
	"fmt"
	"github.com/braulio94/datacaixa/database"
	"github.com/braulio94/datacaixa/types"
	"log"
)

func (r *DatabaseRepository) GetProducts(group, page int) (products []types.Product) {
	n, n1 := pageLength(page)
	rows, err := database.Query(database.ProductsQuery, group, n, n1)
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
	fmt.Print(len(products))
	return products
}

func (r *DatabaseRepository) GetProductGroups() (groups []types.ProductGroup) {
	rows, _ := database.Query(database.ProductGroupsQuery)
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

func pageLength(page int) (n, n2 int) {
	//TODO add algorithm for ...
	return 1, 10
}
