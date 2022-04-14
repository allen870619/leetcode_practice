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
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        var root = root
        while root != nil{
            if let v = root?.val{
                if v > val{
                    root = root?.left
                }else if v < val{
                    root = root?.right
                }else{
                    return root
                }
                
            } else{
                break
            }
        }
        return nil
    }
}
