//
//  HeaderView.swift
//  MemorizeGame
//
//  Created by Indy McGinnis on 8/31/22.
//

import SwiftUI

struct HeaderView: View {
    @Binding var game: MemoryGame
    
    var body: some View {
        HStack {
            Button {
                game.newGame()
                print("new game")
                
            } label: {
                Image(systemName: "arrow.counterclockwise")
                    .font(.title2)
                    .foregroundColor(Color("AccentColor"))
                    .padding()
            }


            Spacer()
            
            Text(game.chosenTheme.name)
                .bold()
                .foregroundColor(Color(game.chosenTheme.color))
                .font(.title)
                .kerning(0.5)
            
            Spacer()
           
            Button {
                game.changeChosenTheme()
            } label: {
                Image(systemName: "wand.and.stars")
                    .font(.title)
                    .foregroundColor(Color("AccentColor"))
                    .padding()
            }


        }
    }
}

