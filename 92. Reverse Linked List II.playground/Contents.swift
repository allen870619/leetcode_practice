public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var ori = head
        var tHead = ListNode()
        var tmp: ListNode? = tHead
        var nodeList = [ListNode?]()
        var index = 1
        
        while ori != nil{
            if index >= left && index <= right{
                nodeList.append(ori)
            }else{
                while !nodeList.isEmpty{
                    tmp?.next = nodeList.popLast()!
                    tmp = tmp?.next
                }
                tmp?.next = ori
                tmp = tmp?.next
            }
            ori = ori?.next
            index += 1
        }
        while !nodeList.isEmpty{
            tmp?.next = nodeList.popLast()!
            tmp = tmp?.next
        }
        tmp?.next = nil
        return tHead.next
    }
}

class Solution2 {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var nodeList = [ListNode?]()
        var tmpHead = head
        while tmpHead != nil{
            nodeList.append(tmpHead)
            tmpHead = tmpHead?.next
        }
        
        var newHead = ListNode()
        var tmp: ListNode? = newHead
        var index = 0
        while index < nodeList.count{
            if index+1 == left{
                for i in stride(from: right-1, through: left-1, by: -1){
                    tmp?.next = nodeList[i]
                    tmp = tmp?.next
                }
                index = right
            }else{
                tmp?.next = nodeList[index]
                tmp = tmp?.next
                index += 1
            }
        }
        tmp?.next = nil
        return newHead.next
    }
}

let sol = Solution()
let node = ListNode(3, ListNode(5))
var a = sol.reverseBetween(node, 1, 2)
while a != nil{
    print(a?.val)
    a = a?.next
}
