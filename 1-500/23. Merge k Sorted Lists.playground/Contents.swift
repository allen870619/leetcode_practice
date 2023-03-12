public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var list = [ListNode]()

        for i in lists {
            var tmp: ListNode? = i
            while tmp != nil {
                list.append(tmp!)
                tmp = tmp?.next
            }
        }
        list.sort(by: { $0.val < $1.val })
        if list.count == 0 {
            return nil
        }
        for i in 0 ..< list.count - 1 {
            list[i].next = list[i + 1]
        }
        list.last?.next = nil
        return list.first
    }
}
