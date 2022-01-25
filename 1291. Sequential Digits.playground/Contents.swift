class Solution {
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        var length = 1
        var result: [Int] = []
        while length < 10{
            for i in 1...10-length{
                var count = i
                var tmp = "\(i)"
                while tmp.count <= length && count < 9{
                    count += 1
                    tmp += "\(count)"
                }
                if tmp.count != length + 1{
                    break
                }
                if let tmpInt = Int(tmp){
                    if(low...high).contains(tmpInt){
                        result.append(tmpInt)
                    }else if tmpInt > high{
                        return result
                    }
                }
            }
            length += 1
        }
        return result
    }
}

let sol = Solution()
print(sol.sequentialDigits(10, 3000))
print(sol.sequentialDigits(100, 300))
print(sol.sequentialDigits(1000, 13000))
