package repository

import (
	"fmt"
	"github.com/braulio94/datacaixa/database"
	"github.com/braulio94/datacaixa/model"
	"log"
)

func (r *DatabaseRepository) GetProductsByGroup(groupId, page int) (products []model.Product) {
	n, n1 := PageLength(page)
	rows, err := database.Query(database.SelectProductsFromGroup, groupId, n, n1)
	if err != nil {
		log.Fatalf("Could not load ROWS: %v", err)
		return nil
	}
	var p = model.Product{}
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

func (r *DatabaseRepository) SearchProducts(description string) (products []model.Product) {
	n, n1 := PageLength(1)
	description = `%` + description + `%`
	rows, _ := database.Query(database.SelectProductsLike, description, n, n1)
	var p = model.Product{}
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

func (r *DatabaseRepository) GetProductGroups() (groups []model.ProductGroup) {
	rows, _ := database.Query(database.SelectProductGroups)
	g := model.ProductGroup{}
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
