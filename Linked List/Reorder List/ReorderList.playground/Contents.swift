import AlgoHelpers

func reorderList<T>(_ head: ListNode<T>?) {
    guard let head = head else { return }
    var lhs: ListNode<T>? = head, rhs: ListNode<T>? = head
    
    split(&lhs, &rhs)
    lhs = head
    
    rhs = reverse(&rhs)
    merge(&lhs, &rhs)
}

private func split<T>(_ slow: inout ListNode<T>?, _ fast: inout ListNode<T>?) {
    while fast != nil && fast!.next != nil {
        slow = slow!.next
        fast = fast!.next!.next
    }
    
    guard let next = slow!.next else { return }
    
    fast = next
    slow!.next = nil
}

private func reverse<T>(_ head: inout ListNode<T>?) -> ListNode<T>? {
    var curr = head
    var node: ListNode<T>?
    while curr != nil {
        let next = curr!.next
        curr!.next = node
        node = curr
        curr = next
    }
    return node
}

private func merge<T>(_ first: inout ListNode<T>?, _ second: inout ListNode<T>?) {
    while first != nil && second != nil {
        let prev = first!.next
        let post = second!.next
        first!.next = second
        second!.next = prev
        first = prev
        second = post
    }
}

var head = ListNode(1, ListNode(2, ListNode(3, ListNode(4))))
reorderList(head)
