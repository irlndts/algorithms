package main

import (
	"fmt"
	"math/rand"
)

var N int = 1000

func main() {
	arr := make([]int, N)
	for i := 0; i < N; i++ {
		arr[i] = rand.Intn(N)
	}

	sort_bubbles(arr)
	fmt.Println(arr)
}

func sort_bubbles(slice []int) {

	var length int = len(slice) - 1

	for i := 0; i < len(slice); i++ {
		for j := 0; j < length; j++ {
			if slice[j] > slice[j+1] {
				slice[j], slice[j+1] = swap(slice[j], slice[j+1])
			}
		}
		length--
	}
}

func swap(a int, b int) (int, int) {
	return b, a
}
