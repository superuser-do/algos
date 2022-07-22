import Foundation

func rotate(_ matrix: inout [[Int]]) {
    func transpose(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for i in 0..<n {
            for j in i+1..<n {
                (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
            }
        }
    }
    
    func reflect(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for i in 0..<n {
            for j in 0..<(matrix[i].count / 2) {
                (matrix[i][j], matrix[i][n - j - 1]) = (matrix[i][n - j - 1], matrix[i][j])
            }
        }
    }
    
    transpose(&matrix)
    reflect(&matrix)
}

var matrix = [[1,2,3],[4,5,6],[7,8,9]]
rotate(&matrix)
