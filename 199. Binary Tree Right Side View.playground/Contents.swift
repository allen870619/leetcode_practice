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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else{
            return []
        }
        var result = [root.val]
        var list = [root]
        while !list.isEmpty{
            for i in list{
                let node = list.removeFirst()
                if let left = node.left{
                    list.append(left)
                }
                if let right = node.right{
                    list.append(right)
                }
            }
            if let lastVal = list.last?.val{
                result.append(lastVal)
            }
        }
        return result
    }
}
