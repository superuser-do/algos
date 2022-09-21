

func isMajorityElement(_ nums: [Int], _ target: Int) -> Bool {
    // # LC: [#34](https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array) Find First and Last Position of Element in Sorted Array
    func findFirstAndLastOccurrence(_ nums: [Int], _ target: Int) -> [Int] {
        var left = -1, right = -1

        var start = 0, end = nums.count - 1
        while start + 1 < end {
            let mid = (start + end) / 2
            if nums[mid] == target {
                start = mid
            } else {
                end = mid
            }
        }

        if nums[start] == target {
            right = start
        }
        if nums[end] == target {
            right = end
        }

        start = 0; end = nums.count - 1
        while start + 1 < end {
            let mid = (start + end) / 2
            if nums[mid] == target {
                end = mid
            } else {
                start = mid
            }
        }
        print(nums[end], nums[start], target)
        if nums[end] == target {
            left = end
        }
        if nums[start] == target {
            left = start
        }

        return [left, right]
    }

    let N = nums.count
    if nums[N/2] != target {
        return false
    }

    let indices = findFirstAndLastOccurrence(nums, target)
    return (indices.last! - indices.first! + 1) > nums.count / 2
}

isMajorityElement([2,4,5,5,5,5,5,6,6], 5)
isMajorityElement([10,100,101,101], 101)
