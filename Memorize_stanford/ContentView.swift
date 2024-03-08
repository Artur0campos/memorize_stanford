//
//  ContentView.swift
//  memorize
//
//  Created by Artur Campos on 24/02/24.
//

import SwiftUI

struct ContentView: View {
    let mascotes: Array<String> = ["🐔","🦊","🐳","🐷","🦁", "🐶", "🎅🏻", "🦸🏻‍♂️",  "🐮", "🐲"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack{
            ScrollView{cards}
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cardCountAdjusters: some View{
        HStack{
            cardAdd
            Spacer()
            cardRemover
        }.imageScale(.large).font(.title)
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(),GridItem(),]){
            ForEach(0..<cardCount, id: \.self) {index in
                CardView(content: mascotes[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }.foregroundColor(.green)
        }
    }

    
    func cardCountadjuster(by offset: Int, symbol: String) -> some View{
        Button(action:{
            cardCount += offset
        }, label: {
            Image(systemName:symbol)
        }).disabled(cardCount + offset < 1 || cardCount + offset > mascotes.count )
    }
    
    var cardAdd: some View{
        cardCountadjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var cardRemover: some View{
        cardCountadjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
struct CardView: View {
    let content: String
    @State var IsFaceUp = true
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
