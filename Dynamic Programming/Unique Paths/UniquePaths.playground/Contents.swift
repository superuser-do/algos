

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var cache = Array(repeating: Array(repeating: 1, count: n), count: m)

    for i in 1..<m {
        for j in 1..<n {
            cache[i][j] = cache[i][j - 1] + cache[i - 1][j]
        }
    }

    return cache.last?.last ?? 0
}

uniquePaths(3, 7)
