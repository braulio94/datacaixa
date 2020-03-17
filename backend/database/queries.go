package database

import (
	"database/sql"
	"fmt"
)

func Query(query string, params ...interface{}) (*sql.Rows, error) {
	formattedQuery := fmt.Sprintf(query, params...)
	return Database.Query(formattedQuery)
}

var SelectProduct = `SELECT ID_PRODUTO, 
								ID_GRUPO_PRODUTO, 
								DESCRICAO, 
								PRECO_VENDA, 
								TOTAL_VENDAS,
								DATA_CADASTRO
								FROM TPRODUTOS 
								WHERE ID_PRODUTO = %d`

var SelectProductsFromGroup = `SELECT ID_PRODUTO, 
								ID_GRUPO_PRODUTO, 
								DESCRICAO, 
								PRECO_VENDA, 
								TOTAL_VENDAS,
								DATA_CADASTRO
								FROM TPRODUTOS 
								WHERE ID_GRUPO_PRODUTO = %d 
								ORDER BY %s %s ROWS %d TO %d;`

var SelectProductGroups = `SELECT * FROM TGRUPOS_PRODUTOS;`
var SelectProductsOrderedBy = `SELECT  ID_PRODUTO, 
								ID_GRUPO_PRODUTO, 
								DESCRICAO, 
								PRECO_VENDA, 
								TOTAL_VENDAS,
								DATA_CADASTRO FROM TPRODUTOS
							 	ORDER BY %s %s ROWS %d TO %d`

var SelectProductsRecentlySold = `SELECT P.ID_PRODUTO,
										P.ID_GRUPO_PRODUTO,
										P.DESCRICAO,
										P.PRECO_VENDA,
										P.TOTAL_VENDAS,
										V.DATA_HORA_LANCTO AS DATA_CADASTRO FROM TPRODUTOS P
										LEFT JOIN TVENDAS_ITENS V ON V.ID_PRODUTO = P.ID_PRODUTO
										ORDER BY V.DATA_HORA_LANCTO DESC
										ROWS %d TO %d`

var SelectOrder = `SELECT ID_PEDIDO,
								ID_USUARIO, 
								ID_MESA, 
								SITUACAO_MESA, 
								DATA_HORA_ABERTURA, 
								VALOR_TOTAL_GERAL, 
								ID_CLIENTE 
								FROM TPEDIDOS 
								WHERE ID_PEDIDO = %d;`

var SelectOpenOrders = `SELECT ID_PEDIDO, 
								ID_USUARIO, 
								ID_MESA,
								SITUACAO_MESA, 
								DATA_HORA_ABERTURA, 
								VALOR_TOTAL_GERAL,
								ID_CLIENTE
								FROM TPEDIDOS 
								WHERE Situacao = 'Aberto'
								ORDER BY ID_MESA ASC;`
 
var SelectOrderItemsFromOrder = `SELECT ID_PEDIDO_ITEM,
								ID_PEDIDO, 
								ID_PRODUTO,
								COALESCE(ID_USUARIO, 5) AS ID_USUARIO,
								SEQUENCIA, 
								QUANTIDADE, 
								VALOR_UNITARIO, 
								VALOR_TOTAL,
								DATA_HORA_LANCTO
								FROM TPEDIDOS_ITENS 
								WHERE ID_PEDIDO = %d;`

var SelectOrderItemsCount = `SELECT COUNT(ID_PEDIDO_ITEM)
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
								RETURNING ID_PEDIDO, DATA_HORA_ABERTURA, ID_CLIENTE;`

var InsertOrderItem = `INSERT INTO TPEDIDOS_ITENS (
								ID_PEDIDO, 
								ID_PRODUTO,
								ID_USUARIO,
								SEQUENCIA, 
								QUANTIDADE, 
								VALOR_UNITARIO, 
								VALOR_TOTAL)
								VALUES (%d, %d, %d, %d, %v, %v, %v)
					   			RETURNING ID_PEDIDO, ID_PEDIDO_ITEM, ID_USUARIO, SEQUENCIA, 
								QUANTIDADE, VALOR_UNITARIO, VALOR_TOTAL, DATA_HORA_LANCTO;`

var DeleteOrderItem = `DELETE FROM TPEDIDOS_ITENS WHERE ID_PEDIDO_ITEM = %d`
var SelectTable = `SELECT * FROM TMESAS WHERE ID_MESA = %d;`
var SelectTables = `SELECT * FROM TMESAS;`
var SelectTableOrder = `SELECT T.ID_PEDIDO, T.VALOR_TOTAL_GERAL, T.SITUACAO_MESA
						FROM TPEDIDOS T WHERE T.SITUACAO = 'Aberto' AND T.ID_MESA = %d`
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

var SelectProductsLike = `SELECT ID_PRODUTO, 
								ID_GRUPO_PRODUTO, 
								DESCRICAO, 
								PRECO_VENDA, 
								TOTAL_VENDAS,
								DATA_CADASTRO
								FROM TPRODUTOS 
								WHERE DESCRICAO LIKE '%s'
								ROWS %d TO %d;`

var SelectUser = `SELECT ID_HOTEL,
					     ID_USUARIO,
					     USUARIO,
					     NOME,
					     EMAIL
					     FROM TUSUARIOS WHERE ID_USUARIO = %d`

var LoginUser = `SELECT 1 SUCESS 
					     FROM TUSUARIOS WHERE ID_USUARIO = %d
						 AND SENHA = '%s'`

var SelectUsers = `SELECT  ID_HOTEL,
						   ID_USUARIO,
						   USUARIO,
						   NOME,
						   EMAIL
						   FROM TUSUARIOS WHERE ID_USUARIO NOT IN (1);`