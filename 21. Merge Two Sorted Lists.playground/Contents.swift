public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var left = list1
        var right = list2
        var resultHead = ListNode()
        var tmp: ListNode? = resultHead
        while left != nil || right != nil {
            if left != nil, right != nil {
                if left!.val > right!.val {
                    tmp?.next = left
                    left = left?.next
                } else {
                    tmp?.next = right
                    right = right?.next
                }
            } else if left != nil {
                tmp?.next = left
                left = left?.next
            } else {
                tmp?.next = right
                right = right?.next
            }
            tmp = tmp?.next
        }
        return resultHead.next
    }
}
