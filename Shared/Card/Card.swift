//
//  Card.swift
//  Solitairy (iOS)
//
//  Created by Connor Fitzpatrick on 4/27/21.
//

import Foundation
import SwiftUI

enum Suit: String {
    case Spade = "Spade"
    case Club = "Club"
    case Heart = "Heart"
    case Diamond = "Diamond"
}

struct Card {
    let numberValue: Int
    let suit: Suit
    let image: Image
    
    var isRed: Bool {
        if (self.suit == Suit.Heart || self.suit == Suit.Diamond) {
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
