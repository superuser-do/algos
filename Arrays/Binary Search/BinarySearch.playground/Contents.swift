import Foundation

func binarySearch(_ array: [Int], target: Int) -> Int {
    var low = 0
    var high = array.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        
        if array[mid] < target {
            low = mid + 1
        } else if array[mid] > target {
            high = mid - 1
        } else {
            return mid
        }
    }
    
    return -1
}

let array = [1, 2, 3, 6, 8, 13, 113, 153, 200]
print(binarySearch(array, target: 1))
print(binarySearch(array, target: 200))
print(binarySearch(array, target: 8))
print(binarySearch(array, target: 154))
