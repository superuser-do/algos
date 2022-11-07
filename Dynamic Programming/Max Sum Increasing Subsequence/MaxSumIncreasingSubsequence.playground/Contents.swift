

func maximumSumIncreasingSubsequence(array: [Int]) -> (Int, [Int]) {
    var sequences = Array(repeating: Int.max, count: array.count)
    var sums = array
    var maxSumIndex = 0
    for i in 0..<array.count {
        let currentNum = array[i]
        for j in 0..<i {
            let otherNum = array[j]
            if otherNum < currentNum, sums[j] + currentNum >= sums[i] {
                sums[i] = sums[j] + currentNum
                sequences[i] = j
            }
        }
        if sums[i] >= sums[maxSumIndex] {
            maxSumIndex = i
        }
    }

    return (sums[maxSumIndex], buildSequence(array, sequences, &maxSumIndex))
}

func buildSequence(_ array: [Int], _ sequences: [Int], _ currIndex: inout Int) -> [Int] {
    var sequence = [Int]()
    while currIndex != 0 {
        sequence.append(array[currIndex])
        currIndex = sequences[currIndex]
    }
    return sequence.reversed()
}

maximumSumIncreasingSubsequence(array: [10, 70, 20, 30, 50, 11, 30])
