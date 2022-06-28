import Foundation

func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 2 else { return  [] }
    
    let nums = nums.sorted()
    var triplets = Set<[Int]>()
    
    for i in 0..<nums.count {
        var left = i + 1
        var right = nums.count - 1
        
        while left < right {
            let currentSum = nums[i] + nums[left] + nums[right]
            if currentSum  == 0 {
                let triplet = [nums[i], nums[left], nums[right]]
                triplets.insert(triplet)
                left += 1
            } else if currentSum < 0 {
                left += 1
            } else {
                right -= 1
            }
        }
    }
    
    return Array(triplets)
}


threeSum([-1,0,1,2,-1,-4])
