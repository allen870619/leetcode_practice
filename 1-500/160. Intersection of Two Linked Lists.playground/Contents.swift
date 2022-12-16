
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        next = nil
    }
}

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var length = 0
        var a = headA, b = headB
        var ac = 0, bc = 0
        while a != nil {
            a = a?.next
            ac += 1
        }
        while b != nil {
            b = b?.next
            bc += 1
        }
        a = headA; b = headB
        for _ in 0 ..< abs(ac - bc) {
            if ac > bc {
                a = a?.next
            } else {
                b = b?.next
            }
        }
        while a != nil {
            if a === b {
                return a
            }
            a = a?.next
            b = b?.next
        }
        return nil
    }
}

class Solution2 {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil {
            return nil
        }

        var a = headA, b = headB
        while a !== b {
            a = a == nil ? headB : a?.next
            b = b == nil ? headA : b?.next
        }
        return a
    }
}
