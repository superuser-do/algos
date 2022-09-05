

func countSmaller(_ nums: [Int]) -> [Int] {
    guard nums.count >= 1 else {
        return nums
    }
    var sorted = [Int]()
    var result = [Int]()
    
    func findIndex(_ value: Int) -> Int {
        guard !sorted.isEmpty else { return 0 }
        guard sorted.last! >= value else { return sorted.count }
        var left = 0, right = sorted.count - 1
        while left+1 <= right {
            let mid = left + ((right - left)/2)
            if sorted[mid] < value {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        if sorted[left] >= value { return left }
        return left + 1
    }
    
    
    for num in nums.reversed() {
        let index = findIndex(num)
        sorted.insert(num, at: index)
        result.append(index)
    }
    
    return result.reversed()
}
countSmaller([5,2,6,1])
