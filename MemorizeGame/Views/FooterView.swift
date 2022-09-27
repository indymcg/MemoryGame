//
//  FooterView.swift
//  MemorizeGame
//
//  Created by Indy McGinnis on 9/27/22.
//

import SwiftUI

struct FooterView: View {
    let score: Int
    let turns: Int
    
    var body: some View {
        HStack {
            HStack {
                Text("Score:")
                    .font(.title2)
                    .fontWeight(.bold)
                Text(String(score))
                    .font(.title2)
            }
            .padding(.leading, 20)
            
            Spacer()
            HStack {
                Text("Turns: ")
                    .font(.title2)
                    .fontWeight(.bold)
                Text(String(turns))
                    .font(.title2)
            }
            .padding(.trailing, 20)
        }
        .foregroundColor(Color("AccentColor"))
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView(score: 100, turns: 2)
    }
}
