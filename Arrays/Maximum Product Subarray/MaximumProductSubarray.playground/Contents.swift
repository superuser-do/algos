

func maxProduct(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    guard !(nums.count == 1) else { return nums[0] }

    var maxProduct = nums.max()!
    var currentMin = 1
    var currentMax = 1
    for num in nums {
        let newMinProduct = currentMin * num
        let newMaxProduct = currentMax * num

        currentMin = min(newMinProduct, newMaxProduct, num)
        currentMax = max(newMinProduct, newMaxProduct, num)

        maxProduct = max(maxProduct, currentMax)
    }

    return maxProduct
}

maxProduct([2,3,-2,4])
