class Solution {
    func convertTime(_ current: String, _ correct: String) -> Int {
        let cur = current.split(separator: ":")
        let curH = Int(cur[0])!; let curM = Int(cur[1])!
        let cor = correct.split(separator: ":")
        let corH = Int(cor[0])!; let corM = Int(cor[1])!
        
        var total = 0
        total += corH - curH
        var m = corM - curM
        if m < 0{
            m += 60
            total -= 1
        }
        while m > 0{
            if m >= 15{
                m -= 15
            }else if m >= 5{
                m -= 5
            }else{
                m -= 1
            }
            total += 1
        }
        return total
    }
}

let sol = Solution()
print(sol.convertTime("02:30", "04:35"))
print(sol.convertTime("02:30", "05:25"))
print(sol.convertTime("11:00", "11:01"))
