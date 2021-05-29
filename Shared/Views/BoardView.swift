//
//  BoardView.swift
//  Solitairy
//
//  Created by Connor Fitzpatrick on 5/21/21.
//

import SwiftUI

struct BoardView: View {
    var body: some View {
        
        // https://stackoverflow.com/questions/56505043/how-to-make-view-the-size-of-another-view-in-swiftui/56661706#56661706
        // Use this in place  of static size
        
        VStack {
            HStack {
                HStack {
                    CardView()
                    CardView()
                    CardView()
                    CardView()
                }
                .padding([.top, .trailing])
                HStack {
                    CardView()
                    CardView()
                }
                .padding([.top, .leading])
            }
            .padding(.top)
            HStack {
                CardView()
                CardView()
                CardView()
                CardView()
                CardView()
                CardView()
                CardView()
            }
            .padding()
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.green)
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
