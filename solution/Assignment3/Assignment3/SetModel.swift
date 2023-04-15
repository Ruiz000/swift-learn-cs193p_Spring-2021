//
//  SetModel.swift
//  Assignment3
//
//  Created by Ryan Peng on 2023/4/13.
//

import Foundation
import SwiftUI

struct setGameModel {
   private var cards: [Card]
   private(set) var selectedCards: [Card] = []
   private(set) var onDesk: [Card]
    
    init() {
        cards = setGameModel.createCards()
        // init 12 cards
        onDesk = []
        onDesk = createDesk(cards)
    }
    
    static private func createCards() -> [Card]{
        var index = 0
        var cards: [Card] = []
        
        for shape in Card.Shape.allCases {
            for shading in Card.Shading.allCases {
                for color in Card.CardColor.allCases {
                    for count in Card.Count.allCases {
                        let card = Card(id: index, color: color, shading: shading, shape: shape, shapeCount: count)
                        index += 1
                        cards.append(card)
                    }
                }
            }
        }
        return cards.shuffled()
    }
    
     mutating private func createDesk(_ cards : [Card]) -> [Card] {
        var array : [Card] = []
        for card in 0..<12 {
            self.cards[card].isonDesk = true
            array.append(self.cards[card])
        }
         return array
    }
    
    mutating func choosen(of card: Card) {
        
        if !card.isChosen && !card.isSet {
            // add to the selected
            selectedCards.append(card)
            if let index = onDesk.firstIndex(where: { $0.id == card.id }){
                onDesk[index].isChosen = true
            }

            // start compare
            if selectedCards.count == 3 {
                print("selectedCards has 3 cards")
                if compareCards() {
                    print("yes, these 3 cards are set")
                    for index in 0..<3 {
                        let selectedCard = selectedCards[index]
                        if let cardIndex = onDesk.firstIndex(where: { $0.id == selectedCard.id }){
                            onDesk[cardIndex].isSet = true
                            
                        }
                    }
                    selectedCards = []
                    // add three new card to replace the set Card
                    addThreeCards()
                }
            }
        }
        //if chosen card is selected player can cancal touched(only 1 or 2) or card.isSet is true nothing happend
        else if card.isChosen && !card.isSet {
            if let index = onDesk.firstIndex(where: { $0.id == card.id}) {
                onDesk[index].isChosen = false
                selectedCards = selectedCards.filter({$0.id != card.id})
            }
        }
    }
    
    // add 3 new cards
    mutating func addThreeCards() {
        var Time = 0
        for card in cards.indices {
            if Time == 3 { break }
            if !cards[card].isonDesk {
                cards[card].isonDesk = true
                onDesk.append(cards[card])
                Time += 1
            }
        }
    }
    
    func compareCards() -> Bool {
        guard selectedCards.count == 3 else { return false }
            let color1 = selectedCards[0].color
            let color2 = selectedCards[1].color
            let color3 = selectedCards[2].color
            if !(color1 == color2 && color2 == color3 || color1 != color2 && color2 != color3 && color1 != color3) {
                return false
            }
            
            let shape1 = selectedCards[0].shape
            let shape2 = selectedCards[1].shape
            let shape3 = selectedCards[2].shape
            if !(shape1 == shape2 && shape2 == shape3 || shape1 != shape2 && shape2 != shape3 && shape1 != shape3) {
                return false
            }
            
            let shading1 = selectedCards[0].shading
            let shading2 = selectedCards[1].shading
            let shading3 = selectedCards[2].shading
            if !(shading1 == shading2 && shading2 == shading3 || shading1 != shading2 && shading2 != shading3 && shading1 != shading3) {
                return false
            }
            
            let count1 = selectedCards[0].shapeCount
            let count2 = selectedCards[1].shapeCount
            let count3 = selectedCards[2].shapeCount
            if !(count1 == count2 && count2 == count3 || count1 != count2 && count2 != count3 && count1 != count3) {
                return false
            }
            return true
    }
    
    struct Card: Identifiable{
            var id  : Int
            let color : CardColor // 3 colors
            let shading : Shading // 3 shading
            let shape : Shape // 3 shape
            let shapeCount : Count  // 3 nums
            var isChosen: Bool = false
            var isonDesk : Bool = false
            var isSet : Bool = false 
            
            enum Shape : String, CaseIterable {
                case diamond, oval, squiggle
            }
            
            enum Shading : String, CaseIterable {
                case solid, striped, open
            }
            
            enum Count : CaseIterable{
                case one, two, three
                
                var value: Int {
                    switch self {
                    case .one: return 1
                    case .two: return 2
                    case .three: return 3
                    }
                }
            }
            
            enum CardColor : CaseIterable {
                case Red,Green,Purple
                
                var value: Color {
                    switch self {
                    case .Red: return .red
                    case .Green: return .green
                    case .Purple: return .purple
                    }
                }
            }

        
    }
}
