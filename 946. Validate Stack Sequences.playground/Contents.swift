class Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var pushIndex = 0
        var popIndex = 0
        let total = pushed.count
        var stack = [Int]()
        while pushIndex < total || popIndex < total{
            if stack.last == popped[popIndex]{
                stack.popLast()
                popIndex += 1
            }else if pushIndex >= total || popIndex >= total {
                return false
            }else if pushed[pushIndex] == popped[popIndex]{
                pushIndex += 1
                popIndex += 1
            }else{
                stack.append(pushed[pushIndex])
                pushIndex += 1
            }
        }
        return true
    }
}

let sol = Solution()
print(sol.validateStackSequences([1,2,3,4,5], [4,5,3,2,1]))
print(sol.validateStackSequences([1,2,3,4,5], [4,3,5,1,2]))
