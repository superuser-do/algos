import AlgoHelpers

func immediateParentSum(_ root: TreeNode<Int>?, _ parentValue: Int = 0) -> TreeNode<Int>? {
    guard let root = root else { return nil }

    immediateParentSum(root.left, root.value)
    immediateParentSum(root.right, root.value)
    root.value += parentValue
    return root
}

let root = TreeNode(1, TreeNode(2), TreeNode(3))
immediateParentSum(root)
