import Foundation

func fib(_ n: Int) -> Int {
    guard n > 1 else { return n }
    
    var memo = Array(repeating: 1, count: n)
    
    for i in 2 ..< n {
        memo[i] = memo[i-1] + memo[i-2]
    }
    
    return memo[n-1]
}

fib(5)
