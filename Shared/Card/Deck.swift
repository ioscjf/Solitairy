//
//  Deck.swift
//  Solitairy (iOS)
//
//  Created by Connor Fitzpatrick on 4/27/21.
//

import Foundation
import SwiftUI

class Deck { // should be a class
    var cards: [Card] = [] // Do not initialize here, see https://stackoverflow.com/questions/34474545/self-used-before-all-stored-properties-are-initialized to fix!!
    
    init() {
        // generate the deck
        self.cards = self.generateDeck()
    }
    
    func generateDeck() -> [Card] {
        var cards: [Card] = []
        for nv in 1...13 {
            Suit.allCases.forEach {
                let suit = $0
                cards.append(Card(numberValue: nv, suit: suit, image: Image(""))) // add an image!!
            }
        }
        return cards
    }
}
