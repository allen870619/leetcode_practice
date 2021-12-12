public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var startNode: ListNode?
        var nextNode: ListNode?
        var curL1 = l1
        var curL2 = l2
        var needPlus = false
        while(curL1 != nil || curL2 != nil) || needPlus{
            let total = (curL1?.val ?? 0) + (curL2?.val ?? 0) + (needPlus ? 1 : 0)
            needPlus = total >= 10
            let newNode = ListNode(total % 10)
            if startNode == nil{
                startNode = newNode
            }else{
                nextNode?.next = newNode
            }
            nextNode = newNode
            curL1 = curL1?.next
            curL2 = curL2?.next
        }
        return startNode
    }
}

let tester = Solution()
//  let l1 = ListNode(2, ListNode(4, ListNode(3)))
//  let l2 = ListNode(5, ListNode(6, ListNode(4)))
//  let l1 = ListNode(0)
//  let l2 = ListNode(0)
let l1 = ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9)))))))
let l2 = ListNode(9, ListNode(9, ListNode(9, ListNode(9))))
var ans = tester.addTwoNumbers(l1, l2)
while ans != nil{
    print(ans?.val)
    ans = ans?.next
}
