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
    func averageOfSubtree(_ root: TreeNode?) -> Int {
        guard let root else {
            return 0
        }

        func calTotal(root: TreeNode) -> (count: Int, sum: Int) {
            if root.left == nil, root.right == nil {
                total += 1
                return (1, root.val)
            }

            var l = (count: 0, sum: 0); var r = (count: 0, sum: 0)
            if let left = root.left {
                l = calTotal(root: left)
            }
            if let right = root.right {
                r = calTotal(root: right)
            }
            let t = (count: l.count + r.count + 1, sum: l.sum + r.sum + root.val)
            if t.sum / t.count == root.val {
                total += 1
            }
            return t
        }

        var total = 0
        calTotal(root: root)
        return total
    }
}

let sol = Solution()
let tree = TreeNode(4, TreeNode(8, TreeNode(0), TreeNode(1)), TreeNode(5, nil, TreeNode(6)))

print(sol.averageOfSubtree(tree))
print(sol.averageOfSubtree(TreeNode(1)))
print(sol.averageOfSubtree(TreeNode(0, TreeNode(0), TreeNode(0))))
