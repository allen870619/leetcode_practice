// 2022/06/16
class Solution3 {
    func longestPalindrome(_ os: String) -> String {
        var s = [Character("-")]
        for i in os {
            s.append(i)
            s.append("-")
        }

        var left = 0
        var right = 0
        for index in 0 ..< s.count {
            var shift = 0
            var l = 0, r = 0
            while index - shift >= 0, index + shift < s.count {
                if s[index - shift] == s[index + shift] {
                    l = index - shift
                    r = index + shift
                } else {
                    break
                }
                shift += 1
            }
            if r - l > right - left {
                left = l
                right = r
            }
        }
        var result = s[left ... right]
        result.removeAll { $0 == "-" }
        return String(result)
    }
}

// 2021/12/08
class Solution {
    func longestPalindrome(_ s: String) -> String {
        var cList: [Character] = ["_"]
        var left = 0
        var right = 0
        for i in s {
            cList.append(i)
            cList.append("_")
        }

        for i in 0 ..< cList.count {
            var count = 1
            var l = 0
            var r = 0
            while i - count >= 0, i + count < cList.count {
                if cList[i - count] == cList[i + count] {
                    l = i - count
                    r = i + count
                } else {
                    break
                }
                count += 1
            }
            if r - l > right - left {
                left = l
                right = r
            }
        }

        var c = cList[left ... right]
        c.removeAll { c -> Bool in
            c == "_"
        }
        return String(c)
    }
}

class Solution3 { // TLE
    var tarStr: [Character] = []
    func longestPalindrome(_ s: String) -> String {
        tarStr.removeAll()
        for i in s {
            tarStr.append(i)
        }
        return getget(s, "")
    }

    func getget(_ s: String, _ mMax: String) -> String {
        if s.count < 2 {
            if s.count > mMax.count {
                return s
            } else {
                return mMax
            }
        }
        var isCom = false
        isCom = s == String(s.reversed())
        if isCom {
            if s.count > mMax.count {
                return s
            } else {
                return mMax
            }
        } else {
            let left = getget(getSub(0, s.count - 2), mMax)
            let right = getget(getSub(1, s.count - 1), mMax)
            if left.count > right.count {
                return left
            } else {
                return right
            }
        }
    }

    func getSub(_ start: Int, _ end: Int) -> String {
        String(tarStr[start ... end])
    }
}

let sol = Solution()
print(sol.longestPalindrome("babad"))
print(sol.longestPalindrome("cddf"))
//  print(sol.longestPalindrome("a"))
//  print(sol.longestPalindrome("xabax"))
//  print(sol.longestPalindrome("xabay"))
//  print(sol.longestPalindrome("abba"))
//  print(sol.longestPalindrome("aaaa"))
//  print(sol.longestPalindrome("caba"))
//  print(sol.longestPalindrome("ccc"))
//  print(sol.longestPalindrome("qagtxztpovdbqrhtftxrfjkrrjnhbkoawjctdiaygmbutzzosisyxwqbufsgbmfbpcxvdibnayximkkdmviorabhjasxyyagqrxzfewimqewftfihlgsqmkoapwckbhdarhlbonypdzhnxcnzanlrjzfixrpepsjmdepgxvyuijonhqnejymwlofzskcfqdyyfowkzhswutsuhwiqkoogeqkcpjrqndeaxqvdadheostwdonphfaemebuqmwdtrioyjtzoprasizwmwfikaihudneusfgdtcpwgzkwnceziayflxrsmydjiwbeqdzcfewedulydcoahgptzzlzldzaazblvzxuvdxhmzbwasfibtkxuylpklpbfmhujcwvmhbylkrxmhgmmrzdanhsvkrlwqctoexcmhughsvcqgdxxnvcawrroebqylnelyodxfkrplprldsjeejsdlrplprkfxdoylenlyqbeorrwacvnxxdgqcvshguhmcxeotcqwlrkvshnadzrmmghmxrklybhmvwcjuhmfbplkplyuxktbifsawbzmhxdvuxzvlbzaazdlzlzztpghaocdyludewefczdqebwijdymsrxlfyaizecnwkzgwpctdgfsuenduhiakifwmwzisarpoztjyoirtdwmqubemeafhpnodwtsoehdadvqxaednqrjpckqegookqiwhustuwshzkwofyydqfckszfolwmyjenqhnojiuyvxgpedmjspeprxifzjrlnazncxnhzdpynoblhradhbkcwpaokmqsglhiftfweqmiwefzxrqgayyxsajhbaroivmdkkmixyanbidvxcpbfmbgsfubqwxysisozztubmgyaidtcjwaokbhnjrrkjfrxtfthrqbdvoptzxtgaq"))
