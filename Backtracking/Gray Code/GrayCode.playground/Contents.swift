import Foundation


func grayCode(_ n: Int) -> [Int] {
    var used = Set<Int>()
    used.insert(0)
    var result = [0]
    
    for _ in 0..<(1 << n) {
        for i in 0..<n {
            if !used.contains((1 << i) ^ result.last!) {
                let next = (1 << i) ^ result.last!
                used.insert(next)
                result.append(next)
                break
            }
        }
    }
    return result
//    var result = [Int]()
//    var val = 0
//
//   backtrack(n, n - 1, &val, &result)
//    return result
}

private func backtrack(_ n: Int, _ index: Int, _ val: inout Int, _ result: inout [Int]) {
    if index == -1 {
        result.append(val)
        return
    }
    
    backtrack(n, index - 1, &val, &result)
    val ^= (1 << index)
    backtrack(n, index - 1, &val, &result)
}

grayCode(2)
