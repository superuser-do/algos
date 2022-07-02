import Foundation

func rotate(_ nums: inout [Int], _ k: Int) -> [Int] {
    var starting = 0
    var ending = nums.count - 1
    swap(array: &nums, starting: &starting, ending: &ending)
    
    starting = 0
    ending = k - 1
    swap(array: &nums, starting: &starting, ending: &ending)
    
    starting = k
    ending = nums.count - 1
    swap(array: &nums, starting: &starting, ending: &ending)
    
    return nums
}

private func swap(array: inout [Int], starting: inout Int, ending: inout Int) -> [Int] {
    while starting < ending {
        array.swapAt(starting, ending)
        starting += 1
        ending -= 1
    }
    return array
}

var nums = [1,2,3,4,5]
rotate(&nums, 2)
