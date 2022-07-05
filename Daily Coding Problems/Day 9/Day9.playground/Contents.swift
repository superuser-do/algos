import Foundation

func day9(array: [Int]) -> Int {
    guard array.count >= 2 else {
        return array.max() ?? 0
    }
    
    var cache = Array(repeating: 0, count: array.count)
    cache[0] = max(0, array[0])
    cache[1] = max(cache[0], array[1])
    
    for i in 2..<array.count {
        let num = array[i]
        cache[i] = max(num + cache[i - 2], cache[i - 1])
    }
    
    return cache.last!
}

day9(array: [2, 4, 6, 2, 5])


/// only the last two elements of cache are used when iterating through array
func day9(_ array: [Int]) -> Int {
    guard array.count >= 2 else {
        return array.max() ?? 0
    }
    
    var maxExcludingLast = max(0, array[0])
    var maxIncludingLast = max(maxExcludingLast, array[1])
    
    for number in 2..<array.count {
        let previousMaxIncludingLast = maxIncludingLast
        
        maxIncludingLast = max(maxIncludingLast, maxIncludingLast + number)
        maxExcludingLast = previousMaxIncludingLast
        
    }
    
    return max(maxIncludingLast, maxExcludingLast)
}

day9([2, 4, 6, 2, 5])
