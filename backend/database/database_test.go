package database

import (
	"github.com/braulio94/datacaixa/backend/repository"
	"testing"
)

func TestQuery(t *testing.T) {
	_ = repository.NewRepository()
}
