class Solution { // RTL, greedy
    func getSmallestString(_ n: Int, _ k: Int) -> String {
        var list = Array(repeating: 1, count: n)
        var k = k - n
        var pointer = n - 1
        while pointer >= 0 && k > 0{
            if k >= 25{
                list[pointer] += 25
                k -= 25
            }else{
                list[pointer] += k
                k = 0
            }
            pointer -= 1
        }
        
        var result = [Character]()
        for i in list{
            result.append(Character(UnicodeScalar(i+96)!))
        }
        return String(result)
    }
}

class Solution2 { // LTR
    func getSmallestString(_ n: Int, _ k: Int) -> String {
        var least = (n - 1) * 26
        var k = k
        var result = [Character]()
        for i in 0..<n{
            if k <= least{
                result.append("a")
                k -= 1
            }else{
                let ascii = k - least
                if ascii == 122{
                    result.append("z")
                }else{
                    result.append(Character(UnicodeScalar(ascii+96)!))
                }
                k -= ascii
            }
            least -= 26
        }
        return String(result)
    }
}

let sol = Solution2()
print(sol.getSmallestString(3, 27))
print(sol.getSmallestString(5, 73))
