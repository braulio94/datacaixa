package model

type OrderItem struct {
	HotelId           int64   `json:"hotel,omitempty"`
	OrderItemId       int64   `json:"id,omitempty"`
	OrderId           int     `json:"pedido,omitempty"`
	ProductId         int     `json:"-"`
	Product           Product `json:"produto,omitempty"`
	UserId            int     `json:"usuario,omitempty"`
	Sequence          int64   `json:"sequencia,omitempty"`
	EntryDateTime     string  `json:"data_lancto,omitempty"`
	DeliveryDateTime  string  `json:"data_entrega,omitempty"`
	Quantity          float64 `json:"quantidade,omitempty"`
	UnitValue         float64 `json:"valor_unitario,omitempty"`
	TotalValue        float64 `json:"valor_total,omitempty"`
	ServiceTax        float64 `json:"taxa_servico,omitempty"`
	ServiceTaxValue   float64 `json:"valor_taxa_servico,omitempty"`
	GeneralTotalValue float64 `json:"valor_total_geral,omitempty"`
	Canceled          string  `json:"cancelado,omitempty"`
	PreparingTime     int64   `json:"tempo_preparo,omitempty"`
	Comment           string  `json:"observacao,omitempty"`
	Printed           string  `json:"impresso,omitempty"`
	Discount          float64 `json:"desconto,omitempty"`
	DiscoultValue     float64 `json:"valor_desconto,omitempty"`
	Accrual           float64 `json:"acrescimo,omitempty"`
	AccrualValue      float64 `json:"valor_acrescimo,omitempty"`
}
