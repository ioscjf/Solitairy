//
//  CardView.swift
//  Solitairy
//
//  Created by Connor Fitzpatrick on 5/21/21.
//

import SwiftUI

struct CardView: View {
    @Binding var width: CGFloat

    var body: some View {
        Button(action: {
            // tbd
        }, label: {
            Text("2 D")
            
        })
        .frame(width: width, height: width * 1.714) // 2.5 + 3.5 = 0.714
        .background(Color.white)
        .border(Color.black)
        .cornerRadius(10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(width: .constant(30.0))
    }
}
