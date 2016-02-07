package main

import "fmt"
import "strconv"

func main() {
	var T int
	fmt.Scan(&T)
	for i := 0; i < T; i++ {
		var a int64
		fmt.Scan(&a)
		binary := strconv.FormatInt(a, 2)
		dif := 32 - len(binary)
		for j := 0; j < dif; j++ {
			binary = "0" + binary
		}
		var result string
		for j := 0; j < 32; j++ {
			if string(binary[j]) == "0" {
				result += "1"
			} else {
				result += "0"
			}
		}
		total, _ := strconv.ParseInt(result, 2, 64)
		fmt.Println(total)
	}
}
