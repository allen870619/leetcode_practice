class Solution {
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        if k > s.count {
            return false
        }
        let s = [Character](s)
        var total = 1 << k
        var check = Array(repeating: false, count: total)
        for i in 0 ..< s.count - k + 1 {
            let value = Int(String(s[i ..< i + k]), radix: 2)!
            if !check[value] {
                check[value] = true
                total -= 1
                if total == 0 {
                    return true
                }
            }
        }
        return false
    }
}

class Solution2 { // Faster!! Using [Int] instead of String->Int
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        if k > s.count {
            return false
        }
        let intList: [Int] = s.map { $0 == "0" ? 0 : 1 }
        var total = 1 << k
        let mask = total - 1
        var check = Array(repeating: false, count: total)

        // init start value
        var value = 0
        for i in 0 ..< k {
            value = (value << 1) | intList[i]
        }
        check[value] = true
        total -= 1

        // others
        for i in k ..< s.count {
            value = ((value << 1) | intList[i]) & mask
            if !check[value] {
                check[value] = true
                total -= 1
                if total == 0 {
                    return true
                }
            }
        }
        return false
    }
}

let sol = Solution2()
print(sol.hasAllCodes("00110110", 2))
print(sol.hasAllCodes("00110", 2))
print(sol.hasAllCodes("00000000001011100", 3))
print(sol.hasAllCodes("0110", 2)) // f
print(sol.hasAllCodes("1100000100111001011101000110101111111010110101010000001010001110", 4))
