import AlgoHelpers

func isUnivalTree(_ root: TreeNode<Int>?) -> Bool {
    guard let root = root else { return true }
    let value = root.value

    func dfs(node: TreeNode<Int>?) -> Bool {
        guard let node = node else { return true }

        if value != node.value {
            return false
        }

        return dfs(node: node.left) && dfs(node: node.right)
    }

    return dfs(node: root)
}

let root = TreeNode(1, TreeNode(1, TreeNode(1), TreeNode(1)), TreeNode(1, nil, TreeNode(1)))
isUnivalTree(root)
