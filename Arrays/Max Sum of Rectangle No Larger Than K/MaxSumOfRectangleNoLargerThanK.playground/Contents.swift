

// Binary search
func find(_ cache: [Int], _ target: Int) -> Int {
    var i = 0
    var j = cache.count - 1
    
    while i <= j {
        let m = i + (j - i) / 2
        
        if cache[m] == target {
            return m
        } else if cache[m] < target {
            i = m + 1
        } else {
            j = m - 1
        }
    }
    
    return i
}

// Searching for Int no larger than K
func findMax(_ array: [Int], _ k: Int) -> Int {
    
    // Storing current sums in ascending order, we will use cache for searching for additions to K
    var cache = [Int]()
    // Default addition in case then we find K
    cache.append(0)
    
    var currentMax = Int.min
    var currentSum = 0
    
    for i in 0..<array.count {
        
        currentSum += array[i]
        
        // Using binary search we find the index of (currentSum - k)
        // or the next element if (currentSum - k) is not presented in cache
        let index = find(cache, currentSum - k)
        if index < cache.count {
            currentMax = max(currentMax, currentSum - cache[index])
        }
        
        // Searching for the insertion index to keep the order in cache
        let insertionIndex = find(cache, currentSum)
        cache.insert(currentSum, at: insertionIndex)
    }
    
    return currentMax
}

func maxSumSubmatrix(_ matrix: [[Int]], _ k: Int) -> Int {
    
    var currentMax = Int.min
    
    let m = matrix.count
    let n = matrix[0].count
    
    for i in 0..<m {
        
        // Storing prefix sums of columns for rows between i and m
        var sum = Array(repeating: 0, count: n)
        
        for j in i..<m {
            
            for p in 0..<n {
                sum[p] += matrix[j][p]
            }
            
            // Searching throughout prefix sums of columns for sum no larger than K
            let findMax = findMax(sum, k)
            currentMax = max(currentMax, findMax)
        }
    }
    
    return currentMax
}

maxSumSubmatrix([[1,0,1],[0,-2,3]], 2)
