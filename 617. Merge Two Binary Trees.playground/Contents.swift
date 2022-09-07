
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
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        if root1 == nil && root2 == nil {
            return nil
        }
        
        let dummy = TreeNode()
        
        func added(_ one: TreeNode?, _ two: TreeNode?, next: TreeNode?) {
            next?.val = (one?.val ?? 0) + (two?.val ?? 0)
            
            // left
            if one?.left != nil || two?.left != nil {
                next?.left = TreeNode()
                added(one?.left, two?.left, next: next?.left)
            }
            
            // right
            if one?.right != nil || two?.right != nil {
                next?.right = TreeNode()
                added(one?.right, two?.right, next: next?.right)
            }
        }
        
        added(root1, root2, next: dummy)
        return dummy
    }
}

class Solution2 { // better
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        if root1 == nil && root2 == nil {
            return nil
        }
        
        let node = TreeNode((root1?.val ?? 0) + (root2?.val ?? 0))
        if root1?.left != nil || root2?.left != nil {
            node.left = mergeTrees(root1?.left, root2?.left)
        }
        if root1?.right != nil || root2?.right != nil {
            node.right = mergeTrees(root1?.right, root2?.right)
        }
        return node
    }
}

