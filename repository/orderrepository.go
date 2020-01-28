package repository

import (
	"fmt"
	"github.com/braulio94/datacaixa/database"
	"github.com/braulio94/datacaixa/types"
)

func (r *DatabaseRepository) GetOrder(orderId int) (order types.Order) {
	rows, _ := database.Query(database.GetOrderQuery, orderId)
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

func (r *DatabaseRepository) CreateOrder() (order types.Order) {
	return
}

func (r *DatabaseRepository) CreateOrderItems(group, page int) (orderItem []types.OrderItem) {
	return
}
