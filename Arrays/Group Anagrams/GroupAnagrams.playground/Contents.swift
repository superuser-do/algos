import Foundation

func groupAnagrams(_ words: [String]) -> [[String]] {
    guard !words.isEmpty else { return [] }
    
    var dict = [String: [String]]()
    for word in words {
        let sorted = String(word.sorted())
        dict[sorted, default: []].append(word)
    }
    
    return Array(dict.values)
}

groupAnagrams(["yo", "act", "flop", "tac", "foo", "cat", "oy", "olfp"])
