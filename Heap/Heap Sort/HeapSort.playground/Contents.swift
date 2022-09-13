

func heapSort(_ array: inout [Int]) -> [Int] {
    buildMaxHeap(&array)
    for endIndex in stride(from: array.count - 1, through: 1, by: -1) {
        array.swapAt(0, endIndex)
        siftDown(0, endIndex - 1, &array)
    }
    return array
}

func buildMaxHeap(_ array: inout [Int]) {
    let firstParentIndex = (array.count - 2) / 2
    for currentIndex in stride(from: firstParentIndex + 1, through: 0, by: -1) {
        siftDown(currentIndex, array.count - 1, &array)
    }
}

func siftDown(_ currentIndex: Int, _ endIndex: Int, _ heap: inout [Int]) {
    let childOneIndex = currentIndex * 2 + 1
    while childOneIndex <= endIndex {
        let childTwoIndex = (currentIndex * 2 + 2 <= endIndex) ? (currentIndex * 2 + 2) : -1
        let indexToSwap: Int
        if childTwoIndex > -1, heap[childTwoIndex] > heap[childOneIndex] {
            indexToSwap = childTwoIndex
        } else {
            indexToSwap = childOneIndex
        }
        if heap[indexToSwap] > heap[currentIndex] {
            heap.swapAt(currentIndex, indexToSwap)
        }
    }
}

