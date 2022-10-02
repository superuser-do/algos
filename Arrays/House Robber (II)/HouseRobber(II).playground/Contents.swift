

func rob(_ nums: [Int]) -> Int {
    func helper(_ nums: [Int]) -> Int {
        var rob1 = 0
        var rob2 = 0
        for num in nums {
            let newRob = max(rob1 + num, rob2)
            rob1 = rob2
            rob2 = newRob
        }
        return rob2
    }

    return max(nums[0], helper(Array(nums.dropFirst(1))), helper(Array(nums.dropLast(1))))
}
rob([2,3,2])
