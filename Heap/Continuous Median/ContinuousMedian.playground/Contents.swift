

import AlgoHelpers

class ContinuousMedianHandler {
    var maxHeap = Heap<Int>(sort: >)
    var minHeap = Heap<Int>(sort: <)

    func insert(_ number: Int) {
        if maxHeap.isEmpty || maxHeap.count == minHeap.count {
            maxHeap.insert(number)
            return
        } else {
            if maxHeap.count - minHeap.count > 0 {
                if maxHeap.peek()! > number {
                    minHeap.insert(maxHeap.remove()!)
                    maxHeap.insert(number)
                } else {
                    minHeap.insert(number)
                }
            } else {
                if maxHeap.peek()! < number {
                    maxHeap.insert(number)
                } else {
                    minHeap.insert(number)
                }
            }
        }
    }

    func findMedian() -> Double {
        if minHeap.count < 1 {
            return Double(maxHeap.peek()!)
        }
        if maxHeap.peek()! > minHeap.peek()! {
            let temp = minHeap.remove()!
            minHeap.insert(maxHeap.remove()!)
            maxHeap.insert(temp)
        }
        if maxHeap.count > minHeap.count {
            return Double(maxHeap.peek()!)
        } else {
            return (Double(maxHeap.peek()!) + Double(minHeap.peek()!)) / 2
        }
    }
}
