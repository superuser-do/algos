import UIKit

func submatrix(of matrix: [[Int]], size: Int, x: Int, y: Int) -> [[Int]] {
    var submatrix = [[Int]]()
    for i in stride(from: x, to: x + size, by: 1) {
        var row = [Int]()
        for j in stride(from: y, to: y + size, by: 1) {
            row.append(matrix[i][j])
        }
        submatrix.append(row)
    }
    return submatrix
}

let matrix = [[1, 2, 3],
              [4, 5, 6],
              [7, 8, 9]]

submatrix(of: matrix, size: 2, x: 1, y: 1)
submatrix(of: matrix, size: 2, x: 0, y: 1)
submatrix(of: matrix, size: 2, x: 1, y: 0)
