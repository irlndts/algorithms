package main

import "fmt"

// works with unoriented graph
// original exersice https://www.hackerrank.com/challenges/bfsshortreach

type Node struct {
	edges   []int // connected nodes
	checked bool
	counter int // steps
}

func shortestReach(nodes *[]Node, i, c int) {
	if !(*nodes)[i].checked || (c+1) < (*nodes)[i].counter {
		(*nodes)[i].checked = true
		(*nodes)[i].counter = c + 1
		for _, v := range (*nodes)[i].edges {
			shortestReach(nodes, v, (*nodes)[i].counter)
		}
	}
}

func main() {
	var T int
	fmt.Scan(&T)
	for i := 0; i < T; i++ {
		var N, M int
		fmt.Scan(&N)
		fmt.Scan(&M)

		nodes := make([]Node, N+1)
		for j := 1; j <= M; j++ {
			var l, r int
			fmt.Scan(&l)
			fmt.Scan(&r)

			nodes[l].edges = append(nodes[l].edges, r)
			nodes[r].edges = append(nodes[r].edges, l)

		}
		var startPosition int
		fmt.Scan(&startPosition)

		shortestReach(&nodes, startPosition, 0)
		printNodes(&nodes, startPosition)
	}
	fmt.Println()
}

func printNodes(nodes *[]Node, start int) {
	for i, v := range *nodes {

		if i == 0 || i == start {
			continue
		}
		if v.counter == 0 {
			fmt.Printf("%d ", -1)
			continue
		}
		fmt.Printf("%d ", (v.counter-1)*6)

	}
	fmt.Println()
}
