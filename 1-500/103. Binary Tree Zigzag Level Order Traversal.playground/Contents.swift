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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root else { return [] }
        var result = [[Int]]()

        var list = [root], isReverse = false
        while !list.isEmpty {
            var tmp = [Int]()
            for _ in list {
                let node = list.removeFirst()
                tmp.append(node.val)
                if let left = node.left {
                    list.append(left)
                }
                if let right = node.right {
                    list.append(right)
                }
            }
            if isReverse {
                tmp.reverse()
            }
            isReverse = !isReverse
            result.append(tmp)
        }
        return result
    }
}
