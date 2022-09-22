

func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
    var stack = [Int]()
    var i = 0
    for element in pushed {
        stack.append(element)
        while !stack.isEmpty,
              stack.last == popped[i] {
            stack.removeLast()
            i += 1
        }
    }
    return stack.isEmpty
}

validateStackSequences([1,2,3,4,5], [4,5,3,2,1])
validateStackSequences([1,2,3,4,5], [4,3,5,1,2])
