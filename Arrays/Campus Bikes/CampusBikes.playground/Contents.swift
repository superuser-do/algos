import Foundation

func assignBikes(_ workers: [[Int]], _ bikes: [[Int]]) -> [Int] {
    struct Triplet {
        var distance: Int
        var workerIndex: Int
        var bikeIndex: Int
    }
    
    func manhattanDistance(_ pointA: [Int], _ pointB: [Int]) -> Int {
        return abs(pointA.first! - pointB.first!) + abs(pointA.last! - pointB.last!)
    }
    
    var matrix = [Triplet]()
    for (i, worker) in workers.enumerated() {
        for (j, bike) in bikes.enumerated() {
            let distance = manhattanDistance(worker, bike)
            matrix.append(Triplet(distance: distance, workerIndex: i, bikeIndex: j))
        }
    }
    
    matrix.sort { $0.distance < $1.distance }
    
    var result = Array(repeating: -1, count: workers.count)
    var bikesTaken = Set<Int>()
    for triplet in matrix {
        if bikesTaken.count == workers.count {
            break
        }
        if result[triplet.workerIndex] == -1,
           !bikesTaken.contains(triplet.bikeIndex) {
            result[triplet.workerIndex] = triplet.bikeIndex
            bikesTaken.insert(triplet.bikeIndex)
        }
    }
    return result
}

var workers = [[0,0],[2,1]]
var bikes = [[1,2],[3,3]]
assignBikes(workers, bikes)

workers = [[0,0],[1,1],[2,0]]
bikes = [[1,0],[2,2],[2,1]]
assignBikes(workers, bikes)
