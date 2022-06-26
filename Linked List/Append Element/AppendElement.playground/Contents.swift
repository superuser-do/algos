import AlgoHelpers

func append(head: ListNode<Int>?, target: Int) -> ListNode<Int> {
    guard let head = head else {
        return ListNode(target)
    }
    var current = head
    
    while current.next != nil {
        current = current.next ?? ListNode(target)
    }
    
    return head
}

let LL1 = ListNode(1, ListNode(4, ListNode(5)))
append(head: nil, target: 1)
