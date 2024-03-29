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
    var sum = 0
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        inorder(root)
        return root
    }

    private func inorder(_ node: TreeNode?) {
        guard let node else { return }
        inorder(node.right)
        node.val += sum
        sum = node.val
        inorder(node.right)
    }
}
