public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        left = nil
        right = nil
        next = nil
    }

    public init(_ val: Int, _ left: Node?, _ right: Node?) {
        self.val = val
        self.left = left
        self.right = right
        next = nil
    }
}

class Solution {
    func connect(_ root: Node?) -> Node? {
        var list = [root, nil]
        while !list.isEmpty {
            for _ in 0 ..< list.count {
                var node = list.removeFirst()
                if node != nil {
                    node?.next = list.first!
                    if let l = node?.left {
                        list.append(l)
                    }
                    if let r = node?.right {
                        list.append(r)
                    }
                }
            }
            if list.count > 0 {
                list.append(nil)
            }
        }
        return root
    }
}

let node1 = Node(1, Node(2, Node(4), Node(5)), Node(3, nil, Node(7, nil, nil)))
let sol = Solution()
var new = sol.connect(node1)
