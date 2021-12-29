public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

class Solution { // O(N) S(N)
    func connect(_ root: Node?) -> Node? {
        guard let head = root else{
            return nil
        }
        head.next = nil
        
        var nodeStack: [Node?] = [head]
        while !nodeStack.isEmpty{
            var tmp : [Node] = []
            while !nodeStack.isEmpty{
                if let node = nodeStack.removeFirst(){
                    if let left = node.left{
                        tmp.append(left)
                    }
                    if let right = node.right{
                        tmp.append(right)
                    }
                }
            }
            
            if tmp.isEmpty{
                break
            }
            
            for i in 0..<tmp.count - 1{
                tmp[i].next = tmp[i+1]
            }
            tmp.last?.next = nil
            
            nodeStack = tmp
            tmp.removeAll()
        }
        return root
    }
}

class Solution2 {  // O(N) S(1)
    func connect(_ root: Node?) -> Node? {
        if root == nil{
            return nil
        }
        root?.next = nil
        
        var start = root
        while start != nil{
            var pointer = start
            start = start?.left
            while pointer != nil{
                pointer?.left?.next = pointer?.right
                pointer?.right?.next = pointer?.next?.left
                pointer = pointer?.next
            }
        }
        return root
    }
}
