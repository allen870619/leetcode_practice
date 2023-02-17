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
    func minDiffInBST(_ root: TreeNode?) -> Int {
        var arr = [Int]()
        dfs(node: root, arr: &arr)
        var res = Int.max
        for i in 0 ..< arr.count - 1 {
            res = min(res, abs(arr[i] - arr[i + 1]))
        }
        return res
    }

    func dfs(node: TreeNode?, arr: inout [Int]) {
        guard let node else { return }
        dfs(node: node.left, arr: &arr)
        arr.append(node.val)
        dfs(node: node.right, arr: &arr)
    }
}
