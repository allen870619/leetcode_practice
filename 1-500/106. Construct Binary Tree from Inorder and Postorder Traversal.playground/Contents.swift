public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { val = 0; left = nil; right = nil }
    public init(_ val: Int) { self.val = val; left = nil; right = nil }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if inorder.isEmpty || postorder.isEmpty {
            return nil
        }

        let total = inorder.count
        let rootIndex = inorder.firstIndex(of: postorder.last!)!
        let treeNode = TreeNode(postorder.last!)
        let leftCount = rootIndex, rightCount = total - leftCount - 1
        if leftCount > 0 {
            treeNode.left = buildTree(Array(inorder[0 ..< leftCount]),
                                      Array(postorder[0 ..< leftCount]))
        }
        if rightCount > 0 {
            treeNode.right = buildTree(Array(inorder[leftCount + 1 ..< total]),
                                       Array(postorder[leftCount ..< total - 1]))
        }

        return treeNode
    }
}

let sol = Solution()
print(sol.buildTree([9, 3, 15, 20, 7], [9, 15, 7, 20, 3]))
