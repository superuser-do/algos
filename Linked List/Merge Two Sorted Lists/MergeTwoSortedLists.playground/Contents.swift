import AlgoHelpers

func mergeLinkedLists(_ headOne: ListNode<Int>?, _ headTwo: ListNode<Int>?) -> ListNode<Int>? {
    let dummy = ListNode<Int>(-1)
    var prev = dummy
    var currOne = headOne
    var currTwo = headTwo
    
    while currOne != nil, currTwo != nil {
        if currOne!.value < currTwo!.value {
            prev.next = currOne
            currOne = currOne!.next
        } else {
            prev.next = currTwo
            currTwo = currTwo!.next
        }
        
        prev = prev.next!
    }
    
    prev.next = headOne == nil ? headTwo : headOne
    
    return dummy.next
}

