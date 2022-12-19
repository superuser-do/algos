

func earliestFellows(_ fellowTimes: [String: Int]) -> [String] {
    var earliestTime = Int.max
    var currentEarliestFellows = [String]()

    for (name, time) in fellowTimes {
        if time < earliestTime {
            earliestTime = time
            currentEarliestFellows = [name]
        } else if time == earliestTime {
            currentEarliestFellows.append(name)
        }
    }

    return currentEarliestFellows
}

earliestFellows(["oliver": 3, "tobey": 3])
earliestFellows(["oliver": 3, "pinky": 4, "pixel": 2, "tobey": 1])
