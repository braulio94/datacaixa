package model

type Order struct {
	HotelId            int64   `json:"hotel,omitempty"`
	OrderId            int64   `json:"id,omitempty"`
	PDVId              int64   `json:"pdv,omitempty"`
	UserId             int64   `json:"usuario,omitempty"`
	ChargeId           int64   `json:"comanda,omitempty"`
	TableId            int64   `json:"mesa,omitempty"`
	ClientId           int64   `json:"cliente,omitempty"`
	AccomodationId     int64   `json:"hospedagem,omitempty"`
	RoomId             int64   `json:"quarto,omitempty"`
	AccountTypeId      int64   `json:"tipo_conta,omitempty"`
	EmployeeId         int64   `json:"funcionario,omitempty"`
	OpeningDate        string  `json:"data_abertura,omitempty"`
	ClosingDate        string  `json:"data_fecho,omitempty"`
	TotalAmount        float64 `json:"valor_total,omitempty"`
	ServiceTax         float64 `json:"taxa_servico,omitempty"`
	GeneralTotalAmount float64 `json:"valor_total_geral,omitempty"`
	People             int64   `json:"quantidade_pessoas,omitempty"`
	Status             string  `json:"situacao,omitempty"`
	TableStatus        string  `json:"situacao_mesa,omitempty"`
	DiscountValue      string  `json:"valor_desconto,omitempty"`
	AccrualValue       float64 `json:"valor_acrescimo,omitempty"`
	Comment            string  `json:"observacao,omitempty"`
	Discount           float64 `json:"desconto,omitempty"`
	Accrual            float64 `json:"acrescimo,omitempty"`
	DelivererId        int64   `json:"entregador,omitempty"`
	DeliveryStatus     string  `json:"situacao_entrega,omitempty"`
	DeliveryDate       string  `json:"data_entrega,omitempty"`
	DeliveryTime       string  `json:"hora_entrega,omitempty"`
	Type               string  `json:"tipo,omitempty"`
}
