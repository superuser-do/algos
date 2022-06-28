import Foundation

func sortColors(_ nums: inout [Int]) {
    var i = 0
    var left = 0
    var right = nums.count - 1
    
    while i <= right {
        if nums[i] == 0 {
            nums.swapAt(i, left)
            i += 1
            left += 1
        } else if nums[i] == 2 {
            nums.swapAt(i, right)
            right -= 1
        } else {
            i += 1
        }
    }
}

var nums = [2,0,2,1,1,0]
sortColors(&nums)
