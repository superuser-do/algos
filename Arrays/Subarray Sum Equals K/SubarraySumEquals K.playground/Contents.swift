

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    guard !nums.isEmpty else { return 0 }

    var result = 0
    var currentSum = 0
    var prefixSum = [0: 1]

    for num in nums {
        currentSum += num
        let diff = currentSum - k

        result += prefixSum[diff, default: 0]
        prefixSum[currentSum] = 1 + prefixSum[currentSum, default: 0]
    }

    return result
}

