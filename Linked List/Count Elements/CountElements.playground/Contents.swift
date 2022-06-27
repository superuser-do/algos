import AlgoHelpers

func countElements<T>(head: ListNode<T>?, _ type: ExecutionType) -> Int {
    switch type {
    case .iterative:
        guard var current = head else {
            return 0
        }
        
        var count = 1
        while current.next != nil {
            current = current.next!
            count += 1
        }
        
        return count
        
    case .recursive:
        guard let head = head else { return 0 }
        
        return 1 + countElements(head: head.next, .recursive)
    }
}

let LL1 = ListNode(1, ListNode(4, ListNode(5)))
countElements(head: LL1, .iterative)
countElements(head: LL1, .recursive)
