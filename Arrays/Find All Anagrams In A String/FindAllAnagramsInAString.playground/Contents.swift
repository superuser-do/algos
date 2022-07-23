import Foundation

func findAnagrams(_ s: String, _ p: String) -> [Int] {
    guard p.count <= s.count else { return [] }
    let s = Array(s), p = Array(p)
    
    var pCount = Dictionary<Character, Int>(), sCount = Dictionary<Character, Int>()
    for i in 0..<p.count {
        pCount[p[i], default: 0] += 1
        sCount[s[i], default: 0] += 1
    }

    var result = (pCount == sCount) ? [0] : [Int]()
    
    var left = 0
    for right in p.count..<s.count {
        sCount[s[right], default: 0] += 1
        sCount[s[left]]! -= 1
        
        if sCount[s[left]] == 0 {
            sCount.removeValue(forKey: s[left])
        }
        
        left += 1
        
        if sCount == pCount {
            result.append(left)
        }
    }
    return result
}
findAnagrams("cbaebabacd", "abc")
findAnagrams("abab", "ab")
