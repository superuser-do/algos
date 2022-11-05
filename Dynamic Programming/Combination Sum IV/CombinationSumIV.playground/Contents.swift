

func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
    var dp = [0: 1]

    for total in 1...target {
        for num in nums {
            dp[total, default: 0] += dp[total - num, default: 0]
        }
    }

    return dp[target]!
}

combinationSum4([1,2,3], 4)
