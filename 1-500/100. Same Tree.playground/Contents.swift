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

class Solution { // DFS
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if (p != nil && q == nil) || (p == nil && q != nil) {
            return false
        }
        if let p, let q {
            return p.val == q.val && isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
        }
        return true
    }
}

class Solution2 { // BFS
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var pList = [p]
        var qList = [q]
        while !pList.isEmpty, !qList.isEmpty {
            if pList.count != qList.count {
                return false
            }
            for i in 0 ..< pList.count {
                let pf = pList.removeFirst()
                let qf = qList.removeFirst()
                if (pf != nil && qf == nil) || (pf == nil && qf != nil) || (pf?.val != qf?.val) {
                    return false
                }
                if !(pf == nil && qf == nil) {
                    pList.append(pf?.left)
                    pList.append(pf?.right)
                    qList.append(qf?.left)
                    qList.append(qf?.right)
                }
            }
        }
        return true
    }
}
