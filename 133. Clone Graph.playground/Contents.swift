public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

// BFS
class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else{
            return nil
        }
        let newHead = Node(node.val)
        var runNode = [node]
        var nodeMap = [node.val: newHead]
        
        while !runNode.isEmpty{
            for _ in 0..<runNode.count{
                let node = runNode.removeFirst()
                if nodeMap[node.val] == nil{
                    nodeMap[node.val] = Node(node.val)
                }
                let targetNode = nodeMap[node.val]!
                for origin in node.neighbors{
                    if let origin = origin {
                        if nodeMap[origin.val] == nil{
                            runNode.append(origin)
                            nodeMap[origin.val] = Node(origin.val)
                        }
                        let neighbor = nodeMap[origin.val]
                        if !targetNode.neighbors.contains{$0?.val == neighbor?.val}{
                            targetNode.neighbors.append(neighbor)
                        }
                    }
                }
            }
        }
        return newHead
    }
}
