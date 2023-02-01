class Solution2 { // math
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        if str1 + str2 != str2 + str1 {
            return ""
        }

        return String(str1.prefix(gcd(str1.count, str2.count)))
    }

    func gcd(_ x: Int, _ y: Int) -> Int {
        let minV = min(x, y)
        let maxV = max(x, y)

        return maxV % minV == 0 ? minV : gcd(minV, maxV % minV)
    }
}

class Solution { // force
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        var strc1 = [Character](str1), strc2 = [Character](str2)
        if str1.count < str2.count {
            strc1 = [Character](str2)
            strc2 = [Character](str1)
        }

        var result = ""

        for i in 0 ..< strc2.count {
            let tmp = "\(String(strc2[0 ... i]))"
            let tmpCount = tmp.count

            var tmp1 = "", tmp2 = ""
            if strc1.count % tmpCount == 0 {
                for i in 0 ..< strc1.count / tmpCount {
                    tmp1 += tmp
                }
            }

            if strc2.count % tmpCount == 0 {
                for i in 0 ..< strc2.count / tmpCount {
                    tmp2 += tmp
                }
            }

            if tmp1 == String(strc1), tmp2 == String(strc2) {
                result = tmp
            }
        }
        return result
    }
}

let sol = Solution2()
// print(sol.gcdOfStrings("ABCABC", "ABC"))
// print(sol.gcdOfStrings("ABABAB", "ABAB"))
// print(sol.gcdOfStrings("LEET", "CODE"))
print(sol.gcdOfStrings("TAUXXTAUXXTAUXXTAUXXTAUXX", "TAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXX"))
