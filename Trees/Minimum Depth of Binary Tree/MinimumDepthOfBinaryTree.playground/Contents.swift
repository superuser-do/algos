import AlgoHelpers

func minDepth(root: TreeNode<Int>?) -> Int {
    guard let root = root else { return 0 }

    func dfs(node: TreeNode<Int>?, depth: Int) -> Int {
        guard let node = node else { return Int.max }
        if node.left == nil, node.right == nil {
            return depth
        }
        return min(dfs(node: node.left, depth: depth + 1), dfs(node: node.right, depth: depth + 1))
    }

    return dfs(node: root, depth: 1)
}

let root = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
minDepth(root: root)

func minDepth(_ root: TreeNode<Int>?) -> Int {
    guard let root = root else { return 0 }

    var queue = [TreeNode<Int>]()
    queue.append(root)
    var depth = 0
    while !queue.isEmpty {
        depth += 1
        for _ in 0..<queue.count {
            let node = queue.removeFirst()
            guard node.left != nil,
                  node.right != nil
            else {
                return depth
            }
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
    }
    return depth
}
minDepth(root)
