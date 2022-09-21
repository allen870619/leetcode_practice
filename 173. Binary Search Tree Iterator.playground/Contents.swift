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

class BSTIterator {
    var node: TreeNode?

    init(_ root: TreeNode?) {
        node = root
    }

    func next() -> Int {
        var tmp = node
        if tmp?.left == nil {
            let result = tmp?.val ?? 0
            node = node?.right
            return result
        }
        var last: TreeNode?
        while tmp?.left != nil {
            last = tmp
            tmp = tmp?.left
        }
        let result = tmp?.val ?? 0
        if tmp?.right != nil {
            last?.left = tmp?.right
        } else {
            last?.left = nil
        }
        return result
    }

    func hasNext() -> Bool {
        return node != nil
    }
}
