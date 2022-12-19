import Foundation

func checkPerfectNumber(_ num: Int) -> Bool {
    guard num > 4 else { return false }

    let root = Int(sqrt(Double(num)))
    let sum: Int = Array(2...root)
        .filter { num.isMultiple(of: $0) }
        .reduce(into: 1) { runningSum, value in
            runningSum += value
            let factor = num / value
            if factor != value {
                runningSum += factor
            }
        }
    return sum == num
}

checkPerfectNumber(28)
