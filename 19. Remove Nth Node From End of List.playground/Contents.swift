public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var stack = [ListNode?]()
        let dummy = ListNode(-1, head)
        var tmp: ListNode? = dummy
        while tmp != nil {
            stack.append(tmp)
            tmp = tmp?.next
        }

        var last: ListNode?
        var last2: ListNode?
        for _ in 0 ..< n {
            last2 = last
            last = stack.popLast() ?? nil
        }
        stack.last??.next = last2
        return dummy.next
    }
}
