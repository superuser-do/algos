import Foundation

func kadane(_ array: [Int]) -> Int {
    guard array.count > 0 else { return 0 }
    guard array.count > 1 else { return array[0] }
    
    var currentMax = array[0]
    var globalMax = currentMax
    for num in array[1...] {
        currentMax = max(currentMax + num, num)
        globalMax = max(globalMax, currentMax)
    }
    
    return globalMax
}

kadane([2, 2, -3, 6, -10, 4])
