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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var result = [[Int]]()
        var list = [root]
        while !list.isEmpty {
            var tmp = [Int]()
            for i in list {
                let target = list.removeFirst()
                tmp.append(target.val)
                if let left = target.left {
                    list.append(left)
                }
                if let right = target.right {
                    list.append(right)
                }
            }
            result.append(tmp)
        }
        return result
    }
}
