import AlgoHelpers

func deleteDuplicates<T: Equatable>(_ head: ListNode<T>?) -> ListNode<T>? {
    var current = head
    
    while current?.next != nil {
        if current?.value == current?.next?.value {
            current?.next = current?.next?.next
        } else {
            current = current?.next
        }
    }
    return head
}

func deleteDuplicatesRecursively<T: Equatable>(_ head: ListNode<T>?) -> ListNode<T>? {
    var current = head
    
    if current?.value == current?.next?.value {
        current?.next = current?.next?.next
    } else {
        current = current?.next
    }
    
    if current?.next != nil {
        current = deleteDuplicatesRecursively(current)
    }
    
    return head
}
