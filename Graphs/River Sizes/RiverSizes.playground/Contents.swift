

func riverSizes(_ matrix: [[Int]]) -> [Int] {
    struct Location: Hashable {
        let row: Int
        let col: Int
    }
    let rows = matrix.count
    let cols = matrix[0].count
    var visited = Set<(Location)>()
    var result = [Int]()

    func dfs(_ row: Int, _ col: Int) -> Int {
        if !(0..<matrix.count ~= row)
            || !(0..<matrix[0].count ~= col)
            || matrix[row][col] == 0
            || visited.contains(Location(row: row, col: col)) {
            return 0
        }

        visited.insert(Location(row: row, col: col))
        var size = 0

        let directions = [(0,1), (1,0), (0,-1), (-1,0)]
        directions.forEach { dx, dy in
            size += dfs(dx + row, dy + col)
        }

        return size + 1
    }

    for row in 0..<rows {
        for col in 0..<cols {
            if !visited.contains(Location(row: row, col: col)),
               matrix[row][col] == 1 {
                let size = dfs(row, col)
                result.append(size)
            }
        }
    }

    return result
}

let matrix = [
    [1,0,0,1,0],
    [1,0,1,0,0],
    [0,0,1,0,1],
    [1,0,1,0,1],
    [1,0,1,1,0]
]
riverSizes(matrix)
