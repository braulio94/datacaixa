package repository

import (
	"fmt"
	"github.com/braulio94/datacaixa/backend/database"
	"github.com/braulio94/datacaixa/backend/model"
)

func (r *DatabaseRepository) GetOrder(orderId int, withItems bool) (order model.Order) {
	rows, _ := database.Query(database.SelectOrder, orderId)
	for rows.Next() {
		_ = rows.Scan(&order.OrderId, &order.ClientId, &order.UserId, &order.TableId, &order.TableStatus, &order.OpeningDate, &order.GeneralTotalAmount)
	}
	order.Client = r.GetClient(order.ClientId)
	if withItems {
		order.OrderItems = r.GetOrderItems(orderId)
	}

	return order
}

//TODO create get recently closed orders method

func (r *DatabaseRepository) GetOpenOrders() (orders []model.Order) {
	rows, _ := database.Query(database.SelectOpenOrders)
	var order model.Order
	for rows.Next() {
		_ = rows.Scan(&order.OrderId, &order.UserId, &order.TableId, &order.TableStatus, &order.OpeningDate, &order.GeneralTotalAmount, &order.ClientId)
		order.Client = r.GetClient(order.ClientId)
		orders = append(orders, order)
	}
	return orders
}

func (r *DatabaseRepository) GetOrderItems(orderId int) (items []model.OrderItem) {
	rows, _ := database.Query(database.SelectOrderItemsFromOrder, orderId)
	oi := model.OrderItem{}
	for rows.Next() {
		_ = rows.Scan(
			&oi.OrderItemId,
			&oi.OrderId,
			&oi.ProductId,
			&oi.Sequence,
			&oi.Quantity,
			&oi.UnitValue,
			&oi.TotalValue,
			&oi.EntryDateTime,
		)
		oi.Product = r.GetSingleProduct(oi.ProductId)
		items = append(items, oi)
	}
	fmt.Println("Total rows: ", len(items))
	return items
}

func (r *DatabaseRepository) GetOrderItemsCount(orderId int) (count int) {
	formattedQuery := fmt.Sprintf(database.SelectOrderItemsCount, orderId)
	_ = database.Database.QueryRow(formattedQuery).Scan(&count)
	return count
}

func (r *DatabaseRepository) CreateOrder(new model.Order) (order model.Order) {
	formattedQuery := fmt.Sprintf(database.InsertOrder, new.HotelId, new.PDVId, new.UserId, new.TableId, new.ClientId, new.People, new.Type, new.TableStatus)
	_ = database.Database.QueryRow(formattedQuery).Scan(&order.OrderId, &order.OpeningDate, &order.ClientId)
	order.Client = r.GetClient(order.ClientId)
	fmt.Println("ORDER: ", order)
	return order
}

func (r *DatabaseRepository) CreateOrderItem(new model.OrderItem, orderId int) (orderItem model.OrderItem) {
	count := r.GetOrderItemsCount(orderId)
	orderItem.Product = r.GetSingleProduct(new.ProductId)
	value := new.Quantity * orderItem.Product.Price
	formattedQuery := fmt.Sprintf(database.InsertOrderItem, orderId, orderItem.Product.Id, new.UserId, count+1, new.Quantity, orderItem.Product.Price, value)
	_ = database.Database.QueryRow(formattedQuery).Scan(
		&orderItem.OrderId,
		&orderItem.OrderItemId,
		&orderItem.UserId,
		&orderItem.Sequence,
		&orderItem.Quantity,
		&orderItem.UnitValue,
		&orderItem.TotalValue,
		&orderItem.EntryDateTime,
	)
	fmt.Println(orderItem)
	return orderItem
}

func (r *DatabaseRepository) DeleteOrderItem(id int) {
	formattedQuery := fmt.Sprintf(database.DeleteOrderItem, id)
	_ = database.Database.QueryRow(formattedQuery)
}

func (r *DatabaseRepository) UpdateOrder(id int) {

}
