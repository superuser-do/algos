

func longestStrChain(_ words: [String]) -> Int {
    var dp = [String: Int]()
    var words = words.sorted(by: { $0.count < $1.count })
    var longest = 1
    for word in words {
        var currentLongest = 1
        for i in 0..<word.count {
            var chars = Array(word)
            chars.remove(at: i)
            let prevLongest = dp[String(chars), default: 0]
            currentLongest = max(currentLongest, prevLongest + 1)
        }

        dp[word] = currentLongest
        longest = longest < currentLongest ? currentLongest : longest
    }

    return longest
}

longestStrChain(["a","b","ba","bca","bda","bdca"])
