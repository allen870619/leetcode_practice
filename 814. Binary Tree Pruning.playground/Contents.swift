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
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        func findLast(_ lastNode: TreeNode?, _ current: TreeNode?, fromLeft: Bool) -> Bool {
            guard let current = current else {
                return true
            }
            
            if current.val == 1 {
                findLast(current, current.left, fromLeft: true)
                findLast(current, current.right, fromLeft: false)
                return false
            } else {
                var isL = true, isR = true
                if let l = current.left {
                    isL = findLast(current, l, fromLeft: true)
                }
                if let r = current.right {
                    isR = findLast(current, r, fromLeft: false)
                }
                if isL && isR {
                    if fromLeft {
                        lastNode?.left = nil
                    } else {
                        lastNode?.right = nil
                    }
                    return true
                }
                return false
            }
        }
        
        let l = findLast(nil, root, fromLeft: true)
        let r = findLast(nil, root, fromLeft: false)
        return l && r ? nil : root
    }
}
