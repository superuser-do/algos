

func edgesAwayFromTree(root: TreeNode?) -> Int {
    var count = 0
    var visited = Set<TreeNode>()

    func dfs(node: TreeNode?) {
        guard let node = node,
              !visited.contains(node) else {
            count += 1
            return
        }

        visited.insert(node)
        if let children = node.children {
            for child in children {
                dfs(node: child)
            }
        }
    }

    dfs(node: root)
    return count
}

struct TreeNode {
    var value: Int
    var children: [TreeNode]?
}

extension TreeNode: Hashable { }

let root = TreeNode(value: 1, children: [TreeNode(value: 2, children: [TreeNode(value: 4, children: nil)]), TreeNode(value: 3, children: [TreeNode(value: 4)])])
edgesAwayFromTree(root: root)
