import AlgoHelpers

func serialize<Int>(root: TreeNode<Int>?) -> String {
    guard let root = root else {
        return "#"
    }
    return "\(root.value) \(serialize(root: root.left)) \(serialize(root: root.right))"
}

func deserialize(data: String) -> TreeNode<Int>? {
    func helper() -> TreeNode<Int>? {
        let value = values.next()
        guard let value = value,
              value != "#",
              let intValue = value.wholeNumberValue else {
            return nil
        }
        
        let node = TreeNode(intValue)
        node.left = helper()
        node.right = helper()
        
        return node
    }
    
    var values = data.makeIterator()
    return helper()
}

let tree =  TreeNode(1, TreeNode(2), TreeNode(3))
let data = serialize(root: tree)
deserialize(data: data)
