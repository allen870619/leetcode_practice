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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var list = [Int]()
        var search = [root]
        while !search.isEmpty {
            for _ in search {
                if let node = search.popLast()! {
                    list.append(node.val)
                    if let l = node.left {
                        search.append(l)
                    }
                    if let r = node.right {
                        search.append(r)
                    }
                }
            }
        }
        list.sort()
        return list[k - 1]
    }
}

class Solution2 { // DFS
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var list = [Int]()
        func inorder(_ node: TreeNode?) {
            guard let node else {
                return
            }
            inorder(node.left)
            list.append(node.val)
            inorder(node.right)
        }
        inorder(root)
        return list[k - 1]
    }
}

class Solution3 { // left first, pop and insert right
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack = [TreeNode]()
        var root = root; var k = k
        while true {
            while root != nil {
                stack.append(root!)
                root = root?.left
            }

            root = stack.popLast()!
            k -= 1
            if k == 0 {
                return root?.val ?? 0
            }
            root = root?.right
        }
    }
}
