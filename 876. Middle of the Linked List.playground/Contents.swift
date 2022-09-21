public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var center = head
        var head = head
        var centerCount = 0
        var total = 0

        while head != nil {
            total += 1
            if centerCount < total / 2 {
                centerCount = total / 2
                center = center?.next
            }
            head = head?.next
        }
        return center
    }
}
