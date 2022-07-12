import Foundation

func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
    
    func justify(_ line: String, _ maxWidth: Int, _ isLastLine: Bool) -> String {
        let words = line.split(separator: " ").map(String.init)
        if words.count == 1 || isLastLine {
            return line + Array(repeating: " ", count: maxWidth - line.count).joined()
        } else {
            let insertCount = words.count - 1
            let spaceCount = maxWidth - (words.map { $0.count}.reduce(0, +))
            let space = Array(repeating: " ", count: spaceCount / insertCount).joined()
            let spaceWithExtra = Array(repeating: " ", count: spaceCount / insertCount + 1).joined()
            var extra = spaceCount % insertCount
            var line = ""
            for (index, word) in words.enumerated() {
                if index > 0 {
                    line += (extra > 0 ? spaceWithExtra : space)
                    extra -= 1
                }
                line += word
            }
        }
        return line
    }
    
    var lines = [String]()
    var i = 0
    while i < words.count {
        var j = i, line = [String](), letterCount = 0
        while j < words.count && letterCount + (j - i) + words[j].count <= maxWidth {
            line.append(words[j])
            letterCount += words[j].count
            j += 1
        }
        lines.append(line.joined(separator: " "))
        i = j
    }
    
    for i in 0..<lines.count {
        lines[i] = justify(lines[i], maxWidth, i == lines.count - 1)
    }
    
    return lines
}

var words: [String]
var maxWidth: Int

words = ["This", "is", "an", "example", "of", "text", "justification."]
maxWidth = 16
fullJustify(words, maxWidth)

words = ["What","must","be","acknowledgment","shall","be"]
maxWidth = 16
fullJustify(words, maxWidth)

words = ["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"]
maxWidth = 20
fullJustify(words, maxWidth)
