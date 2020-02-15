package repository

import (
	"database/sql"
	"fmt"
	"github.com/braulio94/datacaixa/backend/database"
	"github.com/braulio94/datacaixa/backend/model"
	"github.com/braulio94/datacaixa/backend/util"
	"log"
)

func (r *DatabaseRepository) GetProductsByGroup(groupId, page int, order string) (products []model.Product) {
	n, n1 := util.PageLength(page)
	order, from := util.SqlOrder(order)
	rows, err := database.Query(database.SelectProductsFromGroup, groupId, order, from, n, n1)
	if err != nil {
		log.Fatalf("Could not load ROWS: %v", err)
		return nil
	}
	var p = model.Product{}
	for rows.Next() {
		_ = rows.Scan(
			&p.Id,
			&p.GroupId,
			&p.Description,
			&p.Price,
			&p.Sales,
			&p.CreatedAt,
		)
		products = append(products, p)
		fmt.Println(p)
	}
	fmt.Println(len(products))
	return products
}

func (r *DatabaseRepository) GetSingleProduct(id int) (product model.Product) {
	rows, _ := database.Query(database.SelectProduct, id)
	for rows.Next() {
		_ = rows.Scan(
			&product.Id,
			&product.GroupId,
			&product.Description,
			&product.Price,
			&product.Sales,
			&product.CreatedAt,
		)
	}
	return product
}

func (r *DatabaseRepository) SearchProducts(description string) (products []model.Product) {
	n, n1 := util.PageLength(1)
	description = `%` + description + `%`
	rows, _ := database.Query(database.SelectProductsLike, description, n, n1)
	var p = model.Product{}
	for rows.Next() {
		_ = rows.Scan(
			&p.Id,
			&p.GroupId,
			&p.Description,
			&p.Price,
			&p.Sales,
			&p.CreatedAt,
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

func (r *DatabaseRepository) GetProductsOrderedBy(page int, order string) (products []model.Product) {
	n, n1 := util.PageLength(page)
	order, from := util.SqlOrder(order)
	var rows *sql.Rows
	if order == `recentlySold` {
		rows, _ = database.Query(database.SelectProductsRecentlySold, n, n1)
	} else {
		rows, _ = database.Query(database.SelectProductsOrderedBy, order, from, n, n1)
	}
	var product = model.Product{}
	for rows.Next() {
		_ = rows.Scan(
			&product.Id,
			&product.GroupId,
			&product.Description,
			&product.Price,
			&product.Sales,
			&product.CreatedAt,
		)
		products = append(products, product)
	}
	return products
}