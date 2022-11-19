

func sumNodes(vertexList: [Int], edgeList: [(Int, Int)], startNode: Int) -> Int {
    guard vertexList.contains(startNode) else { return  0 }

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
    var visited = Set<Int>()

    func dfs(node: Int) {
        guard !visited.contains(node) else { return }
        total += node
        visited.insert(node)
        for neighbor in adjacencyList[node]! {
            dfs(node: neighbor)
        }
    }

    dfs(node: startNode)
    return total
}

let vertexList = [1,2,3,4,5]
let edgeList = [(1,2), (2,3), (1,3)]
sumNodes(vertexList: vertexList, edgeList: edgeList, startNode: 1)
