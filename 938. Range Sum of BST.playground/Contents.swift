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

// Second: 20221207
class Solution2 { // DFS
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root else { return 0 }
        let center = (low ... high).contains(root.val) ? root.val : 0
        return rangeSumBST(root.left, low, high) + center + rangeSumBST(root.right, low, high)
    }
}

class Solution3 { // BFS
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var list = [root]
        var result = 0
        while !list.isEmpty {
            for _ in list {
                let node = list.removeFirst()
                if let node {
                    if (low ... high).contains(node.val) {
                        result += node.val
                    }
                    list.append(node.right)
                    list.append(node.left)
                }
            }
        }
        return result
    }
}

// First: Unknown
class Solution {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root else {
            return 0
        }
        let range = low ... high
        if root.left?.val ?? low - 1 < low {
            root.left?.left = nil
        }
        if root.left?.val ?? high + 1 > high {
            root.left?.right = nil
        }
        if root.right?.val ?? low - 1 < low {
            root.right?.left = nil
        }
        if root.right?.val ?? high + 1 > high {
            root.right?.right = nil
        }
        let me = range.contains(root.val) ? root.val : 0
        return rangeSumBST(root.left, low, high) + me + rangeSumBST(root.right, low, high)
    }
}
