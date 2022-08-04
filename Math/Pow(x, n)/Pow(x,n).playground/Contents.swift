import Foundation

func myPow(_ x: Double, _ n: Int) -> Double {
    guard n != 0 else { return 1 }
    
    guard n > 0 else { return 1 / myPow(x, -n) }
    
    if n % 2 == 0 {
        let half = myPow(x, n/2)
        return half * half
    } else {
        return x * myPow(x, n - 1)
    }
}

myPow(2.00000, 10)
myPow(2.10000, 3)
myPow(2.00000, -2)
