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
    func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
        guard let root = root else {
            return TreeNode(val)
        }
        if depth == 1 {
            let newNode = TreeNode(val)
            newNode.left = root
            return newNode
        }

        var current = 1
        var nodeList = [root]
        while current < depth - 1 {
            for _ in nodeList {
                let node = nodeList.removeFirst()
                if let left = node.left {
                    nodeList.append(left)
                }
                if let right = node.right {
                    nodeList.append(right)
                }
            }
            current += 1
        }

        for i in nodeList {
            let left = i.left
            i.left = TreeNode(val)
            i.left?.left = left
            let right = i.right
            i.right = TreeNode(val)
            i.right?.right = right
        }

        return root
    }
}
