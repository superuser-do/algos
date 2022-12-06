

func apartmentHunting(_ blocks: [[String: Bool]], _ requirements: [String]) -> Int {
    let minDistanceFromBlocks = requirements.map { requirement in
        getMinDistances(blocks, requirement)
    }

    let maxDistanceAtBlocks = getMaxDistanceAtBlocks(blocks, minDistanceFromBlocks)

    return getIdxAtMinValue(maxDistanceAtBlocks)

    return -1
}

func getMinDistances(_ blocks: [[String: Bool]], _ req: String) -> [Int] {
    var minDistances = Array(repeating: 0, count: blocks.count)
    var closestReqIdx = Int.max

    // l -> r
    for i in 0..<blocks.count {
        if blocks[i][req] == true {
            closestReqIdx = i
        }

        minDistances[i] = distanceBetween(i, closestReqIdx)
    }

    // r -> l
    for i in (0..<blocks.count).reversed() {
        if blocks[i][req] == true {
            closestReqIdx = i
        }

        minDistances[i] = min(minDistances[i], distanceBetween(i, closestReqIdx))
    }

    return minDistances
}

func distanceBetween(_ a: Int, _ b: Int) -> Int {
    abs(a - b)
}

func getMaxDistanceAtBlocks(_ blocks: [[String: Bool]], _ minDistancesFromBlocks: [[Int]]) -> [Int] {
    var maxDistanceAtBlocks = Array(repeating: 0, count: blocks.count)

    for i in 0..<blocks.count {
        let minDistancesAtBlock = minDistancesFromBlocks.map { distances in
            distances[i]
        }
        maxDistanceAtBlocks[i] = minDistancesAtBlock.max()!
    }

    return maxDistanceAtBlocks
}

func getIdxAtMinValue(_ array: [Int]) -> Int {
    var idxAtMinValue = 0
    var minValue = Int.max

    for (index, value) in array.enumerated() {
        if value < minValue {
            minValue = value
            idxAtMinValue = index
        }
    }

    return idxAtMinValue
}

let blocks = [
    [
      "gym": false,
      "school": true,
      "store": false,
    ],
    [
      "gym": true,
      "school": false,
      "store": false,
    ],
    [
      "gym": true,
      "school": true,
      "store": false,
    ],
    [
      "gym": false,
      "school": true,
      "store": false,
    ],
    [
      "gym": false,
      "school": true,
      "store": true,
    ],
  ]

let reqs = ["gym", "school", "store"]

apartmentHunting(blocks, reqs)
