import Foundation

func trailingZeroes(_ n: Int) -> Int {
    var n = n
    var count = 0
    
    while n >= 5 {
        n /= 5
        count += n
    }
    
    return count
}

trailingZeroes(3)
trailingZeroes(5)
trailingZeroes(0)
