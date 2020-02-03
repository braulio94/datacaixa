package controllers

import (
	"encoding/json"
	"github.com/braulio94/datacaixa/model"
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
	var products []model.Product
	groupId, _ := strconv.Atoi(vars["group"])
	page, _ := strconv.Atoi(vars["pageNumber"])
	description := vars["description"]
	if len(vars["description"]) > 0 {
		products = D.Repository.SearchProducts(description)
	} else {
		products = D.Repository.GetProductsByGroup(groupId, page)
	}
	util.Respond(rw, map[string]interface{}{"produtos": products})
}

func (D *Datacaixa) FetchProduct(rw http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	productId, _ := strconv.Atoi(vars["id"])
	product := D.Repository.GetSingleProduct(productId)
	util.Respond(rw, map[string]interface{}{"produto": product})
}

func (D *Datacaixa) FetchCategories(rw http.ResponseWriter, r *http.Request) {
	categories := D.Repository.GetProductGroups()
	util.Respond(rw, map[string]interface{}{"categorias": categories})
}

func (D *Datacaixa) FetchTable(rw http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	tableId, _ := strconv.Atoi(vars["id"])
	table := D.Repository.GetTable(tableId)
	util.Respond(rw, map[string]interface{}{"mesa": table})
}

func (D *Datacaixa) FetchTables(rw http.ResponseWriter, r *http.Request) {
	tables := D.Repository.GetTables()
	util.Respond(rw, map[string]interface{}{"mesas": tables})
}

func (D *Datacaixa) FetchOrder(rw http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	orderId, _ := strconv.Atoi(vars["id"])
	order := D.Repository.GetOrder(orderId)
	util.Respond(rw, map[string]interface{}{"pedido": order})
}

func (D *Datacaixa) FetchOrders(rw http.ResponseWriter, r *http.Request) {
	orders := D.Repository.GetOpenOrders()
	util.Respond(rw, map[string]interface{}{"pedidos": orders})
}

func (D *Datacaixa) FetchOrderItems(rw http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	orderId, _ := strconv.Atoi(vars["id"])
	orderItems := D.Repository.GetOrderItems(orderId)
	util.Respond(rw, map[string]interface{}{"pedido_itens": orderItems})
}

func (D *Datacaixa) CreateNewOrder(rw http.ResponseWriter, r *http.Request) {
	order := model.Order{}
	err := json.NewDecoder(r.Body).Decode(&order)
	if err != nil {
		log.Fatal("Failed to decode request body")
		return
	}
	newOrder := D.Repository.CreateOrder(order)
	util.Respond(rw, map[string]interface{}{"pedido": newOrder})
}

func (D *Datacaixa) CreateNewOrderItem(rw http.ResponseWriter, r *http.Request) {
	item := model.OrderItem{}
	err := json.NewDecoder(r.Body).Decode(&item)
	if err != nil {
		log.Fatal("Failed to decode request body")
		return
	}
	newOrderItem := D.Repository.CreateOrderItem(item)
	util.Respond(rw, map[string]interface{}{"item": newOrderItem})
}
