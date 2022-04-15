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
    func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
        var root = root
        if root == nil{
            return nil
        }
        
        func isInBound(_ node: TreeNode?) -> Bool{
            if let node = node{
                return node.val >= low && node.val <= high
            }
            return false
        }
        
        // find head
        var start: TreeNode?
        while start == nil && root != nil{
            if isInBound(root){
                start = root
                break
            }else{
                if root!.val > high{
                    root = root?.left
                }else{
                    root = root?.right
                }
            }
        }
        if start == nil{
            return nil
        }
        
        // resort tree
        func setNode(_ this: TreeNode?, _ next: TreeNode?){
            guard let this = this , let next = next else { return }
            if isInBound(next){
                if next.val > this.val{
                    this.right = next
                }else{
                    this.left = next
                }
                setNode(next, next.left)
                setNode(next, next.right)
            }else{
                if next.val > high{
                    this.right = nil
                    setNode(this, next.left)
                }else{
                    this.left = nil
                    setNode(this, next.right)
                }
            }
        }
        
        setNode(start, start?.left)
        setNode(start, start?.right)
        return start
    }
}
