import Foundation

func zigZag(_ input: inout [Int]) -> [Int] {
    for i in stride(from: 1, through: input.count - 1, by: 2) {
        if input[i - 1] > input[i] {
            input.swapAt(i - 1, i)
        }
        
        if i + 1 < input.count - 1,
           input[i] < input[i + 1] {
            input.swapAt(i, i + 1)
        }
    }
    
    return input
}

var input1 = [4, 3, 7, 8, 6, 2, 1]
zigZag(&input1)

var input2 = [1, 4, 3, 2]
zigZag(&input2)
