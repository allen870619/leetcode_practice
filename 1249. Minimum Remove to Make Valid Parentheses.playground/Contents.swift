class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var result = ""
        var leftStack = [(Int, Character)]()
        for (i,c) in s.enumerated(){
            if c == "("{
                leftStack.append((i, c))
            }else if c == ")"{
                if leftStack.last?.1 == ")" || leftStack.isEmpty{
                    leftStack.append((i, c))
                }else{
                    leftStack.popLast()
                }
            }
        }
        
        var shift = 0
        for (i, c) in s.enumerated(){
            if shift < leftStack.count{
                if i != leftStack[shift].0{
                    result.append(c)
                }else{
                    shift += 1
                }
            }else{
                result.append(c)
            }
        }
        return result
    }
}
let sol = Solution()
print(sol.minRemoveToMakeValid("lee(t(c)o)de)"))
print(sol.minRemoveToMakeValid("a)b(c)d"))
print(sol.minRemoveToMakeValid("))(("))
