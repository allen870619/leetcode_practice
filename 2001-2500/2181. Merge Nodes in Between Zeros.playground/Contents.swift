public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

class Solution {
    func mergeNodes(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }

        var result: ListNode?
        var resultHead = result

        var tmp = 0
        var cur = head?.next
        while cur != nil {
            if cur?.val != 0 {
                tmp += cur!.val
            } else {
                if result == nil {
                    result = ListNode(tmp)
                    resultHead = result
                } else {
                    let node = ListNode(tmp)
                    resultHead?.next = node
                    resultHead = resultHead?.next
                }
                tmp = 0
            }
            cur = cur?.next
        }
        return result
    }
}

let sol = Solution()
var node = sol.mergeNodes(ListNode(0, ListNode(1, ListNode(0, ListNode(3, ListNode(0, ListNode(2, ListNode(2, ListNode(0)))))))))

while node != nil {
    print(node?.val)
    node = node?.next
}

node = sol.mergeNodes(ListNode(0, ListNode(3, ListNode(1, ListNode(0, ListNode(4, ListNode(5, ListNode(2, ListNode(0)))))))))

while node != nil {
    print(node?.val)
    node = node?.next
}
