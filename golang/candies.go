// solution https://www.hackerrank.com/challenges/candies

package main
import "fmt"

func candies(ar []int) int{
    tmp := mins(ar)
    //fmt.Println(tmp)
    tmp = leftToRight(ar,tmp)
    //fmt.Println(tmp)
    tmp = rightToLeft(ar,tmp)
    //fmt.Println(tmp)
    
    return sum(tmp)
}

func rightToLeft(ar, tmp []int) []int{
    n := len(ar)
    count := 1
    flag := false
    for i := n-1; i >= 0; i--{
        if tmp[i] == 1{
            count =1
            flag = true
            continue
        }
        if flag {
            if ar[i] > ar[i+1] {
                count++
                tmp[i] = biggest(count,tmp[i])
            } else {
                flag = false
            }
        }
    }
    
    return tmp
}
func leftToRight(ar, tmp []int) []int{
    n := len(ar)
    
    count := 1
    flag := false
    
    for i := 0; i < n; i++{
        if tmp[i] == 1{
            count = 1
            flag = true
            continue
        }
        if flag {
            if ar[i] > ar[i-1] {
                count++
                tmp[i] = count
            } else {
                flag = false
            } 
        }
    }
    
    return tmp
}
func mins(ar []int) []int{
    n := len(ar)
    tmp := make([]int,n)
    if ar[0] <= ar[1]{
        tmp[0] = 1
    }
    for i := 1; i < n-1; i++{
        if ar[i] <= ar[i-1] && ar[i] <= ar[i+1]{
            
            tmp[i] = 1
        }
    }
    
    if ar[n-1] <= ar[n-2]{
        tmp[n-1] = 1
    } 
     
    return tmp
}
func biggest(a,b int) int{
    if a > b{ 
        return a
    }
    return b
}
func sum(ar []int) int{
    sum := 0
    for i := 0; i < len(ar); i++{
        sum +=ar[i]
    }
    return sum
}

func main() {
    var N int 
    fmt.Scan(&N)
    ar := make([]int,N)
    for i := 0; i < N; i++{
        fmt.Scan(&ar[i])
    }
    fmt.Println(candies(ar))
}
