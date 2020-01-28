package types

type OrderItem struct {
	HotelId           int64
	OrderId           int64
	OrderItemId       int64
	ProductId         int64
	UserId            int64
	Sequence          int64
	EntryDateTime     string
	DeliveryDateTime  string
	Quantity          float64
	UnitValue         float64
	TotalValue        float64
	ServiceTax        float64
	ServiceTaxValue   float64
	GeneralTotalValue float64
	Canceled          string
	PreparingTime     int64
	Comment           string
	Printed           string
	Discount          float64
	DiscoultValue     float64
	Accrual           float64
	AccrualValue      float64
}
