class Solution { // BFS
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var opened = Array(repeating: false, count: rooms.count)
        opened[0] = true
        var list = rooms[0]

        while !list.isEmpty {
            for _ in list {
                let room = list.removeFirst()
                if !opened[room] {
                    opened[room] = true
                    list += rooms[room]
                }
            }
        }
        return !opened.contains(false)
    }
}

class Solution2 { // DFS
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var opened = Array(repeating: false, count: rooms.count)
        func findRoom(room: Int) {
            if opened[room] {
                return
            }
            opened[room] = true
            for num in rooms[room] {
                findRoom(room: num)
            }
        }
        findRoom(room: 0)
        return !opened.contains(false)
    }
}

let sol = Solution()
print(sol.canVisitAllRooms([[1], [2], [3], []]))
print(sol.canVisitAllRooms([[1, 3], [3, 0, 1], [2], [0]]))
