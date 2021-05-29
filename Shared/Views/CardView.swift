//
//  CardView.swift
//  Solitairy
//
//  Created by Connor Fitzpatrick on 5/21/21.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        Color.white
            .overlay(
                Text("2 D")
            )
            .aspectRatio(0.714, contentMode: .fit) // 2.5 + 3.5 = 0.714
            .clipped()
            .cornerRadius(10)
            .frame(width: 30)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
