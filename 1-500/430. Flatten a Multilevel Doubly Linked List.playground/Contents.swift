public class Node {
    public var val: Int
    public var prev: Node?
    public var next: Node?
    public var child: Node?
    public init(_ val: Int) {
        self.val = val
        prev = nil
        next = nil
        child = nil
    }
}

class Solution {
    func flatten(_ head: Node?) -> Node? {
        if head == nil {
            return nil
        }
        var head = head
        var dummy: Node? = Node(-1)
        let result = dummy

        while head != nil {
            // next node
            dummy?.next = head
            dummy?.next?.prev = dummy
            let nextNode = head?.next
            dummy = dummy?.next

            // child node
            if let child = head?.child {
                if let subNode = flatten(child) {
                    dummy?.next = subNode
                    dummy?.next?.prev = dummy
                    while dummy?.next != nil {
                        dummy = dummy?.next
                        dummy?.next?.prev = dummy
                    }
                }
                head?.child = nil
            }

            // move on
            head = nextNode
        }

        result?.next?.prev = nil
        return result?.next
    }
}
