package controllers

import (
	"github.com/braulio94/datacaixa/repository"
	"github.com/braulio94/datacaixa/util"
	"github.com/gorilla/mux"
	"log"
	"net/http"
	"os"
	"strconv"
	"time"
)

type Datacaixa struct {
	Router     *mux.Router
	Repository *repository.DatabaseRepository
	Server     http.Server
}

func NewCore() *Datacaixa {
	r := mux.NewRouter()
	repo := repository.NewRepository()
	s := http.Server{
		ErrorLog:     log.New(os.Stdout, "datacaixa ", log.LstdFlags),
		ReadTimeout:  5 * time.Second,
		WriteTimeout: 10 * time.Second,
		IdleTimeout:  120 * time.Second,
	}
	return &Datacaixa{Router: r, Repository: repo, Server: s}
}

func (D *Datacaixa) FetchProducts(rw http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	groupId, _ := strconv.Atoi(vars["group"])
	page, _ := strconv.Atoi(vars["pageNumber"])
	products := D.Repository.GetProductsByGroup(groupId, page)
	util.Respond(rw, map[string]interface{}{"products": products})
}
