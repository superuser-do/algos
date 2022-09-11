

func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
    var prefix: [Int: Int] = [0: 1]
    var count = 0
    var output = 0

    for num in nums {
        count += num & 1
        prefix[count] = (prefix[count] ?? 0) + 1
        if let val = prefix[count-k] {
            output += val
        }
    }

    return output
}

numberOfSubarrays([1,1,2,1,1], 3)
numberOfSubarrays([2,4,6], 1)
numberOfSubarrays([2,2,2,1,2,2,1,2,2,2], 2)
