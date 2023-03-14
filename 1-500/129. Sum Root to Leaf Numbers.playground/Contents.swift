
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
    func sumNumbers(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return 0
        }
        return dp(node: node, sum: "")
    }

    private func dp(node: TreeNode, sum: String) -> Int {
        let left = node.left, right = node.right
        if let left, let right {
            return dp(node: left, sum: "\(sum)\(node.val)") + dp(node: right, sum: "\(sum)\(node.val)")
        } else if let left {
            return dp(node: left, sum: "\(sum)\(node.val)")
        } else if let right {
            return dp(node: right, sum: "\(sum)\(node.val)")
        } else {
            return Int("\(sum)\(node.val)")!
        }
    }
}
