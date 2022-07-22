public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let dummy = ListNode(-201, head)
        var tmp: ListNode? = dummy.next
        var last: ListNode? = dummy
        var tmpNode = [ListNode?]()
        while tmp != nil{
            if tmp!.val >= x{
                tmpNode.append(tmp)
                last?.next = tmp?.next
            }else{
                last = last?.next
            }
            tmp = tmp?.next
        }
        
        for i in tmpNode{
            last?.next = i
            last?.next?.next = nil
            last = last?.next
        }
        return dummy.next
    }
}
