import Foundation

func matrixMultiply(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
    var C = Array(repeating: Array(repeating: 0, count: B[0].count), count: A[0].count)
    for i in 0..<A.count {
        for j in 0..<B[i].count {
            var value = 0
            for k in 0..<A[i].count {
                value += A[i][k] * B[k][j]
            }
            C[i][j] = value
        }
    }
    return C
}

matrixMultiply([[1, 2], [3, 4],], [[5, 6],[7, 8],])
