public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        next = nil
    }
}

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var tortoise = head?.next
        var hare = head?.next?.next
        while tortoise !== hare {
            tortoise = tortoise?.next
            hare = hare?.next?.next
        }
        hare = head
        while tortoise !== hare {
            tortoise = tortoise?.next
            hare = hare?.next
        }
        return tortoise
    }
}

class Solution2 {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var list: [ListNode] = []
        var head = head
        while head != nil {
            if let index = list.firstIndex(where: { $0 === head }) {
                return list[index]
            } else {
                list.append(head!)
            }
            head = head?.next
        }
        return nil
    }
}

let sol = Solution()
let a1 = ListNode(3)
let a2 = ListNode(2)
let a3 = ListNode(5)
a1.next = a2
a2.next = a3
a3.next = a2
print(sol.detectCycle(a1)?.val)
