

func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
    guard !dislikes.isEmpty else { return true }
    
    var adjList: [Int: [Int]] {
        var graph = [Int: [Int]]()
        for index in 1...n {
            graph[index] = []
        }
        for edge in dislikes {
            graph[edge.first!, default: []].append(edge.last!)
            graph[edge.last!, default: []].append(edge.first!)
        }
        return graph
    }
    var colors = Array(repeating: -1, count: n + 1)

    func bfs(_ source: Int) -> Bool {
        var queue = [source]
        colors[source] = 0 // Start with marking source as RED
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            let currColor = colors[curr]
            for neighbor in adjList[curr]! {
                // If there is a conflict, return false
                guard colors[neighbor] != currColor else { return false }
                if colors[neighbor] == -1 {
                    colors[neighbor] = currColor^1
                    queue.append(neighbor)
                }
            }
        }
        return true
    }

    for i in 1...n {
        if colors[i] == -1 {
            if !bfs(i) {
                return false
            }
        }
    }
    return true
}
possibleBipartition(4, [[1,2],[1,3],[2,4]])
