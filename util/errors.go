package util

import "errors"

var (
	NotFound            = errors.New("Request not found")
	InternalServerError = errors.New("Internal Server Error")
)
