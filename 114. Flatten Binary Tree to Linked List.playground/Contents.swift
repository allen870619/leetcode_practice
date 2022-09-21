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
    func flatten(_ root: TreeNode?) {
        var list = [TreeNode?]()
        func flatIt(_ node: TreeNode?) {
            guard let node = node else {
                return
            }
            list.append(node)
            flatIt(node.left)
            flatIt(node.right)
        }

        flatIt(root)
        var head = list.first!
        for i in list[1...] {
            head?.left = nil
            head?.right = i
            head = head?.right
        }
    }
}
