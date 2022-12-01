import AlgoHelpers

func getMinimumDifference(_ root: TreeNode<Int>?) -> Int {
    var values = [Int]()

    func inOrder(_ root: TreeNode<Int>?) {
        guard let node = root else { return }

        inOrder(node.left)
        values.append(node.value)
        inOrder(node.right)
    }

    inOrder(root)
    var diff = Int.max
    for i in 1..<values.count {
        diff = min(diff, values[i] - values[i - 1])
    }
    return diff
}

let root = TreeNode(4, TreeNode(2, TreeNode(1), TreeNode(3)), TreeNode(6))
getMinimumDifference(root)
