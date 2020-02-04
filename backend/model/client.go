package model

type Client struct {
	HotelId           int64  `json:"hotel,omitempty"`
	ClientId          int64  `json:"id,omitempty"`
	GroupId           int64  `json:"grupo,omitempty"`
	CompanyId         int64  `json:"empresa,omitempty"`
	CityId            int64  `json:"cidade,omitempty"`
	Name              string `json:"nome,omitempty"`
	Cpf               string `json:"cpf,omitempty"`
	RG                string `json:"rg,omitempty"`
	Address           string `json:"endereco,omitempty"`
	CompleteAddess    string `json:"endereco_completo,omitempty"`
	District          string `json:"bairro,omitempty"`
	Cep               string `json:"cep,omitempty"`
	PhoneNumber       string `json:"telefone,omitempty"`
	Fax               string `json:"fax,omitempty"`
	Email             string `json:"email,omitempty"`
	CellphoneNumber   string `json:"celular,omitempty"`
	BirthPlace        string `json:"naturalidade,omitempty"`
	MaritalStatus     string `json:"estado_civil,omitempty"`
	Partner           string `json:"conjuge,omitempty"`
	Job               string `json:"profissao,omitempty"`
	Comment           string `json:"observacoes,omitempty"`
	BirthDate         string `json:"data_nascimento,omitempty"`
	RegisterDate      string `json:"data_cadastro,omitempty"`
	Photo             string `json:"foto,omitempty"`
	Nationality       string `json:"nacionalidade,omitempty"`
	Gender            string `json:"sexo,omitempty"`
	Passport          string `json:"passporte,omitempty"`
	SendSMS           string `json:"enviar_sms,omitempty"`
	SendEmail         string `json:"enviar_email,omitempty"`
	MarriageDate      string `json:"data_casamento,omitempty"`
	DispatchingAgency string `json:"orgao_expedidor,omitempty"`
	SyncCode          string `json:"codigo_sicronizacao,omitempty"`
	CreditTotal       string `json:"total_creditos,omitempty"`
	CreditLimit       string `json:"limite_creditos,omitempty"`
}
