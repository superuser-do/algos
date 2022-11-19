

func sumNodes(vertexList: [Int], edgeList: [(Int, Int)], startNode: Int) -> Int {
    guard vertexList.contains(startNode) else { return 0 }

    var adjacencyList: [Int: [Int]] {
        var adjList = [Int: [Int]]()
        for edge in edgeList {
            adjList[edge.0, default: [Int]()].append(edge.1)
            adjList[edge.1, default: [Int]()].append(edge.0)
        }
        return adjList
    }

    guard !adjacencyList.isEmpty else { return 0 }

    var total = 0
    var queue = [startNode]
    var visited = Set<Int>()
    visited.insert(startNode)
    while !queue.isEmpty {
        let node = queue.removeFirst()
        total += node
        for neighbor in adjacencyList[node]! {
            if !visited.contains(neighbor) {
                visited.insert(neighbor)
                queue.append(neighbor)
            }
        }
    }
    return total
}
let vertexList = [1,2,3,4,5]
let edgeList = [(1,2), (2,3), (1,3)]
sumNodes(vertexList: vertexList, edgeList: edgeList, startNode: 1)
