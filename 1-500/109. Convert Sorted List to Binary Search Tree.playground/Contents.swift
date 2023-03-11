public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

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

// time complexity: O(nlogn)
// space complexity: O(1)
class Solution2 {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        if head == nil {
            return nil
        } else if head?.next == nil {
            return TreeNode(head!.val)
        }
        var slow = head
        var fast = head?.next?.next

        while fast != nil, fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        let node = TreeNode(slow!.next!.val)
        node.right = sortedListToBST(slow?.next?.next)
        slow?.next = nil
        node.left = sortedListToBST(head)
        return node
    }
}

// time complexity: O(n) + O(nlogn)
// space complexity: O(n)
class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        // create arr
        var arr = [Int]()
        var head = head
        while head != nil {
            arr.append(head!.val)
            head = head?.next
        }

        // divide and conquer
        func createTree(array: [Int]) -> TreeNode? {
            let total = array.count

            if total == 0 {
                return nil
            } else if total == 1 {
                return TreeNode(array[0])
            } else if total == 2 {
                return TreeNode(array[1], TreeNode(array[0]), nil)
            }

            let center = total / 2
            let node = TreeNode(array[center])
            node.left = createTree(array: Array(array[0 ..< center]))
            node.right = createTree(array: Array(array[center + 1 ..< total]))
            return node
        }

        return createTree(array: arr)
    }
}
