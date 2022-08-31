class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        var arrP = [(x: Int, y: Int)]()
        var arrA = [(x: Int, y: Int)]()
        let width = heights.first?.count ?? 0
        let height = heights.count
        
        // append init edge
        for i in 0..<width {
            arrP.append((i, 0))
            arrA.append((i, height-1))
        }
        for i in 0..<height {
            arrP.append((0, i))
            arrA.append((width-1, i))
        }
        
        // get all ocean contains
        func findList(_ arr: [(x: Int, y: Int)]) -> [(x: Int, y: Int)]{
            var heights = heights
            if arr.isEmpty {
                return []
            }
            var arr = arr
            var result = [(x: Int, y: Int)]()
            while !arr.isEmpty {
                let tmp = arr.removeFirst()
                
                if heights[tmp.y][tmp.x] != -1 {
                    result.append((tmp.x, tmp.y))
                    
                    // four directions
                    if tmp.x >= 1 && heights[tmp.y][tmp.x-1] >= heights[tmp.y][tmp.x] {
                        arr.append((tmp.x-1, tmp.y))
                    }
                    if tmp.y >= 1 && heights[tmp.y-1][tmp.x] >= heights[tmp.y][tmp.x] {
                        arr.append((tmp.x, tmp.y-1))
                    }
                    if tmp.x < width - 1 && heights[tmp.y][tmp.x+1] >= heights[tmp.y][tmp.x] {
                        arr.append((tmp.x+1, tmp.y))
                    }
                    if tmp.y < height - 1 && heights[tmp.y+1][tmp.x] >= heights[tmp.y][tmp.x] {
                        arr.append((tmp.x, tmp.y+1))
                    }
                    
                    heights[tmp.y][tmp.x] = -1
                }
            }
            return result
        }
        
        // calculate  overlap
        let p = findList(arrP)
        let a = findList(arrA)
        var result = [[Int]]()
        for i in p {
            if a.contains(where: {$0.x == i.x && $0.y == i.y}) {
                if !result.contains([i.y, i.x]) {
                    result.append([i.y, i.x])
                }
            }
        }
        return result
    }
}

