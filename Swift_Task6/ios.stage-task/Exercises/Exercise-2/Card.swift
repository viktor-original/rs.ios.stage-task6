import Foundation

protocol CardBaseCompatible: Hashable, Codable {
    var suit: Suit {get}
    var value: Value {get}
    var isTrump: Bool {get}

    func hash(into hasher: inout Hasher)
}

enum Suit: Int, CaseIterable, Codable, Equatable {
    case clubs
    case spades
    case hearts
    case diamonds
}

enum Value: Int, CaseIterable, Codable, Equatable {
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
}

struct Card: CardBaseCompatible {
    
    let suit: Suit
    let value: Value
    var isTrump: Bool = false

    func hash(into hasher: inout Hasher) {

    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.isTrump == rhs.isTrump &&
        lhs.value == rhs.value &&
        lhs.suit == rhs.suit
    }
    
}

extension Card {

    func checkIfCanBeat(card: Card) -> Bool {
        
        if (card.suit != self.suit) && !self.isTrump {
            return false
        }
        
        if !card.isTrump && self.isTrump {
            return true
        }
        
        return checkValue(card: card)
        
    }

    func checkValue(card: Card) -> Bool {
        return card.value.rawValue < self.value.rawValue
    }
}
