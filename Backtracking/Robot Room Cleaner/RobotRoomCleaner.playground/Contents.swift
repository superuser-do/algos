

class Robot {
    // returns true if next cell is open and robot moves into the cell.
    // returns false if next cell is obstacle and robot stays on the current cell.
    func move() -> Bool {
        return true
    }

    // Robot will stay on the same cell after calling turnLeft/turnRight.
    // Each turn will be 90 degrees.
    func turnLeft() { }
    func turnRight() { }

    // Clean the current cell.
    func clean() { }
}

enum RobotDirection: CaseIterable {
     case up, right, down, left

    var vector: RobotLocation {
        switch self {
        case .up: return RobotLocation(row: -1, col: 0)
        case .right: return RobotLocation(row: 0, col: 1)
        case .down: return RobotLocation(row: 1, col: 0)
        case .left: return RobotLocation(row: 0, col: -1)
        }
    }
}

struct RobotLocation: Hashable {
    let row: Int
    let col: Int
}

extension Robot {
    func goBack() {
        turnRight()
        turnRight()
        _ = move()
        turnRight()
        turnRight()
    }

    func rotateClockwise(from direction: RobotDirection) -> RobotDirection {
        switch direction {
        case .up: return .right
        case .right: return .down
        case .down: return .left
        case .left: return .up
        }
    }
}

func cleanRoom(_ robot: Robot) {
    var cleaned = Set<RobotLocation>()
    robot.clean()

    func backtrack(_ location: RobotLocation, _ direction: RobotDirection) {
        cleaned.insert(location)
        robot.clean()

        for _ in RobotDirection.allCases {
            let newLocation = RobotLocation(row: direction.vector.row, col: direction.vector.col)

            if !cleaned.contains(newLocation) && robot.move() {
                backtrack(newLocation, robot.rotateClockwise(from: direction))
                robot.goBack()
            }
        }
        robot.turnRight()
    }
}

