# Datacaixa

PoS mobile client and backend consuming FirebirdSql Database and exposing in REST

## UP and Running

This project uses an existing and pre-populated database that can be found [here]()

- Make sure you have [Golang](https://golang.org) installed
- Download th firbirdsql database file.
- Make sure your database connection url string is poting to the same directory where the database file is

## API 

#### Clients
- GetClients
- SearchClientsByName
- GetClient

| Method   | URL            | Params             |
|----------|----------------|--------------------|
|```GET```     | ```/api/clients``` | ```page={number}``` |
|```GET```     | ```/api/clients/search/{name}``` |  |
|```GET```     | ```/api/client/{id}``` |  |

#### Orders
- GetOrder
- GetOpenOrders
- GetOrderItems
- CreateOrder
- CreateOrderItem
- GetItem

| Method   | URL            | Params             |
|----------|----------------|--------------------|
|```GET```     | ```/api/order/{id}?``` | ```withItems={condition}``` |
|```GET```     | ```/api/orders``` |  |
|```GET```     | ```/api/order/{id}/items``` |  |
|```PUT```     | ```/api/order``` |  |
|```PUT```     | ```/api/order/{id}/item``` |  |
|```GET```     | ```/api/item/{id}``` |  |

#### Products
- GetProductsByGroup
- GetProductsInOrder
- SearchProductsByName
- GetSingleProduct
- GetProductGroups

| Method   | URL            | Params             |
|----------|----------------|--------------------|
|```GET```     | ```/api/products/{groupId}``` |  ```page={number}``` |
|```GET```     | ```/api/products``` | ```page={number} orderBy={order}``` |
|```GET```     | ```/api/products/search/{description}``` | |
|```PUT```     | ```/api/product/{id}``` |  |
|```PUT```     | ```/api/groups/{groupId}``` |  |

#### Users
- GetUsers
- GetUser
- Login

| Method   | URL            | Params             |
|----------|----------------|--------------------|
|```GET```     | ```/api/users``` |  |
|```GET```     | ```/api/user/{id}``` |  |
|```POST```     | ```/api/user/login``` |  |

