import AlgoHelpers

func findSiblingNodes<T>(_ root: TreeNode<T>) -> [TreeNode<T>] {
    var siblings = [TreeNode<T>]()
    
    func dfs(node: TreeNode<T>?) {
        guard let node = node else { return }
        if let left = node.left, let right = node.right {
            siblings.append(left)
            siblings.append(right)
        }
        dfs(node: node.left)
        dfs(node: node.right)
    }
    
    dfs(node: root)
    return siblings
}

var result = [TreeNode<Int>]()
var tree: TreeNode<Int>
tree = TreeNode(1)
tree.left = TreeNode(2)
tree.right = TreeNode(3)
tree.left!.right = TreeNode(4)
result = findSiblingNodes(tree)
result.forEach { print($0.value) }
print("-----")

tree = TreeNode(12)
tree.left = TreeNode(3)
tree.right = TreeNode(4)
tree.left!.left = TreeNode(1)
tree.left!.left!.left = TreeNode(6)
result = findSiblingNodes(tree)
result.forEach { print($0.value) }
print("-----")

tree = TreeNode(12)
tree.left = TreeNode(3)
tree.right = TreeNode(4)
tree.left!.left = TreeNode(1)
tree.left!.left!.left = TreeNode(6)
tree.left!.left!.left!.left = TreeNode(9)
tree.left!.left!.left!.right = TreeNode(7)
result = findSiblingNodes(tree)
result.forEach { print($0.value) }
print("-----")
