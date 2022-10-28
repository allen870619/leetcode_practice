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
    func tree2str(_ root: TreeNode?) -> String {
        guard let root else {
            return ""
        }

        var left = tree2str(root.left)
        var right = tree2str(root.right)
        if left != "" {
            left = "(\(left))"
        } else if right != "" {
            left = "()"
        }
        if right != "" {
            right = "(\(right))"
        }

        return "\(root.val)\(left)\(right)"
    }
}
