

func minRewards(_ scores: [Int]) -> Int {
    var rewards = Array(repeating: 1, count: scores.count)

    for i in 0 ..< scores.count - 1 {
        if scores[i] < scores[i + 1] {
            rewards[i + 1] = rewards[i] + 1
        }
    }

    for i in (1..<scores.count).reversed() {
        if scores[i - 1] > scores[i] {
            rewards[i - 1] = max(rewards[i] + 1, rewards[i - 1])
        }
    }

    return rewards.reduce(0, +)
}

minRewards([8, 4, 2, 1, 3, 6, 7, 9, 5])
