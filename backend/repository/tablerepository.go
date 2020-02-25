package repository

import (
	"fmt"
	"github.com/braulio94/datacaixa/backend/database"
	"github.com/braulio94/datacaixa/backend/model"
)

func (r *DatabaseRepository) GetTable(tableId int) (table model.Table) {
	formattedQuery := fmt.Sprintf(database.SelectTable, tableId)
	_ = database.Database.QueryRow(formattedQuery).Scan(
		&table.HotelId,
		&table.PDVId,
		&table.TableId,
		&table.Number,
		&table.Status,
		&table.BirthdayPerson,
		&table.VIP,
		&table.Honeymoon,
		&table.PVD,
		&table.Seats,
	)
	return table
}

func (r *DatabaseRepository) GetTables() (tables []model.Table) {
	rows, _ := database.Query(database.SelectTables)
	table := model.Table{}
	for rows.Next() {
		_ = rows.Scan(
			&table.HotelId,
			&table.PDVId,
			&table.TableId,
			&table.Number,
			&table.Status,
			&table.BirthdayPerson,
			&table.VIP,
			&table.Honeymoon,
			&table.PVD,
			&table.Seats,
		)
		order := r.GetTableOrderDetails(table.TableId)
		if len(order.TableStatus) > 0 {
			table.Status = order.TableStatus
		}
		table.TotalAmount = order.GeneralTotalAmount
		table.OrderId = order.OrderId
		tables = append(tables, table)
	}
	return tables
}

func (r *DatabaseRepository) GetTableOrderDetails(tableId int) (order model.Order) {
	formattedQuery := fmt.Sprintf(database.SelectTableOrder, tableId)
	_ = database.Database.QueryRow(formattedQuery).Scan(
		&order.OrderId,
		&order.GeneralTotalAmount,
		&order.TableStatus)
	return order
}
