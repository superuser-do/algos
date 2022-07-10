import Foundation

func maxPoints(_ points: [[Int]]) -> Int {
    guard points.count > 2 else { return points.count }
    
    func findSlope(_ p1: [Int], _ p2: [Int]) -> Double {
        if p1[0] == p2[0] {
            return Double.infinity
        } else if p1[1] == p2[1] {
            return 0
        } else {
            return Double((p1[1] - p2[1])) / Double((p1[0] - p2[0]))
        }
    }
    
    var ans = 1
    for (i, p1) in points.enumerated() {
        var slopeDict = [Double:Int]()
        for (_, p2) in points[i+1..<points.count].enumerated() {
            let slope = findSlope(p1, p2)
            slopeDict[slope] = slopeDict[slope, default:0] + 1
            ans = max(ans, slopeDict[slope]!)
        }
    }
    
    return ans+1
}

let points = [[3, 8], [4, 3], [5, 7], [6, 1], [9, 5], [10, 9], [11, 4], [14, 7], [15, 2], [15, 6], [16, 9], [19, 4]]
maxPoints(points)
