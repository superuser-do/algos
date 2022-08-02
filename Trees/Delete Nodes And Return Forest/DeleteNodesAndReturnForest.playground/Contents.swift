import AlgoHelpers

func delNodes(_ root: TreeNode<Int>?, _ to_delete: [Int]) -> [TreeNode<Int>?] {
    var remaining = [TreeNode<Int>?]()
    
    func delete(_ node: TreeNode<Int>?) -> TreeNode<Int>? {
        guard let node = node else { return nil }
        
        node.left = delete(node.left)
        node.right = delete(node.right)
        
        if to_delete.contains(node.value) {
            if let left = node.left {
                remaining.append(left)
            }
            
            if let right = node.right {
                remaining.append(right)
            }
            
            return nil
        }
        
        return node
    }
    
    if let node = delete(root) {
        remaining.append(node)
    }
    
    return remaining
}
