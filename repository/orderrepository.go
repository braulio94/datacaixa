package repository

import (
	"fmt"
	"github.com/braulio94/datacaixa/database"
	"github.com/braulio94/datacaixa/model"
)

func (r *DatabaseRepository) GetOrder(orderId int) (order model.Order) {
	rows, _ := database.Query(database.SelectOrder, orderId)
	for rows.Next() {
		_ = rows.Scan(&order.OrderId, &order.UserId, &order.TableId, &order.TableStatus, &order.OpeningDate, &order.GeneralTotalAmount)
	}
	fmt.Println(order)
	return order
}

func (r *DatabaseRepository) GetOpenOrders() (orders []model.Order) {
	rows, _ := database.Query(database.SelectOpenOrders)
	var order model.Order
	for rows.Next() {
		_ = rows.Scan(&order.OrderId, &order.UserId, &order.TableId, &order.TableStatus, &order.OpeningDate, &order.GeneralTotalAmount)
		orders = append(orders, order)
	}
	return orders
}

func (r *DatabaseRepository) GetOrderItems(orderId int) (items []model.OrderItem) {
	rows, _ := database.Query(database.SelectOrderItemsFromOrder, orderId)
	var oi model.OrderItem
	for rows.Next() {
		_ = rows.Scan(
			&oi.OrderItemId,
			&oi.OrderId,
			&oi.ProductId,
			&oi.Sequence,
			&oi.Quantity,
			&oi.UnitValue,
			&oi.TotalValue,
		)
		oi.Product = r.GetSingleProduct(oi.ProductId)
		items = append(items, oi)
		fmt.Println(oi)
	}
	fmt.Println("Total rows: ", len(items))
	return items
}

func (r *DatabaseRepository) CreateOrder(new model.Order) (order model.Order) {
	formattedQuery := fmt.Sprintf(database.InsertOrder, new.HotelId, new.PDVId, new.UserId, new.TableId, new.ClientId, new.People, new.Type, new.TableStatus)
	_ = database.Database.QueryRow(formattedQuery).Scan(&order.OrderId, &order.OpeningDate)
	fmt.Println("ORDER: ", order)
	return order
}

func (r *DatabaseRepository) CreateOrderItem(new model.OrderItem) (orderItem model.OrderItem) {
	formattedQuery := fmt.Sprintf(database.InsertOrderItem, new.HotelId, new.OrderId, new.ProductId, new.UserId, new.Sequence, new.Quantity, new.UnitValue, new.TotalValue)
	_ = database.Database.QueryRow(formattedQuery).Scan(&orderItem.OrderItemId)
	fmt.Println("ORDER ITEM: ", orderItem)
	return orderItem
}

//TODO
func (r *DatabaseRepository) DeleteOrderItem(id int) {

}

//TODO
func (r *DatabaseRepository) UpdateOrder(id int) {

}
