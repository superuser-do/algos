import Foundation

func day2(_ nums: [Int]) -> [Int] {
    var prefixProducts = [Int]()
    for num in nums {
        if let last = prefixProducts.last {
            prefixProducts.append(last * num)
        } else {
            prefixProducts.append(num)
        }
    }
    
    var suffixProducts = [Int]()
    for num in nums.reversed() {
        if let last = suffixProducts.last {
            suffixProducts.append(last * num)
        } else {
            suffixProducts.append(num)
        }
    }
    suffixProducts = suffixProducts.reversed()
    
    var result = [Int]()
    for i in stride(from: 0, to: nums.count, by: 1) {
        if i == 0 {
            result.append(suffixProducts[i + 1])
        } else if i == nums.count - 1 {
            result.append(prefixProducts[i - 1])
        } else {
            result.append(prefixProducts[i - 1] * suffixProducts[i + 1])
        }
    }
    return result
}

day2([1, 2, 3, 4, 5])
day2([3, 2, 1])
