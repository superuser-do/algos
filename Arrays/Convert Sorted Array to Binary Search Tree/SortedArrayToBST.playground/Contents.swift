import AlgoHelpers

func sortedArrayToBST(_ nums: [Int]) -> TreeNode<Int>? {
    guard !nums.isEmpty else { return nil }
    
    let mid = nums.count / 2
    let node = TreeNode(nums[mid])
    
    node.left = sortedArrayToBST(Array(nums[0..<mid]))
    node.right = sortedArrayToBST(Array(nums[mid+1..<nums.count]))
    
    return node
}

sortedArrayToBST([-10,-3,0,5,9])
sortedArrayToBST([1,3])
