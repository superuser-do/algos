

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    let nums = nums.sorted()
    var result = [[Int]](), quad = [Int]()

    func kSum(k: Int, start: Int, target: Int) {
        if k != 2 {
            for i in start..<(nums.count - k + 1) {
                if i > start, nums[i] == nums[i-1] {
                    continue
                }

                quad.append(nums[i])
                kSum(k: k-1, start: i+1, target: target-nums[i])
                quad.removeLast()
            }
            return
        }

        var l = start, r = nums.count - 1
        while l < r {
            let s = nums[l] + nums[r]
            if s < target {
                l += 1
            } else if s > target {
                r -= 1
            } else {
                result.append(quad + [nums[l], nums[r]])
                l += 1
                while l < r, nums[l] == nums[l-1] {
                    l += 1
                }
            }
        }
    }
    kSum(k: 4, start: 0, target: target)
    return result
}
fourSum([4, 1, 2, -1, 1, -3], 1)
fourSum([2, 0, -1, 1, -2, 2], 2)
