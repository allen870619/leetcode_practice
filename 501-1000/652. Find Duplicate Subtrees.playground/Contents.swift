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
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        var txt = [String: Int]()
        var res = [TreeNode?]()

        func findAll(node: TreeNode?) -> String {
            guard let node else { return "" }
            var tmp = "\(node.val)"
            tmp += "L\(findAll(node: node.left))"
            tmp += "R\(findAll(node: node.right))"
            tmp += "#"
            if txt[tmp, default: 0] == 1 {
                res.append(node)
            }
            txt[tmp, default: 0] += 1
            return tmp
        }
        findAll(node: root)
        return res
    }
}
