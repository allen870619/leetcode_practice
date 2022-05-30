class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let ans = dividend / divisor
        if ans > Int(Int32.max){
            return Int(Int32.max)
        }else if ans < -(Int(Int32.max)+1){
            return -(Int(Int32.max)+1)
        }else{
            return ans
        }
    }
}

let sol = Solution()
print(sol.divide(-2147483648, -1)) // expect 2147483647
