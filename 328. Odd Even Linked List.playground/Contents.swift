public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var tmp: ListNode?
        var tmpHead = tmp
        var jumper = head

        while jumper != nil {
            if tmp == nil {
                tmp = jumper?.next
                tmpHead = tmp
            } else {
                tmp?.next = jumper?.next
                tmp = tmp?.next
            }

            jumper?.next = jumper?.next?.next
            if jumper?.next == nil {
                jumper?.next = tmpHead
                break
            }
            jumper = jumper?.next
        }
        return head
    }
}
