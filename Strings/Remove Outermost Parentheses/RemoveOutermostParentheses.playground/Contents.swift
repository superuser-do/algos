

func removeOuterParentheses(_ s: String) -> String {
    var stack = [Character]()
    var primitiveElements = [String]()
    var found = ""

    for char in s {
        found += String(char)
        if char == "("{
            stack.append(char)
        }else{
            stack.popLast()
            if stack.isEmpty{
                primitiveElements.append(found)
                found = ""
            }
        }
    }

    var result = ""
    for var element in primitiveElements {
        element.removeLast()
        element.removeFirst()
        result += element
    }
    return result
}

removeOuterParentheses("(()())(())")
removeOuterParentheses("(()())(())(()(()))")
removeOuterParentheses("()()")
