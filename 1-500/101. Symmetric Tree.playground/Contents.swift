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

// time complexity: O(root.depth), O(n)
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root else { return true }
        var left = [root.left], right = [root.right]

        while !(left.isEmpty && right.isEmpty) {
            var tmpLeftNode = [TreeNode?](), tmpRightNode = [TreeNode?]()
            for i in left where i != nil {
                tmpLeftNode.append(i?.right)
                tmpLeftNode.append(i?.left)
            }
            for i in right where i != nil {
                tmpRightNode.append(i?.left)
                tmpRightNode.append(i?.right)
            }
            if tmpLeftNode.map(\.?.val) != tmpRightNode.map(\.?.val) {
                return false
            }
            left = tmpLeftNode
            right = tmpRightNode
        }
        return true
    }
}
