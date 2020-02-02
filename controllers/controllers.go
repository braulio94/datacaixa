package controllers

import (
	"fmt"
	"github.com/braulio94/datacaixa/repository"
	"github.com/gorilla/mux"
	"github.com/nicholasjackson/env"
	"log"
	"net/http"
	"os"
	"strconv"
	"time"
)

var (
	Core        *Datacaixa
	bindAddress = env.String("BIND_ADDRESS", false, ":9090", "Bind address for the server")
	l           = log.New(os.Stdout, "products-api ", log.LstdFlags)
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
		Addr:         *bindAddress,      // configure the bind address
		Handler:      r,                 // set the default handler
		ErrorLog:     l,                 // set the logger for the server
		ReadTimeout:  5 * time.Second,   // max time to read request from the client
		WriteTimeout: 10 * time.Second,  // max time to write response to the client
		IdleTimeout:  120 * time.Second, // max time for connections using TCP Keep-Alive
	}
	Core = &Datacaixa{Router: r, Repository: repo, Server: s}
	return Core
}

func (D *Datacaixa) FetchProducts(rw http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	groupId, err := strconv.Atoi(vars["id"])
	if err != nil {
		http.Error(rw, "Unable to convert id", http.StatusBadRequest)
		return
	}
	fmt.Println("Handle PUT Product", groupId)
}
