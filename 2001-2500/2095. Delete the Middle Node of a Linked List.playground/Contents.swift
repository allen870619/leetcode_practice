public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

class Solution {
    func deleteMiddle(_ head: ListNode?) -> ListNode? {
        var rabbit = head
        var turtle = head
        var prevTurtle: ListNode?

        while rabbit?.next != nil {
            rabbit = rabbit?.next?.next
            prevTurtle = turtle
            turtle = turtle?.next
        }
        prevTurtle?.next = turtle?.next
        return prevTurtle == nil ? nil : head
    }
}
