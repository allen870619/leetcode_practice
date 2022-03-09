public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil{
            return nil
        }
        var dummyHead = ListNode(-101, head)
        var origin: ListNode? = dummyHead
        var pointer: ListNode? = dummyHead.next
        var tmp = -101
        while pointer != nil{
            if tmp != pointer?.val{
                if pointer!.val != pointer!.next?.val{
                    origin?.next = pointer
                    origin = origin?.next
                }
                tmp = pointer!.val
            }
            pointer = pointer?.next
        }
        origin?.next = nil
        return dummyHead.next
    }
}

let sol = Solution()
var head: ListNode?
head = ListNode(1, ListNode(1, ListNode(1, ListNode(2, ListNode(3)))))
head = sol.deleteDuplicates(head)
while head != nil{
    print(head?.val)
    head = head?.next
}

head = ListNode(1, ListNode(2, ListNode(3, ListNode(3, ListNode(4,  ListNode(4,  ListNode(5)))))))
head = sol.deleteDuplicates(head)
while head != nil{
    print(head?.val)
    head = head?.next
}

head = ListNode(1, ListNode(1))
head = sol.deleteDuplicates(head)
while head != nil{
    print(head?.val)
    head = head?.next
}
