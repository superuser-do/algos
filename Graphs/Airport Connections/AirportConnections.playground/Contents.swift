

func airportConnections(_ airports: [String], _ routes: [[String]], _ startingAirport: String) -> Int {
    let (edges, airportIndexMap) = buildAdjacencyList(airports, routes)

    let (sccEdges, sccMap) = buildSCCAdjacencyList(edges)

    let startNode = sccMap[airportIndexMap[startingAirport]!]
    let componentsCount = sccEdges.count
    let incomingEdges = reverseEdges(sccEdges)
    var routesCount = 0
    for i in 0..<componentsCount {
        if i != startNode,
            incomingEdges[i].count == 0 {
            routesCount += 1
        }
    }

    return routesCount
}

func buildAdjacencyList(_ airports: [String], _ routes: [[String]]) -> (edges: [[Int]], airportIndexMap: [String: Int]) {
    let n = airports.count
    var airportIndexMap = [String: Int]()
    for (index, airport) in airports.enumerated() {
        airportIndexMap[airport] = index
    }

    var edges = Array(repeating: [Int](), count: n)
    for route in routes {
        let start = route.first!
        let dest = route.last!
        edges[airportIndexMap[start]!].append(airportIndexMap[dest]!)
    }

    return (edges: edges, airportIndexMap: airportIndexMap)
}

func reverseEdges(_ edges: [[Int]]) -> [[Int]] {
    let n = edges.count
    var incomingEdges = Array(repeating: [Int](), count: n)
    for i in 0..<n {
        for neighbor in edges[i] {
            incomingEdges[neighbor].append(i)
        }
    }
    return incomingEdges
}

/// Compute strongly connected component (SCC) graph with Kosaraju-Sharir algorithm
/// (https://www.coursera.org/learn/algorithms-part2/lecture/fC5Yw?t=184)
func buildSCCAdjacencyList(_ edges: [[Int]]) -> (sccEdges: [[Int]], sccMap: [Int]) {

    // compute reversed post order on reversed graph
    let reversedEdges = reverseEdges(edges)
    let reversedPostOrderOnReversedGraph = computeReversedPostOrder(edges)

    // compute SCC Map by traversing according to reversedPostOrderOnReversedGraph
    let (sccMap, sccCount) = computeSCCMap(reversedPostOrderOnReversedGraph, edges)

    // build SCC adjacency list
    let n = edges.count
    var sccEdges = Array(repeating: [Int](), count: sccCount)
    for i in 0..<n {
        for neighbor in edges[i] {
            if sccMap[i] != sccMap[neighbor] {
                sccEdges[sccMap[i]].append(sccMap[neighbor])
            }
        }
    }

    return (sccEdges: sccEdges, sccMap: sccMap)
}

func computeReversedPostOrder(_ edges: [[Int]]) -> [Int] {
    let n = edges.count
    var visited = Array(repeating: false, count: n)
    var postOrder = [Int]()
    for i in 0..<n {
        if !visited[i] {
            postOrderDFS(i, edges, &visited, &postOrder)
        }
    }
    return postOrder.reversed()
}

func postOrderDFS(_ node: Int, _ edges: [[Int]], _ visited: inout [Bool], _ postOrder: inout [Int]) {
    visited[node] = true
    for neighbor in edges[node] {
        if !visited[neighbor] {
            postOrderDFS(neighbor, edges, &visited, &postOrder)
        }
    }
    postOrder.append(node)
}

func computeSCCMap(_ reversedPostOrderOnReversedGraph: [Int], _ edges: [[Int]]) -> (sccMap: [Int], sccCount: Int) {
    let n = reversedPostOrderOnReversedGraph.count
    var sccMap = Array(repeating: -1, count: n)
    var sccCount = 0
    for i in 0..<n {
        let node = reversedPostOrderOnReversedGraph[i]
        if sccMap[node] == -1 {
            sccMapDFS(node, edges, sccCount, &sccMap)
            sccCount += 1
        }
    }
    return (sccMap: sccMap, sccCount: sccCount)
}

func sccMapDFS(_ node: Int, _ edges: [[Int]], _ sccCount: Int, _ sccMap: inout [Int]) {
    sccMap[node] = sccCount
    for neighbor in edges[node] {
        if sccMap[neighbor] == -1 {
            sccMapDFS(neighbor, edges, sccCount, &sccMap)
        }
    }
}

let airports = ["BGI", "CDG", "DEL", "DOH", "DSM", "EWR", "EYW", "HND", "ICN", "JFK", "LGA", "LHR", "ORD", "SAN", "SFO", "SIN", "TLV", "BUD"]

let routes = [
    ["DSM", "ORD"],
    ["ORD", "BGI"],
    ["BGI", "LGA"],
    ["SIN", "CDG"],
    ["CDG", "SIN"],
    ["CDG", "BUD"],
    ["DEL", "DOH"],
    ["DEL", "CDG"],
    ["TLV", "DEL"],
    ["EWR", "HND"],
    ["HND", "ICN"],
    ["HND", "JFK"],
    ["ICN", "JFK"],
    ["JFK", "LGA"],
    ["EYW", "LHR"],
    ["LHR", "SFO"],
    ["SFO", "SAN"],
    ["SFO", "DSM"],
    ["SAN", "EYW"]
]

let startingAirport = "LGA"

airportConnections(airports, routes, startingAirport)


