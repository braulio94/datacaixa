package mock

import "github.com/braulio94/datacaixa/types"

func GetOrder() types.Order {
	return types.Order{
		HotelId:            1,
		OrderId:            0,
		PDVId:              1,
		UserId:             2,
		ChargeId:           0,
		TableId:            1,
		ClientId:           104,
		AccomodationId:     0,
		RoomId:             0,
		AccountTypeId:      0,
		EmployeeId:         0,
		OpeningDate:        "",
		ClosingDate:        "",
		TotalAmount:        1000,
		ServiceTax:         0,
		GeneralTotalAmount: 0,
		People:             2,
		Status:             "Aberta",
		TableStatus:        "Aberta",
		DiscountValue:      "",
		AccrualValue:       0,
		Comment:            "",
		Discount:           0,
		Accrual:            0,
		DelivererId:        0,
		DeliveryStatus:     "",
		DeliveryDate:       "",
		DeliveryTime:       "",
		Type:               "MESA",
	}
}