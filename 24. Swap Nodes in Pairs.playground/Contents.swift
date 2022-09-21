public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let newHead = head?.next

        var tmpHead = head
        var lastHead: ListNode?
        while tmpHead != nil, tmpHead?.next != nil {
            var next = tmpHead?.next
            if lastHead != nil {
                lastHead?.next = next
            }
            tmpHead?.next = next?.next
            next?.next = tmpHead
            lastHead = tmpHead
            tmpHead = tmpHead?.next
        }

        return newHead
    }
}

let node = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
let sol = Solution()
var tmp = sol.swapPairs(node)
while tmp != nil {
    print(tmp?.val)
    tmp = tmp?.next
}
