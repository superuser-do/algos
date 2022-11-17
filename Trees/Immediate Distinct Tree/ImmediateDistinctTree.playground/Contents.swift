import AlgoHelpers

func treeIsImmediatelyDistinct(root: TreeNode<Int>?) -> Bool {
    func dfs(node: TreeNode<Int>?, parentValue: Int? = nil) -> Bool {
        guard let node = node else { return true }

        if node.value == parentValue {
            return false
        }

        return dfs(node: node.left, parentValue: node.value) && dfs(node: node.right, parentValue: node.value)
    }

    return dfs(node: root)
}

var root = TreeNode(1,
                    TreeNode(1,
                             TreeNode(3),
                             TreeNode(4)
                            ),
                    TreeNode(2,
                             nil,
                             TreeNode(6)
                            )
)
treeIsImmediatelyDistinct(root: root)

root = TreeNode(1,
                TreeNode(2,
                         TreeNode(5),
                         TreeNode(9)
                        ),
                TreeNode(2)
)
treeIsImmediatelyDistinct(root: root)
