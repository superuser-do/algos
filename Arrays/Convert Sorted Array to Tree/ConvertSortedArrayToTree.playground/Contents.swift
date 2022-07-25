import Foundation
import AlgoHelpers

func arrayToBST(_ array: [Int]) -> TreeNode<Int> {
    func helper(start: Int, count: Int)  -> TreeNode<Int>? {
        guard count != 0 else { return nil }
        
        let middle = start + (count / 2)
        let root = TreeNode(array[middle])
        root.left = helper(start: start, count: middle - start)
        root.right = helper(start: middle + 1, count: count - (middle - start + 1))
        return root
    }
    
    return helper(start: 0, count: array.count)!
}

arrayToBST([1, 2, 3, 4, 5])
