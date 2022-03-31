class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        if triangle.count == 0{
            return triangle.first?.first ?? 0
        }
        var tri = triangle
        for i in 1..<tri.count{
            for j in 0..<tri[i].count{
                var left = j != 0 ? tri[i-1][j-1] : tri[i-1][j]
                var right = j != tri[i].count-1 ? tri[i-1][j] : tri[i-1][j-1]
                tri[i][j] += min(left, right)
            }
        }
        return tri.last?.min() ?? 0
    }
}

class Solution2 { //TLE
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        return cal(triangle, 0, 0)
    }
    
    func cal(_ triangle: [[Int]], _ prev: Int, _ row: Int) -> Int{
        if row == triangle.count{
            return 0
        }
        return triangle[row][prev] + min(cal(triangle, prev, row + 1), cal(triangle, prev + 1, row + 1))
    }
}

let sol = Solution()
print(sol.minimumTotal([[2],[3,4],[6,5,7],[4,1,8,3]]))
print(sol.minimumTotal([[2],[7,3],[9,4,1],[5,6,3,8],[1,4,2,5,3]]))
print(sol.minimumTotal([[-10]]))
