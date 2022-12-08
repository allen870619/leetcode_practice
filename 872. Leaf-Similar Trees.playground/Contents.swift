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
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        var leftList = [Int](), rightList = [Int]()
        findLeaf(node: root1, from: &leftList)
        findLeaf(node: root2, from: &rightList)
        return leftList == rightList
    }

    private func findLeaf(node: TreeNode?, from: inout [Int]) {
        guard let node else { return }
        if node.left == nil, node.right == nil {
            from.append(node.val)
        } else {
            findLeaf(node: node.left, from: &from)
            findLeaf(node: node.right, from: &from)
        }
    }
}
