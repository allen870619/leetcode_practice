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
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root else {
            return 0
        }
        var list = [root], result = 1
        while !list.isEmpty {
            for i in list {
                let node = list.removeFirst()
                if let left = node.left {
                    list.append(left)
                }
                if let right = node.right {
                    list.append(right)
                }
            }
            result += list.count
        }
        return result
    }
}
