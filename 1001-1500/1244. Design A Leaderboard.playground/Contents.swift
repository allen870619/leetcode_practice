class Leaderboard {
    var dict: [Int: Int] = [:]
    init() {
        dict = [:]
    }

    func addScore(_ playerId: Int, _ score: Int) {
        if dict[playerId] == nil {
            dict[playerId] = 0
        }
        dict[playerId]? += score
    }

    func top(_ K: Int) -> Int {
        var total = 0
        var counter = 0
        for i in dict.sorted(by: { $0.value > $1.value }) {
            total += i.value
            counter += 1
            if counter == K {
                break
            }
        }
        return total
    }

    func reset(_ playerId: Int) {
        dict.removeValue(forKey: playerId)
    }
}

var leaderboard = Leaderboard()
leaderboard.addScore(1, 73) // leaderboard = [[1,73]];
leaderboard.addScore(2, 56) // leaderboard = [[1,73],[2,56]];
leaderboard.addScore(3, 39) // leaderboard = [[1,73],[2,56],[3,39]];
leaderboard.addScore(4, 51) // leaderboard = [[1,73],[2,56],[3,39],[4,51]];
leaderboard.addScore(5, 4) // leaderboard = [[1,73],[2,56],[3,39],[4,51],[5,4]];
print(leaderboard.top(1)) // returns 73;
leaderboard.reset(1) // leaderboard = [[2,56],[3,39],[4,51],[5,4]];
leaderboard.reset(2) // leaderboard = [[3,39],[4,51],[5,4]];
leaderboard.addScore(2, 51) // leaderboard = [[2,51],[3,39],[4,51],[5,4]];
print(leaderboard.top(3)) // returns 141 = 51 + 51 + 39

var leaderboard2 = Leaderboard()
leaderboard2.addScore(1, 78)
leaderboard2.addScore(2, 60)
leaderboard2.addScore(3, 84)
leaderboard2.addScore(4, 7)
leaderboard2.addScore(5, 61)
print(leaderboard2.top(1))

leaderboard2 = Leaderboard()
leaderboard2.addScore(1, 13)
leaderboard2.addScore(2, 93)
leaderboard2.addScore(3, 84)
leaderboard2.addScore(4, 6)
leaderboard2.addScore(5, 89)
leaderboard2.addScore(6, 31)
leaderboard2.addScore(7, 7)
leaderboard2.addScore(8, 1)
leaderboard2.addScore(9, 98)
leaderboard2.addScore(10, 42)
print(leaderboard2.top(5))
leaderboard2.reset(1)
leaderboard2.reset(2)
leaderboard2.addScore(3, 76)
leaderboard2.addScore(4, 68)
print(leaderboard2.top(1))
leaderboard2.reset(3)
leaderboard2.reset(4)
leaderboard2.addScore(2, 70)
leaderboard2.reset(2)
