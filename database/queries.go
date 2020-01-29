package database

import (
	"database/sql"
	"fmt"
)

func Query(query string, params ...interface{}) (*sql.Rows, error) {
	formattedQuery := fmt.Sprintf(query, params...)
	fmt.Println(formattedQuery)
	return Database.Query(formattedQuery)
}

var SelectProductsFromGroup = `SELECT ID_PRODUTO, 
								ID_GRUPO_PRODUTO, 
								DESCRICAO, 
								PRECO_VENDA, 
								TOTAL_VENDAS 
								FROM TPRODUTOS 
								WHERE ID_GRUPO_PRODUTO = %d 
								ROWS %d TO %d;`

var SelectProductGroups = `SELECT * FROM TGRUPOS_PRODUTOS;`

var SelectOrder = `SELECT ID_PEDIDO, 
								ID_USUARIO, 
								ID_MESA, 
								SITUACAO_MESA, 
								DATA_HORA_ABERTURA, 
								VALOR_TOTAL_GERAL 
								FROM TPEDIDOS 
								WHERE ID_PEDIDO = %d;`

var SelectOpenOrders = `SELECT ID_PEDIDO, 
								ID_USUARIO, 
								ID_MESA, 
								SITUACAO_MESA, 
								DATA_HORA_ABERTURA, 
								VALOR_TOTAL_GERAL 
								FROM TPEDIDOS 
								WHERE Situacao = 'Aberto';`

var SelectOrderItemsFromOrder = `SELECT ID_HOTEL, 
								ID_PEDIDO, 
								ID_PRODUTO, 
								ID_USUARIO, 
								SEQUENCIA, 
								QUANTIDADE, 
								VALOR_UNITARIO, 
								VALOR_TOTAL 
								FROM TPEDIDOS_ITENS 
								WHERE ID_PEDIDO = %d;`

var CreateOrder = `INSERT INTO TPEDIDOS (
								ID_HOTEL, 
								ID_PDV, 
								ID_USUARIO, 
								ID_MESA, 
								ID_CLIENTE, 
								QUANT_PESSOAS, 
								TIPO, 
								SITUACAO_MESA)
				   				VALUES (%d, %d, %d, %d, %d, %d, '%s', '%s')
								RETURNING ID_PEDIDO, DATA_HORA_ABERTURA;`

var CreateOrderItem = `INSERT INTO TPEDIDOS_ITENS (
								ID_HOTEL, 
								ID_PEDIDO, 
								ID_PRODUTO, 
								ID_USUARIO, 
								SEQUENCIA, 
								QUANTIDADE, 
								VALOR_UNITARIO, 
								VALOR_TOTAL)
								VALUES (%d, %d, %d, %d, %d, %b, %b, %b)
					   			RETURNING ID_PEDIDO_ITEM;`
