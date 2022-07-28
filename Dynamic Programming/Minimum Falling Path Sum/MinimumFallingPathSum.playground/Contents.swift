import Foundation

func minFallingPathSum(_ matrix: [[Int]]) -> Int {
    let rows = matrix.count
    let cols = matrix[0].count
    
    var dp = Array(repeating: Array(repeating: Int.max, count: cols), count: rows)
    
    for j in 0..<cols {
        dp[0][j] = matrix[0][j]
    }
    
    for i in 1..<rows {
        for j in 0..<cols {
            dp[i][j] = matrix[i][j] + dp[i-1][j]
            
            if j - 1 >= 0 {
                dp[i][j] = min((matrix[i][j] + dp[i - 1][j - 1]), dp[i][j])
            }
            
            if j + 1 < cols {
                dp[i][j] = min((matrix[i][j] + dp[i - 1][j + 1]), dp[i][j])
            }
        }
    }
    
    return dp.last!.min()!
}

minFallingPathSum([[2,1,3],[6,5,4],[7,8,9]])
