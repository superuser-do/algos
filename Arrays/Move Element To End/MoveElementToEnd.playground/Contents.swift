

func moveElementToEnd(_ array: inout [Int], _ toMove: Int) -> [Int] {
    var left = 0
    var right = array.count - 1
    while left < right {
        switch (array[left] == toMove, array[right] == toMove) {
        case (true, true):
            right -= 1
        case (true, false):
            array.swapAt(left, right)
            left += 1
            right -= 1
        case (false, true):
            left += 1
        case (false, false):
            left += 1
        }
    }

    return array
}

var array = [2, 1, 2, 2, 2, 3, 4, 2]
moveElementToEnd(&array, 2)
