import AlgoHelpers
import Darwin

func chunkSegments(_ head: ListNode<Int>?, _ k: Int) -> [ListNode<Int>] {
    var current = head
    var result = [Int]()

    while current != nil {
        result.append(current!.value)
        current = current!.next
    }
    
    var n = result.count
    var k = k
    var idx = 0
    var output = [ListNode<Int>]()
    while k > 0 {
        let length = n / k
        n -= length
        k -= 1
        let newHead = ListNode<Int>(-1)
        var ll = newHead
        for _ in 0..<length {
            ll.next = ListNode<Int>(result[idx])
            ll = ll.next!
            idx += 1
        }
        output.append(newHead.next!)
    }
    return output
}
let ll = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
chunkSegments(ll, 5)
