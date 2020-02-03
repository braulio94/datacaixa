package model

type Product struct {
	HotelId      int64   `json:"hotel_id"`
	Id           int64   `json:"id"`
	UserId       int64   `json:"user_id"`
	Group        int64   `json:"group"`
	CfpopId      int64   `json:"cfpop_id"`
	Code         string  `json:"code"`
	BarCode      string  `json:"bar_code"`
	Description  string  `json:"description"`
	Comment      string  `json:"comment"`
	MinStock     float64 `json:"min_stock"`
	MaxStock     float64 `json:"max_stock"`
	Stock        float64 `json:"stock"`
	CreatedAt    string  `json:"created_at"`
	BuyingPrice  float64 `json:"buying_price"`
	SellingPrice float64 `json:"price"`
	ProfitMargin float64 `json:"profit_margin"`
	IsActive     string  `json:"is_active"`
	StockWatch   string  `json:"stock_watch"`
	Buyings      float64 `json:"buyings"`
	Sales        float64 `json:"sales"`
	Consumption  float64 `json:"consumption"`
	Unit         string  `json:"unit"`
	Outlet       float64 `json:"outlet"`
	IcmsEcf      string  `json:"icms_ecf"`
}
