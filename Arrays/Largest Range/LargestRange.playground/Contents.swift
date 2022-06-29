import Foundation

func largestRange(array: [Int]) -> [Int] {
    var bestRange = [Int]()
    var longestLength = 0
    var seen = [Int: Bool]()
    
    for num in array {
        seen[num] = false
    }
    
    for num in array {
        var currentLength = 1
        var left = num - 1
        var right = num + 1
        
        while seen.keys.contains(left) {
            currentLength += 1
            left -= 1
        }
        
        while seen.keys.contains(right) {
            currentLength += 1
            right += 1
        }
        
        if currentLength > longestLength {
            longestLength = currentLength
            bestRange = [left + 1, right - 1]
        }
    }
    
    return bestRange
}

largestRange(array: [2, 3, 4, 5, 6])
largestRange(array: [4, 2, 1, 3])
