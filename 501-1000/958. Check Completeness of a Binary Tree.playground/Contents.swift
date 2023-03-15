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
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        var list = [root], hasEnded = false

        while !list.isEmpty {
            var tmp = [TreeNode?](), hasNum = false
            for i in list {
                if i == nil {
                    hasEnded = true
                    continue
                } else if hasEnded {
                    return false
                }

                if i?.left != nil || i?.right != nil {
                    hasNum = true
                }
                tmp.append(i?.left)
                tmp.append(i?.right)
            }
            list = hasNum ? tmp : []
        }
        return true
    }
}
