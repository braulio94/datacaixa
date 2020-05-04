# Datacaixa

PoS mobile client and backend consuming FirebirdSql Database and exposing in REST

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

