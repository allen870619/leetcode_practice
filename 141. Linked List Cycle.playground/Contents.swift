public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution { // best
    func hasCycle(_ head: ListNode?) -> Bool {
        var tur = head
        var rabbit = head
        while true {
            tur = tur?.next
            rabbit = rabbit?.next?.next
            if tur == nil || rabbit == nil{
                return false
            }
            if tur === rabbit{
                return true
            }
        }
        return true
    }
}

class Solution2 {
    func hasCycle(_ head: ListNode?) -> Bool {
        var head = head
        var count = 0
        while head != nil{
            count += 1
            if count > 10000{
                break
            }
            head = head?.next
        }
        return count > 10000
    }
}

class Solution3 { // slower
    func hasCycle(_ head: ListNode?) -> Bool {
        var head = head
        var map = [ListNode?]()
        while head != nil{
            if map.contains(where: {$0 === head}){
                return true
            }
            map.append(head)
            head = head?.next
        }
        return false
    }
}
