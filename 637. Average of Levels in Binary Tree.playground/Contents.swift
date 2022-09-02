
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        var result = [Double]()
        var list = [root]
        while !list.isEmpty {
            var tmp = 0.0
            var count = 0.0
            for i in list {
                let cur = list.removeFirst()
                if let l = cur?.left {
                    list.append(l)
                }
                if let r = cur?.right {
                    list.append(r)
                }
                tmp += Double(cur?.val ?? 0)
                count += 1
            }
            result.append(tmp/count)
        }
        return result
    }
}
