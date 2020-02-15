package controllers

import (
	"encoding/json"
	"github.com/braulio94/datacaixa/backend/model"
	"github.com/braulio94/datacaixa/backend/repository"
	"github.com/braulio94/datacaixa/backend/util"
	"github.com/gorilla/mux"
	"log"
	"net/http"
	"os"
	"strconv"
	"strings"
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

func (D *Datacaixa) FetchProductsByGroup(rw http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	var products []model.Product
	groupId, _ := strconv.Atoi(vars["group"])
	page, _ := strconv.Atoi(vars["pageNumber"])
	orderBy := vars["order"]
	if len(vars["group"]) > 0  && len(vars["order"]) > 0 {
		products = D.Repository.GetProductsByGroup(groupId, page, orderBy)
	}
	util.Respond(rw, map[string]interface{}{"produtos": products})
}

func (D *Datacaixa) FetchProductsInOrder(rw http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	var products []model.Product
	page, _ := strconv.Atoi(vars["pageNumber"])
	order := vars["order"]
	if len(vars["order"]) > 0 {
		products = D.Repository.GetProductsOrderedBy(page, order)
	}
	util.Respond(rw, map[string]interface{}{"produtos": products})
}

func (D *Datacaixa) SearchProducts(rw http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	var products []model.Product
	description := vars["description"]
	if len(vars["description"]) > 0 {
		products = D.Repository.SearchProducts(description)
	}
	util.Respond(rw, map[string]interface{}{"produtos": products})
}

func (D *Datacaixa) FetchProduct(rw http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	productId, _ := strconv.Atoi(vars["id"])
	product := D.Repository.GetSingleProduct(productId)
	util.Respond(rw, map[string]interface{}{"produto": product})
}

func (D *Datacaixa) FetchProductGroups(rw http.ResponseWriter, r *http.Request) {
	groups := D.Repository.GetProductGroups()
	util.Respond(rw, map[string]interface{}{"grupo_produtos": groups})
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
	order := model.Order{}
	if len(vars["withItems"]) > 0 && strings.Contains(vars["withItems"], "yes") {
		order = D.Repository.GetOrder(orderId, true)
	} else {
		order = D.Repository.GetOrder(orderId, false)
	}

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
	vars := mux.Vars(r)
	orderId, _ := strconv.Atoi(vars["orderId"])
	item := model.OrderItem{}
	_ = json.NewDecoder(r.Body).Decode(&item)
	newOrderItem := D.Repository.CreateOrderItem(item, orderId)
	util.Respond(rw, map[string]interface{}{"item": newOrderItem})
}

func (D *Datacaixa) UpdateOrderItem(rw http.ResponseWriter, r *http.Request) {

}

func (D *Datacaixa) DeleteOrderItem(rw http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	itemId, _ := strconv.Atoi(vars["id"])
	D.Repository.DeleteOrderItem(itemId)
}

func (D *Datacaixa) FetchClients(rw http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	var clients []model.Client
	page, _ := strconv.Atoi(vars["pageNumber"])
	name := vars["name"]
	if len(vars["name"]) > 0 {
		clients = D.Repository.SearchClients(name)
	} else {
		clients = D.Repository.GetClients(page)
	}
	util.Respond(rw, map[string]interface{}{"clientes": clients})
}

func (D *Datacaixa) FetchClient(rw http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	clientId, _ := strconv.Atoi(vars["id"])
	client := D.Repository.GetSingleProduct(clientId)
	util.Respond(rw, map[string]interface{}{"cliente": client})
}
