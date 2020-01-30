package database

import (
	"database/sql"
	"fmt"
)

func Query(query string, params ...interface{}) (*sql.Rows, error) {
	formattedQuery := fmt.Sprintf(query, params...)
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

var InsertOrder = `INSERT INTO TPEDIDOS (
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

var InsertOrderItem = `INSERT INTO TPEDIDOS_ITENS (
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

var SelectTable = `SELECT * FROM TMESAS WHERE ID_MESA = %d;`
var SelectTables = `SELECT * FROM TMESAS;`

var SelectClient = `SELECT ID_HOSPEDE,
					NOME, ESTADO_CIVIL, 
					DATA_CADASTRO, NACIONALIDADE,
					SEXO FROM THOSPEDES WHERE ID_HOSPEDE = %d;`

var SelectClients = `SELECT ID_HOSPEDE,
					NOME, ESTADO_CIVIL, 
					DATA_CADASTRO, NACIONALIDADE,
					SEXO FROM THOSPEDES ROWS %d TO %d;`

var SelectClientsLike = `SELECT ID_HOSPEDE,
							NOME, ESTADO_CIVIL, 
							DATA_CADASTRO, NACIONALIDADE,
							SEXO FROM THOSPEDES
							WHERE NOME LIKE '%s'
							ORDER BY NOME ROWS %d TO %d;`
