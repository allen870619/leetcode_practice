class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        if num.count == k {
            return "0"
        }
        var inum = [Int]()
        for i in num{
            inum.append(Int("\(i)")!)
        }
        
        // remove
        var stack = [Int]()
        var remove = 0
        for i in inum{
            if remove < k{
                while stack.last != nil && stack.last! > i && remove < k{
                    stack.removeLast()
                    remove += 1
                }
            }
            stack.append(i)
        }
        while remove < k{
            stack.removeLast()
            remove += 1
        }
        
        // form up
        var result = ""
        var isStart = true
        for i in stack{
            if isStart{
                if i != 0{
                    isStart = false
                    result += "\(i)"
                }
            }else{
                result += "\(i)"
            }
        }
        return result == "" ? "0" : result
    }
}

let sol = Solution()
print(sol.removeKdigits("73283571", 3))
print(sol.removeKdigits("1432219", 3))
print(sol.removeKdigits("10200", 1))
print(sol.removeKdigits("10", 2))
print(sol.removeKdigits("10", 1))
print(sol.removeKdigits("112", 1))
