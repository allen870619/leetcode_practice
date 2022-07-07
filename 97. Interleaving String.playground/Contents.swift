class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        var arr: [[Bool?]] = Array(repeating: Array(repeating: nil, count: 101), count: 101)
        let s1 = [Character](s1), s2 = [Character](s2), s3 = [Character](s3)
        let s1t = s1.count, s2t = s2.count, s3t = s3.count
        
        if s1t + s2t != s3t{
            return false
        }
        
        func check(_ left: Int, _ right: Int, _ total: Int) -> Bool{
            if total == s3t{
                return true
            }
            
            if left == s1t{
                // compare right
                if s2[right] == s3[total]{
                    return checkArr(left, right+1, total)
                }
            }else if right == s2t{
                // compare left
                if s1[left] == s3[total]{
                    return checkArr(left+1, right, total)
                }
            }else{
                if s1[left] == s2[right] && s1[left] == s3[total]{
                    return checkArr(left+1, right, total) || checkArr(left, right+1, total)
                }
                if s1[left] == s3[total]{
                    return checkArr(left+1, right, total)
                }
                if s2[right] == s3[total]{
                    return checkArr(left, right+1, total)
                }
            }
            
            return false
        }
        
        func checkArr(_ l: Int, _ r: Int, _ t: Int) -> Bool{
            if arr[l][r] == nil{
                arr[l][r] = check(l, r, t+1)
            }
            return arr[l][r]!
        }
        
        return check(0, 0, 0)
    }
}

let sol = Solution()
print(sol.isInterleave("aabcc", "dbbca", "aadbbcbcac"))
print(sol.isInterleave("aabcc", "dbbca", "aadbbbaccc"))
print(sol.isInterleave("", "", ""))
print(sol.isInterleave("a", "", "a"))
print(sol.isInterleave("a", "", "c"))

