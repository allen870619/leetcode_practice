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

class Solution { // not good but AC
    func recoverTree(_ root: TreeNode?) {
        var stack = [TreeNode?]()
        var `switch` = false

        func inorder(_ node: TreeNode?) {
            guard let node else { return }
            inorder(node.left)
            if let last = stack.last {
                if let lastNode = last {
                    if lastNode.val > node.val {
                        `switch` = true
                        let n = stack.popLast()!
                        let tmp = n!.val
                        n?.val = node.val
                        node.val = tmp
                        stack.append(n)
                    }
                }
            }
            stack.append(node)
            inorder(node.right)
        }

        while true {
            inorder(root)
            if `switch` {
                `switch` = false
                stack.removeAll()
            } else {
                break
            }
        }
    }
}
