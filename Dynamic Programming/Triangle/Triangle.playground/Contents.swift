import Foundation

func minimumTotal(_ triangle: [[Int]]) -> Int {
    guard triangle.count > 0 else { return 0 }
    
    if triangle.count == 1 {
        var minNum = Int.max
        for num in triangle[0] {
            minNum = min(minNum, num)
        }
        return minNum
    }
    
    var dp = [Int](repeating: 0, count: triangle.count + 1)
    for i in stride(from: triangle.count - 1, to: 0, by: -1) {
        for j in 0..<triangle[i].count {
            dp[j] = triangle[i][j] + min(dp[j], dp[j + 1])
        }
    }
    
    return dp.first!
}

minimumTotal([[2],[3,4],[6,5,7],[4,1,8,3]])
minimumTotal([[-10]])
