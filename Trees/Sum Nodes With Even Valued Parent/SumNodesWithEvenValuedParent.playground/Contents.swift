import AlgoHelpers

func sumNodesWithEvenParent(root: TreeNode<Int>?) -> Int {
    guard let root = root else { return 0 }

    var total = [0]

    func dfs(node: TreeNode<Int>?, parentValue: Int? = nil) {
        guard let node = node else { return }

        if let parentValue = parentValue,
           parentValue % 2 == 0 {
            total[0] += node.value
        }

        dfs(node: node.left, parentValue: node.value)
        dfs(node: node.right, parentValue: node.value)
    }

    dfs(node: root)
    return total[0]
}

sumNodesWithEvenParent(root: nil)
let root = TreeNode(6,
                    TreeNode(7,
                             TreeNode(2),
                             TreeNode(7)
                            ),
                    TreeNode(8,
                             TreeNode(1),
                             TreeNode(3)
                            )
)
sumNodesWithEvenParent(root: root)
