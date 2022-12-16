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
    func isValidBST(_ root: TreeNode?) -> Bool {
        calBST(root, top: nil, bot: nil)
    }

    private func calBST(_ node: TreeNode?, top: Int?, bot: Int?) -> Bool {
        guard let node else {
            return true
        }
        // self
        if let top {
            if top <= node.val {
                return false
            }
        }
        if let bot {
            if bot >= node.val {
                return false
            }
        }

        // leaf
        return calBST(node.left, top: node.val, bot: bot) && calBST(node.right, top: top, bot: node.val)
    }
}

let node = TreeNode(2, TreeNode(2), TreeNode(2))
let sol = Solution()
print(sol.isValidBST(node))
