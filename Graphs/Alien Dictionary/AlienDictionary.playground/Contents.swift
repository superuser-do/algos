

func alienOrder(_ words: [String]) -> String {
    var adj = [Character: Set<Character>]()
    for i in 0 ..< words.count - 1 {
        let word1 = words[i]
        let word2 = words[i + 1]

        if word1.count > word2.count,
           word1.prefix(word2.count) == word2 {
            return ""
        }

        let size = min(word1.count, word2.count)

        for j in 0..<size {
            let idx = word1.index(word1.startIndex, offsetBy: j)
            if word1[idx] != word2[idx] {
                adj[word1[idx], default: Set<Character>()].insert(word2[idx])
                break
            }
        }
    }

    var visit = [Character: Bool]()
    var result = [Character]()
    func dfs(_ char: Character) -> Bool {
        if let hasVisited = visit[char] {
            return hasVisited
        }

        for neighbor in adj[char] ?? Set() {
            if dfs(neighbor) {
                return true
            }
        }
        visit[char] = false
        result.append(char)
        return false
    }

    for word in words {
        for char in word {
            if dfs(char) {
                return ""
            }
        }
    }

    return String(String(result).reversed())
}

let words = ["wrt","wrf","er","ett","rftt"]
alienOrder(words)
