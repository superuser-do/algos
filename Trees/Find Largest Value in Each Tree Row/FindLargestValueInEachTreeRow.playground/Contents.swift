import AlgoHelpers

func largestValue(root: TreeNode<Int>?) -> [Int] {
    var result = [Int]()
    guard let root = root else { return result }

    var q = [root]
    while !q.isEmpty {
        var currentMax = Int.min
        for _ in 0..<q.count {
            let current = q.removeFirst()
            currentMax = max(currentMax, current.value)
            if let left = current.left {
                q.append(left)
            }
            if let right = current.right {
                q.append(right)
            }
        }
        result.append(currentMax)
    }
    return result
}

func largestValue(_ root: TreeNode<Int>?) -> [Int] {
    var result = [Int]()
    func dfs(node: TreeNode<Int>? = root, level: Int = 0) {
        guard let node = node else { return }
        if result.count - 1 < level {
            result.append(node.value)
        } else {
            result[level] = max(node.value, result[level])
        }
        dfs(node: node.left, level: level + 1)
        dfs(node: node.right, level: level + 1)
    }

    dfs()
    return result
}
