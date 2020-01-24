package database

import (
	"database/sql"
	_ "github.com/nakagami/firebirdsql"
)

var Database *sql.DB

func InitFirebirdDB(){
	Database, _ = sql.Open("firebirdsql", "sysdba:masterkey@localhost/C:/DATACAIXA.FDB")
}