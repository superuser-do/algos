import AlgoHelpers

func firstIndexInLL(_ node: inout ListNode<Int>?, _ target: Int) -> Int {
    if node == nil {
        return -1
    }
    
    var index = 0
    while node != nil {
        if node!.value == target {
            return index
        }
        index += 1
        node = node!.next
    }
    
    return -1
}

var ll: ListNode<Int>? = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
firstIndexInLL(&ll, 3)
