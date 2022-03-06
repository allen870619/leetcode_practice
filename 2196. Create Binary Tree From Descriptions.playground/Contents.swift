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
    func createBinaryTree(_ descriptions: [[Int]]) -> TreeNode? {
        var map = [Int: TreeNode]()
        var top : TreeNode?
        var childList = Set<Int>()
        
        for i in descriptions{
            var node = i[0]
            var leaf = i[1]
            var isLeft = i[2] == 1
            
            var root = TreeNode(node)
            if map[node] != nil{
                root = map[node]!
            }else{
                map[node] = root
            }
            
            var child = TreeNode(leaf)
            if map[leaf] != nil{
                child = map[leaf]!
            }else{
                map[leaf] = child
            }
            childList.insert(leaf)
            
            if isLeft{
                root.left = child
            }else{
                root.right = child
            }
        }
        
        for i in map{
            if !childList.contains(i.key){
                return i.value
            }
        }
        return nil
    }
}

let sol = Solution()
print(sol.createBinaryTree([[20,15,1],[20,17,0],[50,20,1],[50,80,0],[80,19,1]])?.val)
print(sol.createBinaryTree([[20,15,1],[20,17,0],[50,20,1],[80,19,1],[50,80,0]])?.val)
print(sol.createBinaryTree([[3,4,1],[1,2,1],[2,3,0]])?.val)
print(sol.createBinaryTree([[1,2,1],[2,3,0],[3,4,1]])?.val)
print(sol.createBinaryTree([[85,82,1],[74,85,1],[39,70,0],[82,38,1],[74,39,0],[39,13,1]])?.val) // 74
print(sol.createBinaryTree([[85,74,0],[38,82,0],[39,70,0],[82,85,0],[74,13,0],[13,39,0]])?.val) // 38
