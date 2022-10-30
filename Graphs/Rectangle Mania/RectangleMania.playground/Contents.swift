

func rectangleMania(_ coords: [[Int]]) -> Int {
    struct Point: Hashable {
        let x: Int
        let y: Int
    }

    var points = Set<Point>()
    for coord in coords {
        points.insert(Point(x: coord[0], y: coord[1]))
    }

    var rectangleCount = 0
    for bottomLeft in points {
        for topRight in points {
            let isUpperRight = (topRight.x > bottomLeft.x && topRight.y > bottomLeft.y)
            if isUpperRight {
                let topLeft = Point(x: bottomLeft.x, y: topRight.y)
                let bottomRight = Point(x: topRight.x, y: bottomLeft.y)
                if points.contains(topLeft),
                   points.contains(bottomLeft) {
                    rectangleCount += 1
                }
            }
        }
    }

    return rectangleCount
}

let coords = [
    [0, 0],
    [0, 1],
    [1, 1],
    [1, 0],
    [2, 1],
    [2, 0],
    [3, 1],
    [3, 0]
]

rectangleMania(coords)
