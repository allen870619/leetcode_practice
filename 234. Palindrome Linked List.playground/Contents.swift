public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var node = head
        var list = [ListNode]()
        while head != nil {
            if let node {
                list.append(node)
            }
            node = node?.next
        }

        var left = 0, right = list.count - 1
        while left <= right {
            if list[left].val != list[right].val {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
}
