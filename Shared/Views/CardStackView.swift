//
//  CardStackView.swift
//  Solitairy
//
//  Created by Connor Fitzpatrick on 6/7/21.
//

import SwiftUI

struct CardStackView: View {
    @Binding var width: CGFloat
    @Binding var cards: [CardView]
    
    var body: some View {
        ZStack {
            ForEach(0..<cards.count) { i in
                ZStack(alignment: .top) {
                    cards[i]
                }
                .offset(y: CGFloat(i) * 15)
            }
        }
    }
}

struct CardStackView_Previews: PreviewProvider {
    static var previews: some View {
        let array: [CardView] = [CardView(width: .constant(CGFloat(30.0))), CardView(width: .constant(CGFloat(30.0)))]
        CardStackView(width: .constant(CGFloat(30.0)), cards: .constant(array))
    }
}
