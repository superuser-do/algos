import Foundation

func generate(_ numRows: Int) -> [[Int]] {
    guard numRows > 0 else { return [] }
    
    var triangle = [[Int]]()
    
    for i in 0..<numRows {
        triangle.append([])
        
        for j in 0..<i+1 {
            if j == 0 || j == i {
                triangle[i].append(1)
            } else {
                triangle[i].append(triangle[i - 1][j - 1] + triangle[i - 1][j])
            }
        }
    }
    
    return triangle
}

generate(5)
generate(1)
