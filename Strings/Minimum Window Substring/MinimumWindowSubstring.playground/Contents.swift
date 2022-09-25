

struct Window {
    var left: Int?
    var right: Int?
    var length: Int? {
        guard let left = left, let right = right else { return nil }
        return right - left + 1
    }
}

func minWindow(_ s: String, _ t: String) -> String {
    guard !s.isEmpty, !t.isEmpty else { return "" }

    var dic = [Character: Int]()
    t.forEach { char in
        dic[char] = (dic[char] ?? 0) + 1
    }
    let required = dic.count
    var left = 0
    var right = 0
    var formed = 0
    var window = [Character: Int]()
    var result = Window()

    while right < s.count {
        let rightIndex  = s.index(s.startIndex, offsetBy: right)
        var char = s[rightIndex]
        window[char] = (window[char] ?? 0) + 1

        if let val = dic[char], window[char].map({ $0 == val }) ?? false {
            formed += 1
        }

        while left <= right, formed == required {
            let leftIndex = s.index(s.startIndex, offsetBy: left)
            char = s[leftIndex]

            if result.length == nil || result.length.map({ $0 > right - left + 1 }) ?? false {
                result.left = left
                result.right = right
            }

            window[char] = (window[char] ?? 0) - 1
            if let val = dic[char], window[char].map({ $0 < val }) ?? false {
                formed -= 1
            }

            left += 1
        }

        right += 1
    }

    if let leftOffset = result.left,
       let rightOffset = result.right {
        let left = s.index(s.startIndex, offsetBy: leftOffset)
        let right = s.index(s.startIndex, offsetBy: rightOffset)
        return String(s[left...right])
    }

    return ""
}
minWindow("ADOBECODEBANC", "ABC")
