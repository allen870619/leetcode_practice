public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

/// Second: 2022/12/05
class Solution2 {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var rabbit = head, tortoise = head
        while rabbit?.next != nil {
            rabbit = rabbit?.next?.next
            tortoise = tortoise?.next
        }
        return tortoise
    }
}

/// First: 2021/12/28
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
