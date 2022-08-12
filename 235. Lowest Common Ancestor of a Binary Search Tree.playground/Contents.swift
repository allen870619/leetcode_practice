public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else{
            return nil
        }
        
        if root.val < p.val && root.val < q.val{
            return lowestCommonAncestor(root.right, p, q)
        }
        
        if root.val > p.val && root.val > q.val{
            return lowestCommonAncestor(root.left, p, q)
        }
        
        return root
    }
}

class Solution2 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let p = p, let q = q else{
            return nil
        }
        
        var root = root
        while root != nil{
            if let v = root?.val{
                if v < p.val && v < q.val{
                    root = root?.right
                } else if v > p.val && v > q.val{
                    root = root?.left
                } else{
                    return root
                }
            }
        }
        return nil
    }
}
