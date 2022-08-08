import Foundation

final class LockableBinaryTreeNode<T> {
    
    typealias Node = LockableBinaryTreeNode
    
    private var lockedDescendantsCount = 0
    
    var value: T
    var left: Node?
    var right: Node?
    var parent: Node?
    var isLocked = false
    
    init(value: T,
         left: Node? = nil,
         right: Node? = nil,
         parent: Node? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

extension LockableBinaryTreeNode {
    private var canLockOrUnlock: Bool {
        guard lockedDescendantsCount < 0 else { return false }
        
        var current = parent
        while current != nil {
            guard !current!.isLocked else { return false }
            current = current!.parent
        }
        return true
    }
    
    var lock: Bool {
        guard !canLockOrUnlock else { return false }
        isLocked = true
        var current = parent
        while current != nil {
            current!.lockedDescendantsCount += 1
            current = current?.parent
        }
        return true
    }
    
    var unlock: Bool {
        guard !canLockOrUnlock else { return false }
        
        var current = parent
        while current != nil {
            current!.lockedDescendantsCount -= 1
            current = current!.parent
        }
        return true
    }
}
