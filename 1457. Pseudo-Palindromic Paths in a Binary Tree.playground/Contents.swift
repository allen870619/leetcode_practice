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
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        var result = 0
        
        func checkRoute(_ node: TreeNode?, dict: [Int: Int]) {
            guard let node = node else {
                return
            }
            var dict = dict
            dict[node.val, default: 0] += 1
            
            var hasMore = false
            if node.left != nil {
                checkRoute(node.left, dict: dict)
                hasMore = true
            }
            if node.right != nil {
                checkRoute(node.right, dict: dict)
                hasMore = true
            }
            
            if !hasMore {
                var count = 0
                for i in dict.values {
                    if i % 2 == 1 {
                        count += 1
                    }
                }
                if count <= 1 {
                    result += 1
                }
            }
        }
        checkRoute(root, dict: [:])
        
        return result
    }
    
}
