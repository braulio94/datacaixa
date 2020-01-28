package repository

import (
	"fmt"
	"github.com/braulio94/datacaixa/database"
	"github.com/braulio94/datacaixa/types"
)

func (r *DatabaseRepository) GetOrder(orderId int) (order types.Order) {
	rows, _ := database.Query(database.SelectOrder, orderId)
	for rows.Next() {
		//_ = rows.Scan(&order.HotelId, &order.OrderId, &order.PDVId, &order.UserId, &order.ChargeId, &order.TableId,
		//	&order.ClientId, &order.AccomodationId, &order.RoomId, &order.AccountTypeId, &order.EmployeeId, &order.OpeningDate,
		//	&order.ClosingDate, &order.TotalAmount, &order.ServiceTax, &order.GeneralTotalAmount, &order.People, &order.Status,
		//	&order.TableStatus, &order.DiscountValue, &order.AccrualValue, &order.Comment, &order.Discount, &order.Accrual,
		//	&order.DelivererId, &order.DeliveryStatus, &order.DeliveryDate, &order.DeliveryTime, &order.Type)
		_ = rows.Scan(&order.OrderId, &order.UserId, &order.TableId, &order.TableStatus, &order.OpeningDate, &order.GeneralTotalAmount)
	}
	fmt.Println(order)
	return order
}

func (r *DatabaseRepository) GetOrderItems(orderId int) (items []types.OrderItem) {
	rows, _ := database.Query(database.SelectOrderItemsFromOrder, orderId)
	oi := types.OrderItem{}
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
	return items
}

func (r *DatabaseRepository) CreateOrder() (order types.Order) {
	return
}

func (r *DatabaseRepository) CreateOrderItems(group, page int) (orderItem []types.OrderItem) {
	return
}
