class Solution {
    func removeDuplicates(_ s: String) -> String {
        var s = [Character](s)
        var index = 0
        while index < s.count - 1 {
            if s[index] == s[index + 1] {
                s.remove(at: index)
                s.remove(at: index)
                if index > 0 {
                    index -= 1
                }
            } else {
                index += 1
            }
        }
        return String(s)
    }
}

class Solution2 {
    func removeDuplicates(_ s: String) -> String {
        var stack = [Character]()
        for i in s {
            if stack.last != nil, stack.last == i {
                stack.popLast()
            } else {
                stack.append(i)
            }
        }
        return String(stack)
    }
}
