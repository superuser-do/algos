

func isFOF(_ vertexList: [String], _ edgeList: [(String, String)], _ user1: String, _ user2: String) -> Bool {
    guard vertexList.contains(user1),
          vertexList.contains(user2) else {
        return false
    }

    func buildAdjList() -> [String: [String]] {
        var adjList = [String: [String]]()
        for v in vertexList {
            adjList[v] = []
        }

        for edge in edgeList {
            adjList[edge.0]!.append(edge.1)
            adjList[edge.1]!.append(edge.0)
        }
        return adjList
    }

    let friendAdjList = buildAdjList()
    var queue = [(user: user1, dist: 0)]
    var seenFriends = Set<String>()
    seenFriends.insert(user1)
    while !queue.isEmpty {
        let (curr, dist) = queue.removeFirst()

        // early exit
        guard dist < 2 else { return false }
        // happy case: user2 is found
        guard curr != user2 else { return dist == 2 }

        for friend in friendAdjList[curr]! {
            if !seenFriends.contains(friend) {
                seenFriends.insert(friend)
                queue.append((friend, dist + 1))
            }
        }
    }
    return false
}

let users = ["Jeff", "Susan", "Ed", "Fred", "Jason", "Zach"]
let friends = [("Jeff", "Susan"), ("Jeff", "Fred"), ("Susan", "Ed"), ("Ed", "Fred"), ("Jason", "Zach")]
isFOF(users, friends, "Foo", "Bar")
