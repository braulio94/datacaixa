package types

import "database/sql"

type Table struct {
	HotelId        int64
	PDVId          int64
	TableId        int64
	Number         int64
	Status         string
	BirthdayPerson sql.NullString
	VIP            sql.NullString
	Honeymoon      sql.NullString
	PVD            sql.NullString
	Seats          sql.NullInt64
}
