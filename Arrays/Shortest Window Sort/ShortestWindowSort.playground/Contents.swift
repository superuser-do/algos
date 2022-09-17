

func findUnsortedSubarray(_ nums: [Int]) -> Int {
    var start = Int.max, end = Int.min
    var isSorted = true

    for i in 1..<nums.count {
        if nums[i] < nums[i-1] {
            isSorted = false
            end = min(end, nums[i])
        }
    }

    isSorted = true
    for i in stride(from: nums.count - 2, through: 0, by: -1) {
        if nums[i] > nums[i+1] {
            isSorted = false
            start = max(start, nums[i])
        }
    }

    var left = Int(), right = Int()
    for left in 0..<nums.count {
        if end < nums[left] {
            break
        }
    }

    for right in stride(from: nums.count - 1, through: 0, by: -1) {
        if start > nums[right] {
            break
        }
    }

    return right - left < 0 ? right - left : right - left + 1
}

findUnsortedSubarray([2,6,4,8,10,9,15])
