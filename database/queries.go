package database

import (
	"database/sql"
	"fmt"
)

func Query(query string, params ...interface{}) (*sql.Rows, error) {
	formattedQuery := fmt.Sprintf(query, params...)
	return Database.Query(formattedQuery)
}

var ProductsQuery = `SELECT ID_PRODUTO, 
						ID_GRUPO_PRODUTO, 
						DESCRICAO, 
						PRECO_VENDA, 
						TOTAL_VENDAS 
						FROM TPRODUTOS 
						WHERE ID_GRUPO_PRODUTO = %d 
						ROWS %d TO %d;`

var ProductGroupsQuery = `SELECT * FROM TGRUPOS_PRODUTOS;`
