public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        var curHead: ListNode? = head
        var lastNode: ListNode? = head
        var pointer: ListNode? = head!.next
        
        while pointer != nil{
            if pointer!.val < lastNode!.val{
                lastNode!.next = pointer!.next
                pointer?.next = nil
                curHead = moveNode(curHead, pointer!)
                pointer = lastNode?.next
            }else{
                lastNode = pointer
                pointer = pointer?.next
            }
        }
        
        // for test
        while curHead != nil{
            print(curHead?.val)
            curHead = curHead?.next
        }
        
        return curHead
    }
    
    func moveNode(_ head: ListNode?, _ target: ListNode) -> ListNode?{
        if target.val < head!.val{
            target.next = head
            return target
        }
        
        var last = head
        var pointer = head!.next
        
        while pointer != nil{
            if pointer!.val > target.val{
                last?.next = target
                target.next = pointer
                return head
            }
            last = pointer
            pointer = pointer?.next
        }
        last?.next = target
        return head
    }
}

let sol = Solution()
print(sol.insertionSortList(ListNode(4)))
print(sol.insertionSortList(ListNode(4, ListNode(2, ListNode(1, ListNode(3))))))
print(sol.insertionSortList(ListNode(-1, ListNode(5, ListNode(3, ListNode(4, ListNode(0)))))))


