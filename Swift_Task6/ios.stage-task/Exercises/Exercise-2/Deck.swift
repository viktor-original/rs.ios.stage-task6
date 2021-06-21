import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        
        self.type = type
        cards = createDeck(suits: Suit.allCases, values: Value.allCases)
        
    }

    public mutating func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        
        var newCards: [Card] = []
        
        for suit in suits {
            
            for value in values {
                newCards.append(.init(suit: suit, value: value))
            }
        }
        
    return newCards
        
    }

    public mutating func shuffle() {
        cards.shuffle()
    }

    public mutating func defineTrump() {
        
        if !cards.isEmpty {
            trump = cards.last?.suit
            setTrumpCards(for: trump!)
        }
        
    }

    public mutating func initialCardsDealForPlayers(players: [Player]) {
        
        for player in players {
            player.hand = Array(cards.dropFirst(6))
            cards.removeFirst(6)
        }
        
    }

    public mutating func setTrumpCards(for suit:Suit) {
        
        for card in 0..<cards.count {
            
            if cards[card].suit != suit{
                cards[card].isTrump = false
                
            } else {
                
                cards[card].isTrump = true
                
            }

        }
    }
}

