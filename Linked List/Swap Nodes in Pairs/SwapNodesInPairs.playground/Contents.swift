import AlgoHelpers

func swapNodes(_ head: ListNode<Int>?, _ k: Int) -> ListNode<Int>? {
    var listLength = 0
    var firstNode: ListNode<Int>? = nil
    var endNode: ListNode<Int>? = nil
    var currentNode = head
    
    while currentNode != nil {
        listLength += 1
        
        if endNode != nil {
            endNode = endNode?.next
        }
        
        if listLength == k {
            firstNode = currentNode
            endNode = head
        }
        
        currentNode = currentNode?.next
    }
    
    let tempNodeValue = firstNode?.value
    firstNode?.value = endNode!.value
    endNode?.value = tempNodeValue!
    return head
}

let ll = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
swapNodes(ll, 2)
