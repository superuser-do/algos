

func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
    guard k != 0 else { return 0 }
    
    var dp = Array(repeating: 0, count: prices.count)
    for trade in 0..<k {
        var position = -prices[trade]
        var profit = 0
        for i in 1..<prices.count {
            position = max(position, dp[i]-prices[i])
            profit = max(profit, position + prices[i])
            dp[i] = profit
        }
    }
    
    return dp.last!
}

func maxProfit(k: Int, prices: [Int]) -> Int {
    guard k != 0 else { return 0 }
    
    struct Trades {
        var cost: Int
        var profit: Int
    }
    
    var dp = Array(repeating: Trades(cost: Int.max, profit: 0), count: k+1)
    for price in prices {
        for i in 1...k {
            dp[i].cost = min(dp[i].cost, price - dp[i-1].profit)
            dp[i].profit = max(dp[i].profit, price - dp[i].cost)
        }
    }
    
    return dp.last!.profit
}

maxProfit(2, [2,4,1])
maxProfit(2, [3,2,6,5,0,3])
