package util

var itemsPerPage = 10

func PageLength(page int) (n, n2 int) {
	start := (page - 1) * itemsPerPage
	stop := start + itemsPerPage
	start = start+1

	return start, stop
}

func SqlOrder(order string) (string, from string) {
	switch order {
		case `recentlyAdded`:
			order = `DATA_CADASTRO`
			from = `ASC`
			break
		case `sales`:
			order = `TOTAL_VENDAS`
			from = `DESC`
			break
		case `description`:
			order = `DESCRICAO`
			from = `ASC`
			break
		case `recentlySold`:
			break
		default:
			order = `TOTAL_VENDAS`
			from = `DESC`
			break
	}
	return order, from
}