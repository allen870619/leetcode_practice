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
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        var result: [Int] = []
        func appendTree(node: TreeNode){
            var tmp: [TreeNode] = []
            tmp.append(node)
            while tmp.count != 0{
                for i in tmp{
                    let node = tmp.removeFirst()
                    result.append(node.val)
                    if let left = node.left{
                        tmp.append(left)
                    }
                    if let right = node.right{
                        tmp.append(right)
                    }
                }
            }
        }
        
        if let start = root1{
            appendTree(node: start)
        }
        if let start = root2{
            appendTree(node: start)
        }
        return result.sorted()
    }
}
