import Foundation

func day4(_ nums: [Int]) -> Int {
    let numbers = Set(nums)
    var current_number = 1
    while numbers.contains(current_number) {
        current_number += 1
    }
    return current_number
}

day4([3, 4, -1, 1])
day4([1, 2, 0])
