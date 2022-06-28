import AlgoHelpers


func append(head: ListNode<Int>?, target: Int, _ type: ExecutionType) -> ListNode<Int> {
    switch type {
    case .iterative:
        guard let head = head else {
            return ListNode(target)
        }
        var current = head
        
        while current.next != nil {
            current = current.next!
        }
        
        current.next = ListNode(target)
        
        return head
        
    case .recursive:
        let current = head
        
        guard let current = current else {
            return ListNode(target)
        }
        
        current.next = append(head: current.next, target: target, .recursive)
        
        return current
    }
}

let LL1 = ListNode(1, ListNode(4, ListNode(5)))
convertToArray(append(head: nil, target: 1, .iterative))
convertToArray(append(head: LL1, target: 7, .iterative))

convertToArray(append(head: nil, target: 1, .recursive))
convertToArray(append(head: LL1, target: 7, .recursive))
