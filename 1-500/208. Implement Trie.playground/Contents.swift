class Trie2 { // dictionary tree
    var head = Node(value: "-")

    init() {}

    func insert(_ word: String) {
        var tmp = head
        for i in word {
            let ascii = Int((i.asciiValue ?? 97) - 97)
            if tmp.next[ascii] == nil {
                tmp.next[ascii] = Node(value: i)
            }
            tmp = tmp.next[ascii]!
        }
        tmp.count += 1
    }

    func search(_ word: String) -> Bool {
        var tmp = head
        for i in word {
            let ascii = Int((i.asciiValue ?? 97) - 97)
            if tmp.next[ascii] == nil {
                return false
            }
            tmp = tmp.next[ascii]!
        }
        return tmp.count > 0
    }

    func startsWith(_ prefix: String) -> Bool {
        var tmp = head
        for i in prefix {
            let ascii = Int((i.asciiValue ?? 97) - 97)
            if tmp.next[ascii] == nil {
                return false
            }
            tmp = tmp.next[ascii]!
        }
        return tmp.next.contains(where: { $0 != nil }) || tmp.count > 0
    }

    class Node {
        var value: Character
        var count = 0
        var next: [Node?] = Array(repeating: nil, count: 26)

        init(value: Character) {
            self.value = value
        }
    }
}

class Trie {
    var list = Set<String>()
    init() {}

    func insert(_ word: String) {
        list.insert(word)
    }

    func search(_ word: String) -> Bool {
        list.contains(word)
    }

    func startsWith(_ prefix: String) -> Bool {
        list.contains { word in
            word.starts(with: prefix)
        }
    }
}
