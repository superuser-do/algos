

func orangesRotting(_ grid: [[Int]]) -> Int {
    var grid = grid
    let rows = grid.count
    let cols = grid[0].count

    var queue = [[Int]]()
    var time = 0
    var fresh = 0

    for r in 0..<rows {
        for c in 0..<cols {
            if grid[r][c] == 1 {
                fresh += 1
            } else if grid[r][c] == 2 {
                queue.append([r, c])
            }
        }
    }

    while !queue.isEmpty, fresh > 0 {
        for _ in 0..<queue.count {
            let values = queue.removeFirst()
            let r = values.first!, c = values.last!
            for i in [(-1, 0), (1, 0), (0, 1), (0, -1)] {
                let row = i.0 + r, col = i.1 + c
                if row < 0 || row == grid.count ||
                    col < 0 || col == grid[0].count ||
                    grid[row][col] != 1 {
                    continue
                }
                grid[row][col] = 2
                queue.append([row, col])
                fresh -= 1
            }
        }
        time += 1
    }
    return fresh == 0 ? time : -1
}
orangesRotting([[2,1,1],[1,1,0],[0,1,1]])
