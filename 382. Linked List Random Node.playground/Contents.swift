public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    var head: ListNode?
    init(_ head: ListNode?) {
        self.head = head
    }
    
    func getRandom() -> Int {
        var pointer = head
        var total = 0
        while pointer != nil{
            total += 1
            pointer = pointer?.next
        }
        
        let rand = Int.random(in: 0..<total)
        pointer = head
        var count = 0
        while pointer != nil{
            if count == rand{
                return pointer!.val
            }
            count += 1
            pointer = pointer?.next
        }
        return -1
    }
}

class Solution2 {
    var head: ListNode?
    init(_ head: ListNode?) {
        self.head = head
    }
    
    func getRandom() -> Int {
        var pointer = head
        var nodeList: [ListNode?] = []
        while pointer != nil{
            nodeList.append(pointer)
            pointer = pointer?.next
        }
        
        let rand = Int.random(in: 0..<nodeList.count)
        return nodeList[rand].val ?? -1
    }
}

let sol = Solution(ListNode(3, ListNode(2, ListNode(5))))
print(sol.getRandom())
print(sol.getRandom())
print(sol.getRandom())
print(sol.getRandom())
print(sol.getRandom())
print(sol.getRandom())
