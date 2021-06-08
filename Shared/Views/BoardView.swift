//
//  BoardView.swift
//  Solitairy
//
//  Created by Connor Fitzpatrick on 5/21/21.
//

import SwiftUI

struct BoardView: View {
    var body: some View {
        GeometryReader { geometry in
            let width: CGFloat = geometry.size.width / 10
            VStack {
                HStack {
                    HStack {
                        CardView(width: .constant(width))
                        CardView(width: .constant(width))
                        CardView(width: .constant(width))
                        CardView(width: .constant(width))

                    }
                    .padding()
                    HStack {
                        CardView(width: .constant(width))
                        CardView(width: .constant(width))
                    }
                    .padding()
                }
                .padding(.top)
                HStack {
                    let array: [CardView] = [CardView(width: .constant(CGFloat(30.0))), CardView(width: .constant(CGFloat(30.0)))]
                    let array1: [CardView] = [CardView(width: .constant(CGFloat(30.0))), CardView(width: .constant(CGFloat(30.0))), CardView(width: .constant(CGFloat(30.0))), CardView(width: .constant(CGFloat(30.0)))]
                    let array2: [CardView] = [CardView(width: .constant(CGFloat(30.0)))]
                    CardStackView(width: .constant(width), cards: .constant(array))
                    CardStackView(width: .constant(width), cards: .constant(array1))
                    CardStackView(width: .constant(width), cards: .constant(array2))
                    CardStackView(width: .constant(width), cards: .constant(array))
                    CardStackView(width: .constant(width), cards: .constant(array2))
                    CardStackView(width: .constant(width), cards: .constant(array1))
                    CardStackView(width: .constant(width), cards: .constant(array))
                }
                .padding()
            }
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color.green)
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
