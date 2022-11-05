

func knuthMorrisPrattAlgorithm(_ string: String, _ subString: String) -> Bool {
    var pattern: [Int] {
        let charArray = Array(subString)
        var pattern = Array(repeating: -1, count: subString.count)
        var j = 0
        var i = 1
        while i < subString.count {
            if charArray[i] == charArray[j] {
                pattern[i] = j
                i += 1
                j += 1
            } else if j > 0 {
                j = pattern[j - 1] + 1
            } else {
                i += 1
            }
        }
        return pattern
    }

    func isMatch(pattern: [Int]) -> Bool {
        let stringCharArray = Array(string)
        let substringCharArray = Array(subString)
        var i = 0
        var j = 0
        while i + substringCharArray.count - j <= stringCharArray.count {
            if stringCharArray[i] == substringCharArray[j] {
                if j == substringCharArray.count - 1 {
                    return true
                }
                i += 1
                j += 1
            } else if j > 0 {
                j = pattern[j - 1] + 1
            } else {
                i += 1
            }
        }
        return false
    }

    return isMatch(pattern: pattern)
}


knuthMorrisPrattAlgorithm("aefoaefcdaefcdaed", "aefcdaed")
