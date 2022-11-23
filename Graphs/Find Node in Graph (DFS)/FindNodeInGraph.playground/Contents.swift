

final class Node<Value> {
    var value: Value
    private(set) var children: [Node]

    init( _ value: Value) {
        self.value = value
        children = []
    }

    init(_ value: Value, children: [Node]) {
        self.value = value
        self.children = children
    }

    init(_ value: Value, @NodeBuilder builder: () -> [Node]) {
        self.value = value
        self.children = builder()
    }

    func add(child: Node) {
        children.append(child)
    }
}

extension Node: Equatable where Value: Equatable {
    static func == (lhs: Node<Value>, rhs: Node<Value>) -> Bool {
        lhs.value == rhs.value && lhs.children == rhs.children
    }
}

extension Node: Hashable where Value: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.combine(children)
    }

    func hasPath(to target: Value) -> Bool {
        var visited = Set<Node>()

        func dfs(_ node: Node) -> Bool {
            if node.value == target {
                return true
            }

            visited.insert(node)
            for child in node.children {
                if !visited.contains(child),
                   dfs(child) {
                    return true
                }
            }

            return false
        }

        return dfs(self)
    }
}

@resultBuilder
struct NodeBuilder {
    static func buildBlock<Value>(_ children: Node<Value>...) -> [Node<Value>] {
        children
    }
}

func hasDFSPath<Value: Hashable>(_ node: Node<Value>?, _ target: Value) -> Bool {
    guard let node = node else { return false }

    var visited = Set<Node<Value>>()

    func dfs(_ node: Node<Value>?) -> Bool {
        guard let node = node else { return false }

        if node.value == target {
            return true
        }

        visited.insert(node)
        for child in node.children {
            if !visited.contains(child),
               dfs(child) {
                return true
            }
        }

        return false
    }

    return dfs(node)
}

func hasBFSPath<Value: Hashable>(_ node: Node<Value>?, _ target: Value) -> Bool {
    guard let node = node else { return false }

    var visited = Set<Node<Value>>()
    var queue = [node]
    while !queue.isEmpty {
        let curr = queue.removeLast()

        if curr.value == target {
            return true
        }

        visited.insert(node)
        for child in node.children {
            if !visited.contains(child) {
                queue.append(child)
            }
        }
    }
    return false
}

let tree = Node(1) {
    Node(2)
    Node(3)
}

tree.hasPath(to: 3)
hasDFSPath(tree, 3)
hasBFSPath(tree, 3)
