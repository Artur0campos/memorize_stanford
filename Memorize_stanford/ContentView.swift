//
//  ContentView.swift
//  memorize
//
//  Created by Artur Campos on 24/02/24.
//

import SwiftUI

struct ContentView: View {
    let mascotes: Array<String> = ["🐔","🦊","🐳","🐷","🦁", "🐶", "🎅🏻", "🦸🏻‍♂️",  "🐮", "🐲"]
    
    var body: some View {
        ScrollView{cards}
        
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(),GridItem(),]){
            ForEach(mascotes.indices, id: \.self) {index in
                CardView(content: mascotes[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }.foregroundColor(.purple)
        }
    }
struct CardView: View {
    let content: String
    @State var IsFaceUp = false
    var body: some View {
        ZStack{
            let card = RoundedRectangle(cornerRadius: 10)
            Group{
                card.foregroundColor(.white)
                card.stroke(lineWidth: 7)
                Text(content).font(.largeTitle)
                }
            .opacity(IsFaceUp ? 0:1)
            card.fill().opacity(IsFaceUp ? 1:0)
            
            
        }.onTapGesture {
            IsFaceUp.toggle()
            // pode ser escrito dessa outra forma: IsFaceUp =  !IsFaceUp
        }
     }
  }
}

#Preview {
    ContentView()
}
