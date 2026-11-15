package main

import (
	"fmt"

	"github.com/cmackenzie1/template-go/internal/greeting"
)

func main() {
	fmt.Println(greeting.Hello("world"))
}
