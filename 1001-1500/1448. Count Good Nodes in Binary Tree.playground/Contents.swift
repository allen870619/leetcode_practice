public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { val = 0; left = nil; right = nil }
    public init(_ val: Int) { self.val = val; left = nil; right = nil }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func goodNodes(_ root: TreeNode?) -> Int {
        guard let root else {
            return 0
        }
        var result = 0

        func calResult(_ node: TreeNode?, _ maxValue: Int) {
            guard let node else {
                return
            }
            if node.val >= maxValue {
                result += 1
            }
            let curMax = max(maxValue, node.val)
            calResult(node.left, curMax)
            calResult(node.right, curMax)
        }
        calResult(root, root.val)
        return result
    }
}
