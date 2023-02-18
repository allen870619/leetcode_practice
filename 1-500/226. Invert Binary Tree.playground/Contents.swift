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
    // DFS
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        var root = root
        dfs(node: &root)
        return root
    }

    func dfs(node: inout TreeNode?) {
        guard let node else {
            return
        }
        dfs(node: &node.left)
        dfs(node: &node.right)
        let tmp = node.left
        node.left = node.right
        node.right = tmp
    }
}

class Solution2 {
    // BFS
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        var list = [root]
        while !list.isEmpty {
            for i in list {
                let node = list.removeFirst()
                let temp = node?.left
                node?.left = node?.right
                node?.right = temp

                if let left = node?.left {
                    list.append(left)
                }
                if let right = node?.right {
                    list.append(right)
                }
            }
        }
        return root
    }
}
