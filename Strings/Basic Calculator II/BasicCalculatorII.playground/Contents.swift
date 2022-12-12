

func calculate(_ s: String) -> Int {
    guard !s.isEmpty else {
        return 0
    }

    var stack = [Int]()

    func apply(`operator`: String, operand: inout Int) {
        if `operator` == "+" {
            stack.append(operand)
        } else if `operator` == "-" {
            stack.append(-operand)
        } else if `operator` == "*" {
            stack.append(stack.removeLast() * operand)
        } else if `operator` == "/" {
            stack.append(stack.removeLast() / operand)
        }
    }

    let operators: Set = ["+", "-", "*", "/"]
    let digits = Set((0...9).map { String($0) })

    var previousOperator = "+"
    var currentDigit = 0

    for char in s {
        let char = String(char)
        if digits.contains(String(char)) {
            currentDigit = currentDigit * 10 + (Int(char) ?? 0)
        } else if operators.contains(char) {
            apply(operator: previousOperator, operand: &currentDigit)
            previousOperator = char
            currentDigit = 0
        }
    }
    apply(operator: previousOperator, operand: &currentDigit)
    return stack.reduce(0, +)
}

calculate("3+2*2")
