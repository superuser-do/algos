import Foundation

func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var newInterval = newInterval
    for interval in intervals {
        if interval.last! < newInterval.first! {
            result.append(interval)
        } else if interval.first! > newInterval.last! {
            result.append(newInterval)
            newInterval = interval
        } else if interval.last! >= newInterval.first! || interval.first! <= newInterval.last! {
            newInterval[0] = min(interval.first!, newInterval.first!)
            newInterval[1] = max(interval.last!, newInterval.last!)
        }
    }
    result.append(newInterval)
    return result
}
insert([[1,3],[6,9]], [2,5])
