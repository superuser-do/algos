import Foundation

func combination<T>(_ elements: inout [T]) -> [[T]] {
    guard !elements.isEmpty else { return [[]] }
    
    let first: T = elements.first!
    var remaining: [T] = Array(elements[1...])
    let combinationsOfRemaining = combination(&remaining)
    
    var result = [[T]]()
    combinationsOfRemaining.forEach { combo in
        result.append(combo)
        var comboWithFirst = combo
        comboWithFirst.append(first)
        result.append(comboWithFirst)
    }
    
    return result
}

var elements = ["a", "b", "c"]
combination(&elements)
