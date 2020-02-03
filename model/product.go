package model

type Product struct {
	HotelId       int64   `json:"hotel,omitempty"`
	Id            int64   `json:"id,omitempty"`
	UserId        int64   `json:"usuario,omitempty"`
	GroupId       int64   `json:"grupo,omitempty"`
	CfpopId       int64   `json:"cfop,omitempty"`
	Code          string  `json:"codigo,omitempty"`
	BarCode       string  `json:"codigo_barras,omitempty"`
	Description   string  `json:"descricao,omitempty"`
	Comment       string  `json:"observacao,omitempty"`
	MinStock      float64 `json:"estoque_minimo,omitempty"`
	MaxStock      float64 `json:"estoque_maximo,omitempty"`
	Stock         float64 `json:"estoque,omitempty"`
	CreatedAt     string  `json:"data_cadastro,omitempty"`
	Cost          float64 `json:"custo,omitempty"`
	Price         float64 `json:"preco,omitempty"`
	ProfitMargin  float64 `json:"margem_lucro,omitempty"`
	IsActive      string  `json:"activo,omitempty"`
	StockWatch    string  `json:"controla_estoque,omitempty"`
	Buyings       float64 `json:"total_compras,omitempty"`
	Sales         float64 `json:"total_vendas,omitempty"`
	Consumption   float64 `json:"total_consumo,omitempty"`
	Unit          string  `json:"unidade,omitempty"`
	Outlet        float64 `json:"total_saida,omitempty"`
	IcmsEcf       string  `json:"icms_ecf,omitempty"`
	Tax           float64 `json:"imposto,omitempty"`
	FederalTax    float64 `json:"imposto_federal,omitempty"`
	StateTax      float64 `json:"imposto_estadual,omitempty"`
	MunicipalTax  float64 `json:"imposto_municipal,omitempty"`
	TaxSource     float64 `json:"fonte_imposto,omitempty"`
	PreparingTime int64   `json:"tempo_preparo,omitempty"`
	Discrete      string  `json:"descritivo,omitempty"`
	ServiceTax    float64 `json:"taxa_servico,omitempty"`
	Alcohool      string  `json:"bebida_alcoolica,omitempty "`
	Spotlight     string  `json:"destaque,omitempty"`
}
