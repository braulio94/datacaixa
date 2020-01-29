package repository

import (
	"fmt"
	"github.com/braulio94/datacaixa/database"
	"github.com/braulio94/datacaixa/types"
)

func (r *DatabaseRepository) GetOrder(orderId int) (order types.Order) {
	rows, _ := database.Query(database.SelectOrder, orderId)
	for rows.Next() {
		_ = rows.Scan(&order.OrderId, &order.UserId, &order.TableId, &order.TableStatus, &order.OpeningDate, &order.GeneralTotalAmount)
	}
	fmt.Println(order)
	return order
}

func (r *DatabaseRepository) GetOrderItems(orderId int) (items []types.OrderItem, oi types.OrderItem) {
	rows, _ := database.Query(database.SelectOrderItemsFromOrder, orderId)
	for rows.Next() {
		_ = rows.Scan(
			&oi.HotelId,
			&oi.OrderId,
			&oi.ProductId,
			&oi.UserId,
			&oi.Sequence,
			&oi.Quantity,
			&oi.UnitValue,
			&oi.TotalValue,
		)
		items = append(items, oi)
		fmt.Println(oi)
	}
	fmt.Println("Total rows: ", len(items))
	return items, oi
}

func (r *DatabaseRepository) CreateOrder(userId, tableId, clientId, people int) (order types.Order) {
	formattedQuery := fmt.Sprintf(database.CreateOrder, 1, 1, userId, tableId, clientId, people, "MESA", "Aberta")
	_ = database.Database.QueryRow(formattedQuery).Scan(&order.OrderId, &order.OpeningDate)
	fmt.Println("ORDER: ", order)
	return order
}

func (r *DatabaseRepository) CreateOrderItems(group, page int) (orderItem []types.OrderItem) {

	return
}
