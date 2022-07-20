import Foundation

func findLongestWord(_ s: String, _ dictionary: [String]) -> String {
    var output = ""
    for word in dictionary {
        if word.isSubsequence(of: s),
           word.count > output.count {
            output = word
        } else if word.count == output.count {
            output = min(output, word)
        }
    }
    
    return output
}

extension String {
    func isSubsequence(of string: String) -> Bool {
        let n = Array(self), m = Array(string)
        var i = 0, j = 0
        while i < n.count,
              j < m.count {
            if n[i] == m[j] {
                i += 1
            }
            
            j += 1
        }
        return i == n.count
    }
}

findLongestWord("abpcplea", ["ale","apple","monkey","plea"])
findLongestWord("abpcplea", ["a","b","c"])
findLongestWord("abce", ["abe","abc"])
findLongestWord("aewfafwafjlwajflwajflwafj", ["apple","ewaf","awefawfwaf","awef","awefe","ewafeffewafewf"])
