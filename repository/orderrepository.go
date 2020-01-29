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

func (r *DatabaseRepository) CreateOrder(new types.Order) (order types.Order) {
	formattedQuery := fmt.Sprintf(database.CreateOrder, new.HotelId, new.PDVId, new.UserId, new.TableId, new.ClientId, new.People, new.Type, new.TableStatus)
	_ = database.Database.QueryRow(formattedQuery).Scan(&order.OrderId, &order.OpeningDate)
	fmt.Println("ORDER: ", order)
	return order
}

func (r *DatabaseRepository) CreateOrderItem(new types.OrderItem) (orderItem types.OrderItem) {
	formattedQuery := fmt.Sprintf(database.CreateOrderItem, new.HotelId.Int64, new.OrderId, new.ProductId, new.UserId.Int64, new.Sequence, new.Quantity, new.UnitValue, new.TotalValue)
	_ = database.Database.QueryRow(formattedQuery).Scan(&orderItem.OrderItemId)
	fmt.Println("ORDER ITEM: ", orderItem)
	return orderItem
}
