class Solution {
    func findComplement(_ num: Int) -> Int {
        var num = num
        var numStack: [Int] = []
        while num != 0{
            numStack.append(num % 2 == 0 ? 1 : 0)
            num /= 2
        }
        print(numStack)
        
        var result = 0
        var binBase = 1
        for i in numStack{
            result += binBase * i
            binBase *= 2
        }
        return result
    }
}

class Solution2 {
    func findComplement(_ rnum: Int) -> Int {
        var num = rnum; var xor = ""
        
        while num != 0{
            num /= 2
            xor += "1"
        }
        
        return Int(xor, radix: 2)! ^ rnum
    }
}

let sol = Solution2()
print(sol.findComplement(2))
print(sol.findComplement(5))
print(sol.findComplement(25))
