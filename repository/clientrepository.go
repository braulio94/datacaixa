package repository

import (
	"fmt"
	"github.com/braulio94/datacaixa/database"
	"github.com/braulio94/datacaixa/types"
)

func (r *DatabaseRepository) GetClient(clientId int) (client types.Client) {
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

func (r *DatabaseRepository) GetClients(page int) (clients []types.Client) {
	n, n1 := PageLength(page)
	rows, _ := database.Query(database.SelectClients, n, n1)
	client := types.Client{}
	for rows.Next() {
		_ = rows.Scan(
			&client.HotelId,
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

func (r *DatabaseRepository) SearchClients(name string) (clients []types.Client) {
	n, n1 := PageLength(1)
	name = `%` + name + `%`
	rows, _ := database.Query(database.SelectClientsLike, name, n, n1)
	client := types.Client{}
	for rows.Next() {
		_ = rows.Scan(
			&client.HotelId,
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
