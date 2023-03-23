
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

class Solution2 {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var result = 1
        var list = [(root, 0)]

        while !list.isEmpty {
            var next = [(TreeNode, Int)]()
            var leftVal: Int?

            for i in list {
                var (node, index) = i

                if leftVal == nil {
                    leftVal = index
                } else {
                    result = max(result, index &- leftVal! + 1)
                }

                if let n = node.left {
                    next.append((n, index &* 2))
                }

                if let n = node.right {
                    next.append((n, index &* 2 + 1))
                }
            }
            list = next
        }
        return result
    }
}

class Solution { // TLE
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        var list = [root]
        var result = 0
        while !list.isEmpty {
            var start = -1, end = -1
            var tmp = [TreeNode?]()
            for (index, i) in list.enumerated() {
                if i != nil {
                    if start == -1 {
                        start = index
                    }
                    end = index
                }

                tmp.append(i?.left)
                tmp.append(i?.right)
            }
            if start == -1 {
                break
            }
            list = tmp
            result = max(result, end - start + 1)
        }

        return result
    }
}
