class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var arr = Array(repeating: Array(repeating: 0, count: n), count: n)
        var x = -1; var y = 0
        var count = 1
        var n = n
        var direct = 0
        var runOne = true
        while n > 0{
            for _ in 1...n{
                if direct == 0{
                    x += 1
                }else if direct == 1{
                    y += 1
                }else if direct == 2{
                    x -= 1
                }else{
                    y -= 1
                }
                arr[y][x] = count
                count += 1
            }
            if runOne{
                n -= 1
            }
            runOne = !runOne
            direct = (direct + 1) % 4
        }
        return  arr
    }
}

let sol = Solution()
let a = sol.generateMatrix(5)
for i in a{
    print(i)
}
