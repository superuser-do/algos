import Foundation


func splitArray(_ nums: [Int], _ m: Int) -> Int {
    func canSplit(_ largest: Int) -> Bool {
        var subarray = 0, currentSum = 0
        for num in nums {
            currentSum += num
            if currentSum > largest {
                subarray += 1
                currentSum = num
            }
        }
        return subarray + 1 <= m
    }
    
    var left = nums.reduce(Int.min, {max($0, $1)}), right = nums.reduce(0, +)
    var result = right
    while left <= right {
        let mid = left + ((right - left)/2)
        if canSplit(mid) {
            result = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return result
    
    
}

splitArray([7,2,5,10,8], 2)

// doesn't work
func splitArray(nums: [Int], m: Int) -> Int {
    struct Key: Hashable {
        let i: Int
        let m: Int
    }
    
    var dp = [Key: Int]()
    
    func dfs(_ i: Int, _ m: Int) -> Int {
        if m == 1 {
            return nums[1...].reduce(0, +)
        }
        if dp.keys.contains(Key(i: i, m: m)) {
            return dp[Key(i: i, m: m)]!
        }
        var result = Int.max, currentSum = 0
        for j in i..<(nums.count - m + 1) {
            currentSum += nums[j]
            let maxSum = max(currentSum, dfs(j + 1, m - 1))
            result = min(result, maxSum)
            if currentSum > result {
                break
            }
        }
        dp[Key(i: i, m: m)] = result
        return result
    }
    
    return dfs(0, m)
}

splitArray(nums: [7,2,5,10,8], m: 2)
