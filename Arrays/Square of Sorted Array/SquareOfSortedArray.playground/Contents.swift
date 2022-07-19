import Foundation

func sortedSquares(_ nums: [Int]) -> [Int] {
    var result = Array(repeating: 0, count: nums.count)
    var left = 0
    var right = nums.count - 1
    
    for i in stride(from: nums.count - 1, to: -1, by: -1) {
        var square = Int()
        if abs(nums[left]) < abs(nums[right]) {
            square = nums[right]
            right -= 1
        } else {
            square = nums[left]
            left += 1
        }
        result[i] = square * square
    }
    
    return result
}

sortedSquares([-4,-1,0,3,10])
sortedSquares([-7,-3,2,3,11])
