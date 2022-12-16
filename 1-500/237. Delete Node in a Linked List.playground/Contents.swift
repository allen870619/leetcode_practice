public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        next = nil
    }
}

class Solution {
    func deleteNode(_ node: ListNode?) {
        var tmp = node
        while tmp != nil {
            if let next = tmp?.next {
                tmp?.val = next.val
                tmp?.next = next.next
                tmp = next
            } else {
                tmp?.next = nil
            }
            break
        }
    }
}

class Solution2 {
    func deleteNode(_ node: ListNode?) {
        var tmp = node
        if let next = tmp?.next {
            tmp?.val = next.val
            if next.next != nil {
                tmp?.next = next
                deleteNode(next)
            } else {
                tmp?.next = nil
            }
        } else {
            tmp?.next = nil
        }
    }
}
