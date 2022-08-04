class Solution {
    func mirrorReflection(_ p: Int, _ q: Int) -> Int {
        let step = 2 * q
        var l = step, r = q
        var count = 1
        while true{
            if count % 2 == 1{ // r
                if r % (2*p) == 0{
                    return 0
                }else if r % p == 0{
                    return 1
                }
                r += step
            }else{ // l
                if l % (2*p) == p{
                    return 2
                }
                l += step
            }
            count += 1
        }
    }
}

let sol = Solution()
print(sol.mirrorReflection(2, 1))
print(sol.mirrorReflection(3, 1))
