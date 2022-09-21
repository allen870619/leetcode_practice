class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s1.isEmpty || s2.isEmpty || s2.count < s1.count { return false }
        var originArr = Array(repeating: 0, count: 26)
        for i in s1 {
            originArr[Int(i.asciiValue! - 97)] += 1
        }
        let s1Len = s1.count

        // find s2
        let s2arr = Array(s2)
        let s2Len = s2arr.count
        var tmpArr = Array(repeating: 0, count: 26)
        for right in 0 ..< s2Len {
            let char = s2arr[right]
            tmpArr[Int(char.asciiValue! - 97)] += 1
            if right - s1Len + 1 > 0 {
                tmpArr[Int(s2arr[right - s1Len].asciiValue! - 97)] -= 1
            }
            if tmpArr == originArr {
                return true
            }
        }
        return false
    }
}

let sol = Solution()
print(sol.checkInclusion("ab", "eidbaooo")) // t
print(sol.checkInclusion("abc", "eidabbcooo")) // f
print(sol.checkInclusion("abc", "eidabacooo")) // t
print(sol.checkInclusion("ab", "eidboaoo")) // f
print(sol.checkInclusion("adc", "dcda")) // t
print(sol.checkInclusion("hello", "ooolleoooleh")) // f
