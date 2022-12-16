class Solution {
    func minimizeXor(_ num1: Int, _ num2: Int) -> Int {
        var bit1 = [Character](String(num1, radix: 2))
        var bit2 = [Character](String(num2, radix: 2))
        let length = max(bit1.count, bit2.count)
        if bit1.count < bit2.count {
            for _ in 0 ..< length - bit1.count {
                bit1.insert("0", at: 0)
            }
        } else if bit1.count > bit2.count {
            for _ in 0 ..< length - bit2.count {
                bit2.insert("0", at: 0)
            }
        }

        var ans: [Character] = Array(repeating: "0", count: length)

        let oriBit1 = bit1
        var bit2Count = bit2.reduce(0) { result, char -> Int in
            result + (char == "1" ? 1 : 0)
        }

        for (index, i) in bit1.enumerated() {
            if bit2Count == 0 {
                break
            }
            if i == "1" {
                ans[index] = "1"
                bit1[index] = "0"
                bit2Count -= 1
            }
        }

        if bit2Count == 0 {
            return Int(String(ans), radix: 2) ?? 0
        }

        for i in stride(from: oriBit1.count - 1, through: 0, by: -1) {
            if bit2Count == 0 {
                break
            }

            if oriBit1[i] == "0" {
                bit2Count -= 1
                bit1[i] = "1"
                ans[i] = "1"
            }
        }
        return Int(String(ans), radix: 2) ?? 0
    }
}

let sol = Solution()
print(sol.minimizeXor(3, 5))
print(sol.minimizeXor(1, 12))
