import AlgoHelpers

func lastStoneWeight(_ stones: [Int]) -> Int {
    guard stones.count > 0 else {
        return 0
    }

    var maxHeap = Heap<Int>(array: stones){ $0 >= $1 }

    while maxHeap.count > 1 {
        let stone1 = maxHeap.remove()!
        let stone2 = maxHeap.remove()!
        if stone1 != stone2 {
            maxHeap.insert(max(stone1, stone2) - min(stone1, stone2))
        }
    }

    return !maxHeap.isEmpty ? maxHeap.remove()! : 0
}

lastStoneWeight([2,7,4,1,8,1])
lastStoneWeight([1])
