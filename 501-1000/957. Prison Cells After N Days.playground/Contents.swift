class Solution2 { // AC
    func prisonAfterNDays(_ cells: [Int], _ n: Int) -> [Int] {
        var cells = cells, steps = [[Int]]()

        // initial round, first and last will be 0
        let tmp = cells
        for i in 1 ... 6 {
            cells[i] = tmp[i - 1] == tmp[i + 1] ? 1 : 0
        }
        cells[0] = 0
        cells[7] = 0

        // find the law
        for i in 0 ..< n {
            if steps.contains(cells) {
                break
            }
            steps.append(cells)
            let tmp = cells
            for i in 1 ... 6 {
                cells[i] = tmp[i - 1] == tmp[i + 1] ? 1 : 0
            }
        }

        // remainder index
        if !steps.isEmpty {
            let index = (n - 1) % steps.count
            cells = steps[index]
        }
        return cells
    }
}

class Solution { // TLE
    func prisonAfterNDays(_ cells: [Int], _ n: Int) -> [Int] {
        var cells = cells

        for _ in 0 ..< n {
            let tmp = cells
            for pri in 1 ... 6 {
                cells[pri] = tmp[pri - 1] == tmp[pri + 1] ? 1 : 0
            }
            cells[0] = 0
            cells[7] = 0
        }
        return cells
    }
}

let sol = Solution2()
print(sol.prisonAfterNDays([0, 1, 0, 1, 1, 0, 0, 1], 7))
print(sol.prisonAfterNDays([1, 0, 0, 1, 0, 0, 1, 0], 1_000_000_000))
