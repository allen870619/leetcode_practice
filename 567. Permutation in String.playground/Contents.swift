class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var originArr = Array(repeating: 0, count: 26)
        for i in s1{
            originArr[Int(i.asciiValue! - 97)] += 1
        }
        // find s2
        let s2 = [Character](s2)
        var left = 0
        var tmpArr = Array(repeating: 0, count: 26)
        for (right, char) in s2.enumerated(){
            tmpArr[Int(char.asciiValue! - 97)] += 1
            if right - left == s1.count{
                tmpArr[Int(s2[left].asciiValue! - 97)] -= 1
                left += 1
            }
            if tmpArr == originArr{
                return true
            }
        }
        return false
    }
}

let sol = Solution()
print(sol.checkInclusion("ab", "eidbaooo")) //t
print(sol.checkInclusion("abc", "eidabbcooo")) //f
print(sol.checkInclusion("abc", "eidabacooo")) //t
print(sol.checkInclusion("ab", "eidboaoo")) //f
print(sol.checkInclusion("adc", "dcda")) //t
print(sol.checkInclusion("hello","ooolleoooleh")) // f

