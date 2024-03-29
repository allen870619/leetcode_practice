public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

// Time complexity: O(n) (create), random: O(n)
// space: O(1)
class Solution4 {
    var head: ListNode?
    var total = 0
    init(_ head: ListNode?) {
        self.head = head
        var tmp = head

        while tmp != nil {
            total += 1
            tmp = tmp?.next
        }
    }

    func getRandom() -> Int {
        let index = Int.random(in: 0 ..< total)
        var tmp = head
        for _ in 0 ..< index {
            tmp = tmp?.next
        }
        return tmp?.val ?? 0
    }
}

// Time complexity: O(n) (create)
// space: O(n)
class Solution3 {
    var list = [Int]()
    init(_ head: ListNode?) {
        var head = head
        while head != nil {
            if let tmp = head {
                list.append(tmp.val)
            }
            head = head?.next
        }
    }

    func getRandom() -> Int {
        let index = Int.random(in: 0 ..< list.count)
        return list[index]
    }
}

class Solution {
    var head: ListNode?
    init(_ head: ListNode?) {
        self.head = head
    }

    func getRandom() -> Int {
        var pointer = head
        var total = 0
        while pointer != nil {
            total += 1
            pointer = pointer?.next
        }

        let rand = Int.random(in: 0 ..< total)
        pointer = head
        var count = 0
        while pointer != nil {
            if count == rand {
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
        while pointer != nil {
            nodeList.append(pointer)
            pointer = pointer?.next
        }

        let rand = Int.random(in: 0 ..< nodeList.count)
        return nodeList[rand]?.val ?? -1
    }
}

let sol = Solution(ListNode(3, ListNode(2, ListNode(5))))
print(sol.getRandom())
print(sol.getRandom())
print(sol.getRandom())
print(sol.getRandom())
print(sol.getRandom())
print(sol.getRandom())
