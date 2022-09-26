public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }

        var arr = [ListNode]()
        var tHead: ListNode? = head
        while tHead != nil {
            arr.append(tHead!)
            tHead = tHead?.next
        }
        arr.sort(by: { $0.val < $1.val })
        var result = arr[0]
        for (i, node) in arr[..<(arr.count - 1)].enumerated() {
            node.next = arr[i + 1]
        }
        arr.last?.next = nil
        return result
    }
}

class Solution2 { // Merge sort
    func sortList(_ head: ListNode?) -> ListNode? {
        devide(head)
    }

    private func devide(_ start: ListNode?) -> ListNode? {
        if start == nil || start?.next == nil {
            return start
        }
        let mid = getMid(start)
        let left = devide(start)
        let right = devide(mid)
        return conquer(left, right)
    }

    private func conquer(_ nodeA: ListNode?, _ nodeB: ListNode?) -> ListNode? {
        var aNode: ListNode? = nodeA
        var bNode: ListNode? = nodeB
        var head: ListNode? = ListNode()
        var tmpHead = head
        while aNode != nil, bNode != nil {
            if aNode!.val < bNode!.val {
                tmpHead?.next = aNode
                aNode = aNode?.next
            } else {
                tmpHead?.next = bNode
                bNode = bNode?.next
            }
            tmpHead = tmpHead?.next
        }
        tmpHead?.next = aNode != nil ? aNode : bNode
        return head?.next
    }

    func getMid(_ head: ListNode?) -> ListNode? {
        var midPrev: ListNode?
        var head = head
        while head != nil, head?.next != nil {
            midPrev = midPrev == nil ? head : midPrev?.next
            head = head?.next?.next
        }
        let mid = midPrev?.next
        midPrev?.next = nil
        return mid
    }
}

let sol = Solution2()
var node = ListNode(10, ListNode(1, ListNode(60, ListNode(30, ListNode(5)))))
var result = sol.sortList(node)
while result != nil {
    print(result?.val)
    result = result?.next
}

node = ListNode(4, ListNode(2, ListNode(3, ListNode(1))))
result = sol.sortList(node)
while result != nil {
    print(result?.val)
    result = result?.next
}

node = ListNode(1, ListNode(3, ListNode(3, ListNode(2, ListNode(3, ListNode(1, ListNode(3, ListNode(4))))))))
result = sol.sortList(node)
while result != nil {
    print(result?.val)
    result = result?.next
}
