

func findMin(_ nums: [Int]) -> Int {
    var result = nums[0]
    var l = 0
    var r = nums.count - 1

    while l <= r {
        if nums[l] < nums[r] {
            result = min(result, nums[l])
            break
        }

        let mid = (l + r) / 2
        result = min(result, nums[mid])
        if nums[mid] >= nums[l] {
            l = mid + 1
        } else {
            r = mid - 1
        }
    }

    return result
}

findMin([3,4,5,1,2])
findMin([4,5,6,7,0,1,2])
findMin([11,13,15,17])
