import Foundation

func reduceSum(_ input: inout [Int]) -> [Int] {
    guard !input.isEmpty else { return [0] }
    guard input.count != 1 else { return [input.first!] }
    
    var result = [Int]()
    for i in 0..<input.count - 1 {
        result.append(input[i] + input[i + 1])
    }
    
    return reduceSum(&result)
}

var input = [1,2,3,4,5]
reduceSum(&input)
