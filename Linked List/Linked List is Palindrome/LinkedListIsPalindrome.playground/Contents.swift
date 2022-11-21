import AlgoHelpers

func isPalindrome<T: Equatable>(head: ListNode<T>?) -> Bool {
    guard head != nil else { return false }

    var head: ListNode<T>? = head

    var middle = middleNode(head)
    var reversed = reverseList(middle)

    while reversed != nil {
        if head?.value != reversed?.value {
            return false
        }

        head = head?.next
        reversed = reversed?.next
    }

    return true
}

func middleNode<T>(_ head: ListNode<T>?) -> ListNode<T>? {
    if head == nil {
        return nil
    }

    var slow = head
    var fast = head

    while fast != nil,
          fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }

    return slow
}

func reverseList<T>(_ head: ListNode<T>?) -> ListNode<T>? {
    var previous: ListNode<T>? = nil
    var current: ListNode<T>? = head

    while current != nil {
        let nextTmp = current?.next
        current?.next = previous
        previous = current
        current = nextTmp
    }

    return previous
}


let head = ListNode(1, ListNode(2, ListNode(2, ListNode(1))))
isPalindrome(head: head)
