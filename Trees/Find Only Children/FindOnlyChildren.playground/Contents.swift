import AlgoHelpers

func hasSingleChildren<T>(root: TreeNode<T>?) -> [T] {
    var parents = [T]()

    func dfs(node: TreeNode<T>?) {
        guard let node = node else { return }

        if node.left != nil,
           node.right == nil {
            parents.append(node.value)
        }

        if node.right != nil,
           node.left == nil {
            parents.append(node.value)
        }

        dfs(node: node.left)
        dfs(node: node.right)
    }

    dfs(node: root)
    return parents
}

var root = TreeNode(1, TreeNode(2), TreeNode(3))
hasSingleChildren(root: root)

root = TreeNode(1, TreeNode(2, nil, TreeNode(4)), TreeNode(3))
hasSingleChildren(root: root)
