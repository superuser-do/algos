

func findCompatibleRestaurantsBetween(ned: [String], mary: [String]) -> [String] {
    var result = [String]()
    var nedPrefs = [String: Int]()
    var minIndexSum = Int.max

    for i in 0..<ned.count {
        nedPrefs[ned[i]] = i
    }

    for i in 0..<mary.count {
        let maryPref = mary[i]

        if nedPrefs.keys.contains(maryPref) {
            let prefSum = i + nedPrefs[maryPref]!

            if prefSum < minIndexSum {
                result = [maryPref]
                minIndexSum = prefSum
            } else if prefSum == minIndexSum {
                result.append(maryPref)
            }
        }
    }

    return result
}

findCompatibleRestaurantsBetween(
    ned: ["Shogun", "Tapioca Express", "Burger King", "KFC"],
    mary: ["Piatti", "The Grill at Torrey Pines", "Hungry Hunter Steakhouse", "Shogun"])
