class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var result = 0
        var count = 0
        var isStart = true
        for i in 0..<flowerbed.count{
            if flowerbed[i] == 1{
                result += isStart ? count / 2 : (count - 1) / 2
                isStart = false
                count = 0
            }else{
                count += 1
            }
        }
        if count != 0{
            result += isStart ? (count + 1) / 2 :  count / 2
        }
        return result >= n
    }
}

let sol = Solution()
print(sol.canPlaceFlowers([1,0,0,0,1], 1))
print(sol.canPlaceFlowers([1,0,0,0,1], 2))
print(sol.canPlaceFlowers([0], 1))
print(sol.canPlaceFlowers([0,0,0], 2))
