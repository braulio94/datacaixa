package repository

import (
	"database/sql"
	"github.com/braulio94/datacaixa/backend/database"
	"github.com/braulio94/datacaixa/backend/model"
)

type Repository interface {
	GetProductsByGroup(groupId, page int) []model.Product
	SearchProducts(description string) []model.Product
	GetProductGroups() []model.ProductGroup
	GetOrder(orderId int) model.Order
	GetOrderItems(orderId int) ([]model.OrderItem, model.OrderItem)
	CreateOrder(new model.Order) model.Order
	CreateOrderItem(orderItemId model.OrderItem) model.OrderItem
	GetTable(tableId int) model.Table
	GetTables() []model.Table
	GetClient(clientId int) model.Client
	GetClients(page int) (clients []model.Client)
	SearchClients(name string) (clients []model.Client)
}

type DatabaseRepository struct {
	DB *sql.DB
}

func NewRepository() *DatabaseRepository {
	database.InitFirebirdDB()
	return &DatabaseRepository{DB: database.Database}
}
