package model

type User struct {
	HotelId			int		`json:"id_hotel,omitempty"`
	UserId			int 	`json:"id_usuario,omitempty"`
	UserName		string 	`json:"usuario,omitempty"`
	Name			string	`json:"nome,omitempty"`
	Password		string	`json:"senha,omitempty"`
	Email			string	`json:"email,omitempty"`
}
