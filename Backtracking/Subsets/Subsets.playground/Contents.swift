

func subsets(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var subset = [Int]()
    
    func backtrack(_ i: Int) {
        guard i < nums.count else {
            result.append(subset)
            return
        }
        
        // Include nums[i]
        subset.append(nums[i])
        
        backtrack(i + 1)
        
        // Don't include nums[i]
        subset.popLast()
        backtrack(i + 1)
    }
    
    backtrack(0)
    return result
}

subsets([1,2,3])
