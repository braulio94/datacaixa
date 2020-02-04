package model

type ProductGroup struct {
	HotelId        int64  `json:"hotel,omitempty"`
	ProductGroupId int64  `json:"id,omitempty"`
	Description    string `json:"descricao,omitempty"`
	DisplayProduct string `json:"exibir,omitempty"`
	Code           int64  `json:"codigo,omitempty"`
	Printer        string `json:"impressora1,omitempty"`
	Printer2       string `json:"impressora2,omitempty"`
}
