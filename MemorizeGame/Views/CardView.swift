//
//  CardView.swift
//  MemorizeGame
//
//  Created by Indy McGinnis on 8/30/22.
//

import SwiftUI


struct CardBack: View {
    let color: String
    let opacity: Double
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 10)
            .fill(Color(color))
        }
        .opacity(opacity)
    }
}

struct CardFront: View {
    let emoji: String
    let color: String
    let opacity: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color(color), lineWidth: 4)
                .background(.white).cornerRadius(10)
                Text(emoji)
                    .font(.system(size: 50))
            }
            .opacity(opacity)
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CardFront(emoji: "🦇", color: "HalloweenColor", opacity: 1)
                .padding(20)
        }
    }
}
