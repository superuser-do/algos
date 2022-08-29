

func numSmallerByFrequency(_ queries: [String], _ words: [String]) -> [Int] {
    func f(_ s: String) -> Int {
        var counts: [Int] = Array(repeating: 0, count: 26)
        for char in s {
            let index = Int(char.asciiValue! - Character("a").asciiValue!)
            counts[index] += 1
        }

        return counts.first { $0 > 0 } ?? 0
    }
    
    func binarySearch(_ f: Int, _ sortedWordsFrequency: [Int]) -> Int {
        var left = 0
        var right = sortedWordsFrequency.count-1
        
        while left <= right {
            let mid = (right + left) / 2
            if sortedWordsFrequency[mid] > f {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return sortedWordsFrequency.count - left
    }
    
    let queriesCount = queries.map { f($0) }
    let sortedWordsCount = words.map { f($0) }.sorted()
    
    return queriesCount.map {
        binarySearch($0, sortedWordsCount)
    }
}

numSmallerByFrequency(["cbd"], ["zaaaz"])
numSmallerByFrequency(["bbb","cc"], ["a","aa","aaa","aaaa"])
