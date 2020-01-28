package database

import (
	"database/sql"
	"fmt"
)

func Query(query string, params ...interface{}) (*sql.Rows, error) {
	formattedQuery := fmt.Sprintf(query, params...)
	return Database.Query(formattedQuery)
}

var GetProductsQuery = `SELECT ID_PRODUTO, 
						ID_GRUPO_PRODUTO, 
						DESCRICAO, 
						PRECO_VENDA, 
						TOTAL_VENDAS 
						FROM TPRODUTOS 
						WHERE ID_GRUPO_PRODUTO = %d 
						ROWS %d TO %d;`

var GetProductGroupsQuery = `SELECT * FROM TGRUPOS_PRODUTOS;`

var GetOrderQuery = `SELECT ID_PEDIDO, ID_USUARIO, ID_MESA, SITUACAO_MESA, DATA_HORA_ABERTURA, VALOR_TOTAL_GERAL FROM TPEDIDOS WHERE ID_PEDIDO = %d;`
