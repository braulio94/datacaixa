package repository

import (
	"fmt"
	"github.com/braulio94/datacaixa/backend/database"
	"github.com/braulio94/datacaixa/backend/model"
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
	n, n1 := PageLength(1)
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

func (r *DatabaseRepository) GetTopProducts(page int) (products []model.Product) {
	n, n1 := PageLength(page)
	rows, err := database.Query(database.SelectTopSoldProducts, n, n1)
	if err != nil {
		log.Fatalf("Could not load ROWS: %v", err)
		return nil
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

func (r *DatabaseRepository) GetProductsByDescription(page int) (products []model.Product) {
	n, n1 := PageLength(page)
	rows, _ := database.Query(database.SelectDescriptionProducts, n, n1)
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

func (r *DatabaseRepository) GetMostRecentProducts(page int) (products []model.Product) {
	n, n1 := PageLength(page)
	rows, _ := database.Query(database.SelectMostRecentProducts, n, n1)
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
