//
//  Card.swift
//  Solitairy (iOS)
//
//  Created by Connor Fitzpatrick on 4/27/21.
//

import Foundation
import SwiftUI

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "Spades"
        case .Hearts:
            return "Hearts"
        case .Diamonds:
            return "Diamonds"
        case .Clubs:
            return "Clubs"
        }
    }
}

extension Suit: CaseIterable {}

struct Card {
    let numberValue: Int
    let suit: Suit
    let image: Image
    
    var isRed: Bool {
        if (self.suit == Suit.Hearts || self.suit == Suit.Diamonds) {
            return true
        } else {
            return false
        }
    }
    
    var isKing: Bool {
        (self.numberValue == 13) ? true : false
    }
    
    var isAce: Bool {
        (self.numberValue == 1) ? true : false
    }
}
