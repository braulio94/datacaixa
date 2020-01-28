package types

type Order struct {
	HotelId            int64
	OrderId            int64
	PDVId              int64
	UserId             int64
	ChargeId           int64
	TableId            int64
	ClientId           int64
	AccomodationId     int64
	RoomId             int64
	AccountTypeId      int64
	EmployeeId         int64
	OpeningDate        string
	ClosingDate        string
	TotalAmount        float64
	ServiceTax         float64
	GeneralTotalAmount float64
	People             int64
	Status             string
	TableStatus        string
	DiscountValue      string
	AccrualValue       float64
	Comment            string
	Discount           float64
	Accrual            float64
	DelivererId        int64
	DeliveryStatus     string
	DeliveryDate       string
	DeliveryTime       string
	Type               string
}
