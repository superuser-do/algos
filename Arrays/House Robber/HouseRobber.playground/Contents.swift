

func rob_recursive(_ nums: [Int]) -> Int {
    func helper(_ index: Int) -> Int {
        guard index >= 0 else { return 0 }

        return max(helper(index - 2) + nums[index], helper(index - 1))
    }
    return helper(nums.count - 1)
}

rob_recursive([1,2,3,1])

func rob_recursive_memo(_ nums: [Int]) -> Int {
    var memo = Array(repeating: -1, count: nums.count)

    func helper(_ index: Int) -> Int {
        guard index >= 0 else { return 0 }

        if memo[index] >= 0 {
            return memo[index]
        }

        let result = max(memo[index - 2] + nums[index], memo[index - 1])
        memo[index] = result
        return result
    }

    return helper(nums.count - 1)
}

rob_recursive_memo([1,2,3,1])

func rob_iterative_memo(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    if nums.count == 1 {
        return nums[0]
    }
    if nums.count == 2 {
        return max(nums[0], nums[1])
    }

    var memo = [Int]()
    memo.append(nums[0])
    memo.append(max(nums[0], nums[1]))

    for i in 2..<nums.count {
        memo.append(max(memo[i - 1], memo[i - 2] + nums[i]))
    }

    return memo[nums.count - 1]
}

rob_iterative_memo([1,2,3,1])

func rob_iterative_fib_style(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }

    var prev1 = 0
    var prev2 = 0
    for num in nums {
        var temp = prev1
        prev1 = max(prev2 + num, prev1)
        prev2 = temp
    }

    return prev1
}

rob_iterative_fib_style([1,2,3,1])
