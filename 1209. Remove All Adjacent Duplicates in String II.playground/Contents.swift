class Solution { // AC
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        var stack = [Character]()
        var target = Character(" ")
        var tc = 0
        for i in s {
            if i != target {
                target = i
                tc = 1
                stack.append(i)
            } else {
                if tc == k - 1 {
                    for _ in 0 ..< k - 1 {
                        stack.removeLast()
                    }
                    tc = 0
                    if let l = stack.last {
                        target = l
                        for z in stride(from: stack.count - 1, through: 0, by: -1) {
                            if stack[z] == target {
                                tc += 1
                            } else {
                                break
                            }
                        }
                    } else {
                        target = Character(" ")
                    }
                } else {
                    tc += 1
                    stack.append(i)
                }
            }
        }
        return String(stack)
    }
}

class Solution2 { // TLE
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        if s.isEmpty {
            return s
        }

        var s = [Character](s)
        var index = 0
        var sc = s.count
        while index < sc {
            let c = s[index]
            var shift = 0
            if index + k - 1 < sc {
                var isSame = true
                for i in 1 ..< k {
                    shift = i
                    if s[index + i] != c {
                        isSame = false
                        break
                    }
                }

                if isSame {
                    for _ in 0 ..< k {
                        s.remove(at: index)
                        sc -= 1
                    }
                    if index < sc {
                        while index > 0, s[index] == s[index - 1] {
                            index -= 1
                        }
                    }
                } else {
                    index += shift
                }
            } else {
                index = sc
            }
        }
        return String(s)
    }
}

let sol = Solution()
print(sol.removeDuplicates("abcd", 2))
print(sol.removeDuplicates("deeedbbcccbdaa", 3))
print(sol.removeDuplicates("pbbcggttciiippooaais", 2))
print(sol.removeDuplicates("yfttttfbbbbnnnnffbgffffgbbbbgssssgthyyyy", 4))
