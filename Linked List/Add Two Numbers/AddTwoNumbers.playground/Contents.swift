import AlgoHelpers

func addTwoNumbers(_ l1: ListNode<Int>?, _ l2: ListNode<Int>?) -> ListNode<Int>? {
    var l1: ListNode<Int>? = l1
    var l2: ListNode<Int>? = l2
    
    let dummy: ListNode<Int>? = ListNode(0)
    var curr = dummy
    var carry = 0
    
    while l1 != nil || l2 != nil || carry != 0 {
        let sum = (l1?.value ?? 0) + (l2?.value ?? 0) + carry
        carry = sum / 10
        curr?.next = ListNode(sum % 10)
        curr = curr?.next
        l1 = l1?.next
        l2 = l2?.next
    }
    
    return dummy?.next
}

let ll1 = ListNode(2, ListNode(4, ListNode(3)))
let ll2 = ListNode(5, ListNode(6, ListNode(4)))
addTwoNumbers(ll1, ll2)
