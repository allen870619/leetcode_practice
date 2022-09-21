public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        left = nil
        right = nil
    }

    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var pList = [TreeNode]()
        var qList = [TreeNode]()
        var list = [TreeNode]()

        func find(_ node: TreeNode?) {
            guard let node = node else {
                return
            }

            list.append(node)
            if node.val == p?.val {
                pList = list
            }
            if node.val == q?.val {
                qList = list
            }
            if pList.isEmpty || qList.isEmpty {
                find(node.left)
                find(node.right)
            }
            list.popLast()
        }
        find(root)

        while !pList.isEmpty, !qList.isEmpty {
            if pList.last?.val == qList.last?.val {
                return pList.last
            }

            if pList.count > qList.count {
                pList.popLast()
            } else if pList.count < qList.count {
                qList.popLast()
            } else {
                pList.popLast()
                qList.popLast()
            }
        }
        return nil
    }
}

var node = TreeNode(3, TreeNode(5, TreeNode(6), TreeNode(2, TreeNode(7), TreeNode(4))), TreeNode(1, TreeNode(0), TreeNode(8)))
var node2 = TreeNode(1, TreeNode(2), nil)

let sol = Solution()
print(sol.lowestCommonAncestor(node, TreeNode(5), TreeNode(4))?.val)
print(sol.lowestCommonAncestor(node2, TreeNode(2), TreeNode(1))?.val)
