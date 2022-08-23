

class TrieNode {
    var word: String?
    var children = [Character: TrieNode]()
}

func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
    if board.isEmpty { return [] }

    var result = [String]()
    var board = board
    let root = buildTrie(with: words)

    for i in 0..<board.count {
        for j in 0..<board[0].count {
            dfs(&board, i, j, root, &result)
        }
    }

    return result
}

func buildTrie(with words: [String]) -> TrieNode {
    let root = TrieNode()

    for word in words {
        var node = root
        for char in word {
            if node.children[char] == nil{
                node.children[char] = TrieNode()
            }
            node = node.children[char]!
        }
        node.word = word
    }

    return root
}

func dfs(_ board: inout [[Character]], _ i: Int, _ j: Int, _ node: TrieNode, _ result: inout [String]) {
    if i < 0 || j < 0 || i >= board.count || j >= board[0].count { return }
    guard let currNode = node.children[board[i][j]] else { return }

    if let word = currNode.word {
        result.append(word)
        currNode.word = nil
    }
    let char = board[i][j]
    board[i][j] = "0"

    dfs(&board, i - 1, j, currNode, &result)
    dfs(&board, i + 1, j, currNode, &result)
    dfs(&board, i, j - 1, currNode, &result)
    dfs(&board, i, j + 1, currNode, &result)
    board[i][j] = char
}
