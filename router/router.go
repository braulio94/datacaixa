package router

import (
	"github.com/braulio94/datacaixa/repository"
	"github.com/braulio94/datacaixa/util"
	"github.com/gin-gonic/gin"
	"net/http"
	"strconv"
)

//type CustomRouter interface {
//	router := gin.Default()
//	router.SetHTMLTemplate(html)
//}

var r = DRouter{
	engine: gin.Default(),
	repo:   repository.NewRepository(),
}

type DRouter struct {
	engine *gin.Engine
	repo   *repository.DatabaseRepository
}

//
func ComposeRouter() {
	router := gin.Default()
	router.GET("/order/:orderid", FetchOrder)
}

func FetchOrder(c *gin.Context) {
	orderId := c.Param("orderid")
	order := r.repo.GetOrder(orderId)
	c.JSON(http.StatusOK, gin.H{"order": order})
	util.Message(true, order)
}
