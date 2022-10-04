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
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        var result = [Int]()

        func throughRoute(_ node: TreeNode, sum: Int) {
            let sum = sum + node.val
            if let left = node.left {
                throughRoute(left, sum: sum)
            }
            if let right = node.right {
                throughRoute(right, sum: sum)
            }
            if node.left == nil, node.right == nil {
                result.append(sum)
            }
        }
        throughRoute(root, sum: 0)
        return result.contains(targetSum)
    }
}

class Solution2 {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        var left = false, right = false
        let remain = targetSum - root.val
        if let l = root.left {
            left = hasPathSum(l, remain)
        }
        if let r = root.right {
            right = hasPathSum(r, remain)
        }

        if root.left == nil && root.right == nil {
            return remain == 0
        }
        return left || right
    }
}
