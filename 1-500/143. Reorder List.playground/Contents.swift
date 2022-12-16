// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

class Solution {
    func reorderList(_ head: ListNode?) {
        var evenList: [ListNode?] = []
        var pHead = head
        var last: ListNode?

        // count
        var total = 0
        while pHead != nil {
            total += 1
            pHead = pHead?.next
        }
        if total <= 1 {
            return
        }

        // seperate
        var count = 0
        pHead = head
        while pHead != nil {
            if count > (total - 1) / 2 {
                evenList.append(pHead)
            }
            pHead = pHead?.next
            count += 1
        }

        // insert
        pHead = head
        while pHead != nil {
            if evenList.isEmpty {
                pHead?.next = nil
                break
            }
            let node = evenList.popLast()!
            node?.next = pHead?.next
            pHead?.next = node
            last = pHead
            pHead = pHead?.next?.next
        }

        /* for test*/
        pHead = head
        while pHead != nil {
            print(pHead?.val)
            pHead = pHead?.next
        }
    }
}

let sol = Solution()
sol.reorderList(ListNode(1, ListNode(2, ListNode(3, ListNode(4)))))
sol.reorderList(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))))
