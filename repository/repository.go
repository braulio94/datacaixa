package repository

import (
	"database/sql"
	"github.com/braulio94/datacaixa/database"
	"github.com/braulio94/datacaixa/types"
)

type Repository interface {
	GetProducts(group, page int) []types.Product
}

type DatabaseRepository struct {
	DB *sql.DB
}

func NewRepository() *DatabaseRepository {
	database.InitFirebirdDB()
	return &DatabaseRepository{DB: database.Database}
}
