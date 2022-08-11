import Foundation

func minTransfers(_ transactions: [[Int]]) -> Int {
    var totals: [Int: Int] {
        var dict = [Int: Int]()
        transactions.forEach {
            dict[$0.first!, default: 0] -= $0.last!
            dict[$0[1], default: 0] += $0.last!
        }
        return dict
    }
    
    var debts = Array(totals.values)
    
    func backtrace(_ id: inout Int) -> Int {
        while id < debts.count && debts[id] == 0 {
            id += 1
        }
        
        if id == debts.count { return 0 }
        var minTransactionCount = Int.max
        for i in id+1..<debts.count {
            if debts[id] * debts[i] < 0 {
                debts[i] += debts[id]
                var next = id + 1
                minTransactionCount = min(minTransactionCount, 1 + backtrace(&next))
                debts[i] -= debts[id]
            }
        }
        return minTransactionCount
    }
    
    var id = 0
    return backtrace(&id)
}
    
   
minTransfers([[0,1,10],[2,0,5]])
