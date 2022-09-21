class Solution {
    func divideString(_ s: String, _ k: Int, _ fill: Character) -> [String] {
        var result: [String] = []
        var tmp = ""
        for i in s {
            tmp += String(i)
            if tmp.count == k {
                result.append(tmp)
                tmp = ""
            }
        }
        if tmp.count != 0 {
            while tmp.count != k {
                tmp += String(fill)
            }
            result.append(tmp)
        }

        return result
    }
}

let sol = Solution()
print(sol.divideString("abcdefghi", 3, "x"))
print(sol.divideString("abcdefghij", 3, "x"))
