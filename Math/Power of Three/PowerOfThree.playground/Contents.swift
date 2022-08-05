import Foundation

func isPowerOfThree(_ n: Int) -> Bool {
    func helper(_ n: Int) -> Bool {
        guard n != 1 else { return true }
        
        guard n != 0, n % 3 == 0 else { return false }
        
        return helper(n / 3)
    }
    return helper(n)
}

isPowerOfThree(27)
isPowerOfThree(0)
isPowerOfThree(9)
