import Foundation

func interleavingString(_ s1: String, _ s2: String, _ s3: String) -> Bool {
    guard s1.count + s2.count == s3.count else { return false }
    
    var dp = Array(repeating: Array(repeating: false, count: s2.count + 1), count: s1.count + 1)
    dp[s1.count][s2.count] = true
    let one = Array(s1), two = Array(s2), three = Array(s3)
    
    for i in stride(from: one.count, to: -1, by: -1) {
        for j in stride(from: two.count, to: -1, by: -1) {
            if i < one.count,
               one[i] == three[i + j],
               dp[i + 1][j] {
                dp[i][j] = true
            }
            
            if j < two.count,
               two[j] == three[i + j],
               dp[i][j + 1] {
                dp[i][j] = true
            }
        }
    }
    
    return dp[0][0]
}

interleavingString("algoexpert", "your-dream-job", "your-algodream-expertjob")
