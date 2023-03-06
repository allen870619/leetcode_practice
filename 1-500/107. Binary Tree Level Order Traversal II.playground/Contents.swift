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
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root else {
            return []
        }
        var list = [root]
        var result = [[Int]]()
        while !list.isEmpty {
            var tmp = [Int]()
            for i in list {
                let node = list.removeFirst()
                tmp.append(node.val)
                if let node = node.left {
                    list.append(node)
                }
                if let node = node.right {
                    list.append(node)
                }
            }
            result.append(tmp)
        }

        return result.reversed()
    }
}
