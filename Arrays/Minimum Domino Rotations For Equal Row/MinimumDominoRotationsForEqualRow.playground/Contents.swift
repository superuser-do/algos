

func minDominoRotations(_ tops: [Int], _ bottoms: [Int]) -> Int {
    for target in [tops[0], bottoms[0]] {
        var missingTop = 0, missingBottom = 0
        for (index, pair) in zip(tops, bottoms).enumerated() {
            let top = pair.0, bottom = pair.1
            if !(top == target || bottom == target) {
                break
            }
            if top != target {
                missingTop += 1
            }
            if bottom != target {
                missingBottom += 1
            }
            if index == tops.count - 1 {
                return min(missingTop, missingBottom)
            }
        }
    }
    
    return -1
}

minDominoRotations([2,1,2,4,2,2], [5,2,6,2,3,2])
minDominoRotations([3,5,1,2,3], [3,6,3,3,4])
