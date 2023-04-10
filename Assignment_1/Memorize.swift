//
//  Memorize.swift
//  Assignment_1
//
//  Created by Ryan Peng on 2023/4/10.
//

import Foundation

struct Memorize<CardType> where CardType : Equatable{
    
    private(set) var cards : Array<Card>
    private(set) var score : Int
    private var theIndexOfFirstCard : Int?
    
    mutating func choose(_ card: Card){
        if let cardIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[cardIndex].isFaceUp,
           !cards[cardIndex].isMatch
        {
            let chosenTime = Date()
            if let theIndexOfpossibleMatchCard = theIndexOfFirstCard {
                let usedTime = Int(chosenTime.timeIntervalSince(cards[theIndexOfpossibleMatchCard].chosenTime!))
                // mathed
                if cards[cardIndex].content == cards[theIndexOfpossibleMatchCard].content {
                    cards[cardIndex].isMatch = true
                    cards[theIndexOfpossibleMatchCard].isMatch = true
                    score += 2 * max(10 - usedTime, 1)
                } else if cards[cardIndex].hasbeen && cards[theIndexOfpossibleMatchCard].hasbeen && !cards[cardIndex].isMatch && !cards[theIndexOfpossibleMatchCard].isMatch {
                    score -= 1 * max(10 - usedTime, 1);
                }
                cards[cardIndex].hasbeen = true
                cards[theIndexOfpossibleMatchCard].hasbeen = true
                theIndexOfFirstCard = nil
            } else {
                for cindex in cards.indices {
                    cards[cindex].isFaceUp = false
                }
                cards[cardIndex].chosenTime = chosenTime
                theIndexOfFirstCard = cardIndex
            }
            cards[cardIndex].isFaceUp.toggle()
        }
    }
    
    init(pairsNum : Int, createCardContent: (Int) -> CardType){
        cards = Array<Card>()
        score = 0
        for index in 0..<pairsNum{
            let cardContent = createCardContent(index)
            cards.append(Card(content: cardContent, id: index * 2 ))
            cards.append(Card(content: cardContent, id: index * 2 + 1))
            cards.shuffle()
        }
    }
    
    struct Card : Identifiable {
        var content: CardType
        var chosenTime : Date?
        var isFaceUp : Bool = false
        var isMatch : Bool = false
        var hasbeen : Bool = false
        var id : Int
    }
    
}
