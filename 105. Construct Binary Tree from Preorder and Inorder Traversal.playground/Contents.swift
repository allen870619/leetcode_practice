public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var dict = [Int: Int]()
        for (index, i) in inorder.enumerated(){
            dict[i] = index
        }
        
        var root = TreeNode(preorder[0])
        for i in 1..<preorder.count{
            let valIndex = dict[preorder[i]]!
            let newNode = TreeNode(preorder[i])
            
            var tmp = root
            while tmp != nil{
                let nodeIndex = dict[tmp.val]!
                if nodeIndex < valIndex{
                    if let right = tmp.right{
                        tmp = right
                    }else{
                        tmp.right = newNode
                        break
                    }
                }else{
                    if let left = tmp.left{
                        tmp = left
                    }else{
                        tmp.left = newNode
                        break
                    }
                }
            }
        }
        
        return root
    }
}


class Solution2 {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0{
            return nil
        }
        var root = TreeNode(preorder.first!)
        if inorder.count == 1{
            return root
        }
        var preLeft = [Int](), preRight = [Int]()
        var inLeft = [Int](), inRight = [Int]()
        var isRight = false
        var preIndex = 0
        var inIndex = 0
        while inIndex < inorder.count{
            if inorder[inIndex] == root.val{
                isRight = true
            }else{
                if !isRight{
                    inLeft.append(inorder[inIndex] )
                }else{
                    inRight.append(inorder[inIndex])
                }
            }
            
            if preIndex < preorder.count{
                if preorder[preIndex] == root.val{
                    preIndex += 1
                }
                if !isRight{
                    preLeft.append(preorder[preIndex])
                }else{
                    preRight.append(preorder[preIndex])
                }
            }
            inIndex += 1
            preIndex += 1
        }
        
        root.left = buildTree(preLeft, inLeft)
        root.right = buildTree(preRight, inRight)
        return root
    }
}


let sol = Solution2()
var a = sol.buildTree([3,9,20,15,7], [9,3,15,20,7])

var list = [a]
while !list.isEmpty{
    for i in list{
        let t = list.removeFirst()!
        print(t.val)
        if let left = t.left{
            list.append(left)
        }else{
            print("nil")
        }
        if let right = t.right{
            list.append(right)
        }else{
            print("nil")
        }
    }
    print("---")
}
