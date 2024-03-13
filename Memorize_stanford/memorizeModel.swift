//
//  memorizeModel.swift
//  Memorize_stanford
//
//  Created by Artur Campos on 12/03/24.
//

import Foundation

struct MemoryGame <CardContent> {
    var cards: Array<Card>
    
    func ChooseCard(card:Card){}
    
    struct Card{
        var IsFaceUp: Bool
        var IsMatched: Bool
        var Content: CardContent
        
    }
}
