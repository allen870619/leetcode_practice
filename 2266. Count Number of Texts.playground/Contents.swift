class Solution {
    func countTexts(_ pressedKeys: String) -> Int {
        func cal (_ a: Int, _ isFour: Bool) -> Int{
            let k = isFour ? 4 : 3
            if a > k{
                if isFour{
                    if let save = dictF[a]{
                        return save
                    }else{
                        dictF[a] = (cal(a-1, true)  + cal(a-2, true)  + cal(a-3, true)  + cal(a-4, true)) % 1000000007
                        return dictF[a]!
                    }
                }else{
                    if let save = dict[a]{
                        return save
                    }else{
                        dict[a] = (cal(a-1, false) + cal(a-2, false)  + cal(a-3, false)) % 1000000007
                        return dict[a]!
                    }
                }
            }else{
                if a == 1{
                    return 1
                }
                if a == 2{
                    return 2
                }
                if a == 3{
                    return 4
                }
                if a == 4{
                    return 8
                }
            }
            return 0
        }
        
        let pressedKeys = [Character](pressedKeys)
        var total = 1
        var dict = [Int: Int]()
        var dictF = [Int: Int]()
        var last = pressedKeys.first!
        var count = 1
        for i in pressedKeys[1...]{
            if i != last{
                total = total * cal(count, isFour(last)) % 1000000007
                last = i
                count = 1
            }else{
                count += 1
            }
        }
        return total * cal(count, isFour(last)) % 1000000007
    }
    
    private func isFour(_ val: Character) -> Bool{
        return val == "7" || val == "9"
    }
}

let sol = Solution()
print(sol.countTexts("222222222222222222222222222222222222"))
print(sol.countTexts("22233"))
print(sol.countTexts("444479999555588866"))
print(sol.countTexts("444444444444444444444444444444448888888888888888999999999999333333333333333366666666666666662222222222222222666666666666666633333333333333338888888888888888222222222222222244444444444444448888888888888222222222222222288888888888889999999999999999333333333444444664"))
print(sol.countTexts("88888888888888888888888888888999999999999999999999999999994444444444444444444444444444488888888888888888888888888888555555555555555555555555555556666666666666666666666666666666666666666666666666666666666222222222222222222222222222226666666666666666666666666666699999999999999999999999999999888888888888888888888888888885555555555555555555555555555577777777777777777777777777777444444444444444444444444444444444444444444444444444444444433333333333333333333333333333555555555555555555555555555556666666666666666666666666666644444444444444444444444444444999999999999999999999999999996666666666666666666666666666655555555555555555555555555555444444444444444444444444444448888888888888888888888888888855555555555555555555555555555555555555555555555555555555555555555555555555555555555999999999999999555555555555555555555555555554444444444444444444444444444444555"))
