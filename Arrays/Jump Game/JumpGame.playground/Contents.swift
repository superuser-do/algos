

func minJumps(_ nums: [Int]) -> Int {
    var jumps = Array(repeating: Int.max, count: nums.count)
    jumps[0] = 0
    for i in 1..<nums.count {
        for j in 0..<i {
            if nums[j] + j >= i {
                jumps[i] = min(jumps[j] + 1, jumps[i])
            }
        }
    }
    return jumps.last!
}

minJumps([2,3,1,1,4])

func canJump(_ nums: [Int]) -> Bool {
    var goal = nums.count - 1
    for i in stride(from: nums.count - 2, to: -1, by: -1) {
        if i + nums[i] >= goal {
            goal = i
        }
    }
    return goal == 0
}

canJump([2,3,1,1,4])
