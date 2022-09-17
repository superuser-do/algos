

func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    let sorted = intervals.sorted { $0[0] <= $1[0] }
    var result = 0
    var prevEnd = intervals[0][1]
    for i in intervals[1...] {
        let start = i.first!, end = i.last!
        if start >= prevEnd {
            prevEnd = end
        } else {
            result += 1
            prevEnd = min(prevEnd, end)
        }
    }
    return result
}
eraseOverlapIntervals([[1,2],[2,3],[3,4],[1,3]])
