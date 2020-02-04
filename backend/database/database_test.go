package database

import (
	"github.com/braulio94/datacaixa/repository"
	"testing"
)

func TestQuery(t *testing.T) {
	_ = repository.NewRepository()
}
