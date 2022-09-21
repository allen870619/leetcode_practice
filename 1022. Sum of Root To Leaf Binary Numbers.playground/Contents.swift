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
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        func addDigit(_ root: TreeNode?, _ append: String) {
            if let root = root {
                let digits = append + "\(root.val)"

                if root.left == nil, root.right == nil {
                    total += Int(digits, radix: 2) ?? 0
                } else {
                    if root.left != nil {
                        addDigit(root.left, digits)
                    }
                    if root.right != nil {
                        addDigit(root.right, digits)
                    }
                }
            }
        }

        var total = 0
        addDigit(root, "")
        return total
    }
}

let sol = Solution()
print(sol.sumRootToLeaf(TreeNode(1, TreeNode(0, TreeNode(0), TreeNode(1)), TreeNode(1, TreeNode(0), TreeNode(1)))))
