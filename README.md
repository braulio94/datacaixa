# Datacaixa

PoS mobile client [(flutter)](https://flutter.dev) and backend [(Go)](https://golang.org) consuming FirebirdSql Database and exposing in REST

## Up and Running 

This project uses an existing and pre-populated database that can be found [here]()

- Make sure you have [Golang](https://golang.org) installed
- Download th firbirdsql database file.
- Make sure your database connection url string is pointing to the same directory where the database file is
- 

## API 

#### Clients

Name            | Method   | URL            | Params             |
|---------------|----------|----------------|--------------------|
| GetClients     |```GET```     | ```/api/clients``` | ```page={number}``` |
|SearchClientsByName|```GET```     | ```/api/clients/search/{name}``` |  |
|GetClient|```GET```     | ```/api/client/{id}``` |  |

#### Orders

|Name           | Method   | URL            | Params             |
|---------------|----------|----------------|--------------------|
|GetOrder|```GET```     | ```/api/order/{id}?``` | ```withItems={condition}``` |
|GetOpenOrders|```GET```     | ```/api/orders``` |  |
|GetOrderItems|```GET```     | ```/api/order/{id}/items``` |  |
|CreateOrder|```PUT```     | ```/api/order``` |  |
|CreateOrderItem|```PUT```     | ```/api/order/{id}/item``` |  |
|GetItem|```GET```     | ```/api/item/{id}``` |  |

#### Products

|Name             | Method   | URL            | Params             |
|-----------------|----------|----------------|--------------------|
|GetProductsByGroup|```GET```     | ```/api/products/{groupId}``` |  ```page={number}``` |
|GetProductsInOrder|```GET```     | ```/api/products``` | ```page={number} orderBy={order}``` |
|SearchProductsByName|```GET```     | ```/api/products/search/{description}``` | |
|GetSingleProduct|```PUT```     | ```/api/product/{id}``` |  |
|GetProductGroups|```PUT```     | ```/api/groups/{groupId}``` |  |

#### Users

|Name      | Method   | URL            | Params             |
|----------|----------|----------------|--------------------|
|GetUsers  |```GET```     | ```/api/users``` |  |
|GetUser   |```GET```     | ```/api/user/{id}``` |  |
|Login     |```POST```     | ```/api/user/login``` |  |

