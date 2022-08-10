public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        let count = nums.count
        if count == 1{
            return TreeNode(nums[0])
        }else if count == 2{
            return TreeNode(nums[1], TreeNode(nums[0]), nil)
        }
        
        let leftNode = sortedArrayToBST([Int](nums[0..<count/2]))
        let rightNode = sortedArrayToBST([Int](nums[(count/2)+1..<count]))
        return TreeNode(nums[count/2], leftNode, rightNode)
    }
}

let sol = Solution()
print(sol.sortedArrayToBST([1,3]))
