

func getLevelMapping(edgeList: [(String, String)], startNode: String) -> [Int: [String]] {
    var adjacencyList: [String: [String]] {
        var adjList = [String: [String]]()
        for edge in edgeList {
            adjList[edge.0, default: [String]()].append(edge.1)
            adjList[edge.1, default: [String]()].append(edge.0)
        }
        return adjList
    }

    var queue = [(String, Int)]()
    queue.append((startNode, 0))
    var visited = Set<String>()
    visited.insert(startNode)
    var output = [Int: [String]]()
    while !queue.isEmpty {
        let (node, level) = queue.removeFirst()
        if !output.keys.contains(level) {
            output[level] = [String]()
        }
        output[level]?.append(node)
        for neighbor in adjacencyList[node]! {
            if !visited.contains(neighbor) {
                visited.insert(neighbor)
                queue.append((neighbor, level + 1))
            }
        }
    }
    return output
}

getLevelMapping(edgeList: [("A", "B"), ("A", "C"), ("A", "D"), ("D", "E"), ("C", "A")], startNode: "A")
