import Foundation

func waterArea(_ heights: [Int]) -> Int {
    var waterLevel = Array(repeating: 0, count: heights.count)
    
    var leftMax = 0
    for i in 0..<heights.count {
        let currentHeight = heights[i]
        waterLevel[i] = leftMax
        leftMax = max(leftMax, currentHeight)
    }
    
    var rightMax = 0
    for i in stride(from: heights.count - 1, to: 0, by: -1) {
        let currentHeight = heights[i]
        let minHeight = min(rightMax, waterLevel[i])
        if (currentHeight < minHeight) {
            waterLevel[i] = minHeight - currentHeight
        } else {
            waterLevel[i] = 0
        }
        rightMax = max(rightMax, currentHeight)
    }
    
    return waterLevel.reduce(0, +)
}

waterArea([0, 8, 0, 0, 5, 0, 0, 10, 0, 0, 1, 1, 0, 3])
