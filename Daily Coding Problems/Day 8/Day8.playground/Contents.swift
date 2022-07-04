import AlgoHelpers

func day8<T: Equatable>(root: TreeNode<T>?) -> Int {
    func helper(root: TreeNode<T>?) -> (count: Int, isUnival: Bool) {
        guard let root = root else {
            return (0, true)
        }
        
        let (count: leftCount, isUnival: isLeftUnival) = helper(root: root.left)
        let (count: rightCount, isUnival: isRightUnival) = helper(root: root.right)
        let totalCount = leftCount + rightCount
        
        if isLeftUnival, isRightUnival {
            if root.left != nil,
               root.value != root.left!.value {
                return (totalCount, false)
            }
            
            if root.right != nil,
               root.value != root.right!.value {
                return (totalCount, false)
            }
            
            return (totalCount + 1, true)
               
        }
        
        return (totalCount, false)
    }
    
    let (count: count, isUnival: _) = helper(root: root)
    return count
}

var tree = TreeNode(0)
tree.left = TreeNode(1)
tree.right = TreeNode(0)
tree.right!.left = TreeNode(1)
tree.right!.right = TreeNode(0)
tree.right!.left!.left = TreeNode(1)
tree.right!.left!.right = TreeNode(1)

day8(root: tree)
