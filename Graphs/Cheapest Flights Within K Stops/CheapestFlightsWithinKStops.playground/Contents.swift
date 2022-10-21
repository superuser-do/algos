

func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dest: Int, _ k: Int) -> Int {
    var prices = Array(repeating: Int.max, count: n)
    prices[src] = 0

    for _ in 0...k {
        var tempPrices = prices

        for flight in flights {
            let source = flight[0]
            let destination = flight[1]
            let price = flight[2]

            if prices[source] == Int.max {
                continue
            }

            if prices[source] + price < tempPrices[destination] {
                tempPrices[destination] = prices[source] + price
            }
        }
        prices = tempPrices
    }

    return prices[dest] == Int.max ? -1 : prices[dest]
}

findCheapestPrice(4,[[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]], 0, 3, 1)
