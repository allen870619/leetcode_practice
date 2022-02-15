class Solution { // BFS
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil{
            return 0
        }
        var list: [TreeNode?] = [root]
        var stack = 0
        while !list.isEmpty{
            for i in 0..<list.count{
                let node = list.removeFirst()
                if node?.left != nil{
                    list.append(node?.left)
                }
                if node?.right != nil{
                    list.append(node?.right)
                }
            }
            stack += 1
            
        }
        return stack
    }
}

class Solution2 { // DFS
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil{
            return 0
        }
        var result = 0
        
        func depth(_ node: TreeNode?, stack: Int){
            result = max(result, stack)
            if let left = node?.left{
                depth(left, stack: stack + 1)
            }
            if let right = node?.right{
                depth(right, stack: stack + 1)
            }
        }
        
        depth(root, stack: 1)
        return result
    }
}


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
