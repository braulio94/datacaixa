package repository

import (
	"fmt"
	"github.com/braulio94/datacaixa/backend/database"
	"github.com/braulio94/datacaixa/backend/model"
	"github.com/braulio94/datacaixa/backend/util"
)

func (r *DatabaseRepository) GetClient(clientId int) (client model.Client) {
	formattedQuery := fmt.Sprintf(database.SelectClient, clientId)
	_ = database.Database.QueryRow(formattedQuery).Scan(
		&client.ClientId,
		&client.Name,
		&client.MaritalStatus,
		&client.RegisterDate,
		&client.Nationality,
		&client.Gender,
	)
	fmt.Println("CLient: ", client)
	return client
}

func (r *DatabaseRepository) GetClients(page int) (clients []model.Client) {
	n, n1 := util.PageLength(page)
	rows, _ := database.Query(database.SelectClients, n, n1)
	client := model.Client{}
	for rows.Next() {
		_ = rows.Scan(
			&client.ClientId,
			&client.Name,
			&client.MaritalStatus,
			&client.RegisterDate,
			&client.Nationality,
			&client.Gender,
		)
		clients = append(clients, client)
		fmt.Println(client)
	}
	return clients
}

func (r *DatabaseRepository) SearchClients(name string) (clients []model.Client) {
	n, n1 := util.PageLength(1)
	name = `%` + name + `%`
	rows, _ := database.Query(database.SelectClientsLike, name, n, n1)
	client := model.Client{}
	for rows.Next() {
		_ = rows.Scan(
			&client.ClientId,
			&client.Name,
			&client.MaritalStatus,
			&client.RegisterDate,
			&client.Nationality,
			&client.Gender,
		)
		clients = append(clients, client)
		fmt.Println(client)
	}
	return clients
}
