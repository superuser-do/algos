

func nextPermutation(_ nums: inout [Int]) {
    guard !nums.isEmpty else { return }

    // Find the first occurrence of decreasing sequence from right
    var index = nums.count - 2
    while index >= 0,
          nums[index] >= nums[index + 1] {
        index -= 1
    }

    // Find the next largest element in the remaining part of nums from index to num.count-1
    if index >= 0 {
        var i = nums.count - 1
        while i >=  0,
              nums[i] <= nums[index] {
            i -= 1
        }
        nums.swapAt(i, index)
    }

    // Reverse the array from index + 1 to nums.count - 1
    var left = index + 1, right = nums.count - 1
    while left <= right {
        nums.swapAt(left, right)
        left += 1
        right -= 1
    }
}

var nums = [1,2,3]
nextPermutation(&nums)
