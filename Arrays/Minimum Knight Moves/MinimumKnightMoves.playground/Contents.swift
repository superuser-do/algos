

func minKnightMoves(_ x: Int, _ y: Int) -> Int {

    struct Loc: Hashable {
        var x: Int
        var y: Int
    }

    // the offsets in the eight directions
    let offsets = [(1, 2), (2, 1), (2, -1), (1, -2),
                   (-1, -2), (-2, -1), (-2, 1), (-1, 2)]

    // data structures needed to move from the origin point
    var originQueue = [(x: 0, y: 0, level: 0)]
    var originDistance = [Loc(x: 0, y: 0): 0]

    // data structures needed to move from the target point
    var targetQueue = [(x: x, y: y, level: 0)]
    var targetDistance = [Loc(x: x, y: y): 0]

    while true {
        // check if we reach the circle of target
        let origin = originQueue.removeFirst()
        if targetDistance.keys.contains(Loc(x: origin.x, y: origin.y)),
           let targetDistanceLoc = targetDistance[Loc(x: origin.x, y: origin.y)] {
            return origin.level + targetDistanceLoc
        }

        // check if we reach the circle of origin
        let target = targetQueue.removeFirst()
        if originDistance.keys.contains(Loc(x: target.x, y: target.y)),
           let originDistanceLoc = originDistance[Loc(x: target.x, y: target.y)] {
            return target.level + originDistanceLoc
        }

        offsets.forEach { offsetX, offsetY in
            // expand the circe of origin
            let nextOriginX = origin.x + offsetX
            let nextOriginY = origin.y + offsetY
            if !originDistance.keys.contains(Loc(x: nextOriginX, y: nextOriginY)) {
                originQueue.append((x: nextOriginX, y: nextOriginY, level: origin.level + 1))
                originDistance[Loc(x: nextOriginX, y: nextOriginY)] = origin.level + 1
            }

            // expand the circle of target
            let nextTargetX = target.x + offsetX
            let nextTargetY = target.y + offsetY
            if !targetDistance.keys.contains(Loc(x: nextTargetX, y: nextTargetY)) {
                targetQueue.append((x: nextTargetX, y: nextTargetY, level: target.level + 1))
                targetDistance[Loc(x: nextTargetX, y: nextTargetY)] = target.level + 1
            }
        }
    }

    return -1
}

minKnightMoves(2, 1)
minKnightMoves(5, 5)
