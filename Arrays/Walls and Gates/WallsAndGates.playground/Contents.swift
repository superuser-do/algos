

func wallsAndGates(_ rooms: inout [[Int]]) {
    guard !rooms.isEmpty else { return }

    let rows = rooms.count
    let cols = rooms.first!.count

    var queue = [[Int]]()
    for r in 0..<rows {
        for c in 0..<cols {
            if rooms[r][c] == 0 {
                queue.append([r, c])
            }
        }
    }

    while !queue.isEmpty {
        let values = queue.removeFirst()
        let r = values.first!, c = values.last!

        [(-1, 0), (1, 0), (0, 1), (0, -1)].forEach { x, y in
            if 0 <= r + x,
               r + x < rows,
               0 <= c + y,
               c + y < cols,
               rooms[r + x][c + y] > rooms[r][c]
            {
                rooms[r + x][c + y] = rooms[r][c] + 1
                queue.append([r + x, c + y])
            }
        }
    }
}
var rooms = [[2147483647,-1,0,2147483647],[2147483647,2147483647,2147483647,-1],[2147483647,-1,2147483647,-1],[0,-1,2147483647,2147483647]]
wallsAndGates(&rooms)
