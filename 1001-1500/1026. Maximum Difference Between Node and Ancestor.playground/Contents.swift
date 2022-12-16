
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
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        return findMax(root, lower: root.val, upper: root.val)
    }

    func findMax(_ node: TreeNode?, lower: Int, upper: Int) -> Int {
        guard let node else { return 0 }
        let lower = min(lower, node.val)
        let upper = max(upper, node.val)
        return max(upper - lower,
                   findMax(node.left, lower: lower, upper: upper),
                   findMax(node.right, lower: lower, upper: upper))
    }
}
