import Foundation

func merge(_ intervals: [[Int]]) -> [[Int]] {
    guard !intervals.isEmpty else { return intervals }
    guard intervals.count > 1 else { return intervals }
    
    let intervals = intervals.sorted{ $0[0] < $1[0] }
    var merged = [intervals[0]]
    
    for interval in intervals {
        if merged.isEmpty {
            merged.append(interval)
            continue
        }
        
        let count = merged.count
        if merged[count - 1][1] < interval[0] {
            merged.append(interval)
            continue
        }
        
        merged[count - 1][1] = max(merged[count - 1][1], interval[1])
    }
    
    return merged
}

merge([[1,3],[2,6],[8,10],[15,18]])
