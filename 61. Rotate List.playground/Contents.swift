class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil{
            return nil
        }
        var start = head
        var last = head
        var total = 0
        while start != nil{
            total += 1
            last = start
            start = start?.next
        }
        let k = k % total
        if total == 1 || k == 0{
            return head
        }
        
        var pointer: ListNode? = head
        for _ in 0..<total - k - 1{
            pointer = pointer?.next
        }
        let newHead = pointer?.next
        pointer?.next = nil
        last?.next = head
        return newHead
    }
}
