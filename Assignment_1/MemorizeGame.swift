//
//  MemorizeGame.swift
//  Assignment_1
//
//  Created by Ryan Peng on 2023/4/10.
//

import SwiftUI

class MemorizeGame : ObservableObject {
    
    private var theme : Theme
    @Published private var model : Memorize<String>
    
    init() {
        theme = MemorizeGame.createTheme()
        model = MemorizeGame.createMemorizeGame(of: theme)
    }
    
    private static func createTheme() -> Theme {
            Theme()
    }

    private static func createMemorizeGame(of theme: Theme) -> Memorize<String> {
        Memorize<String>(pairsNum: theme.cardsCount,createCardContent: { pairIndex in
            theme.emojis[pairIndex]
        })
    }
    
    var cards: Array<Memorize<String>.Card> {
        return model.cards
    }
    
    var color: Color {
        let color = theme.color
        switch color{
        case "red":
            return .red
        case "blue":
            return .blue
        case "green":
            return .green
        case "gray":
            return .gray
        case "purple":
            return .purple
        case "yellow":
            return .yellow
        default:
            return .red
        }
    }
    
    var score: Int {
        return model.score
    }
    // MARK: -Intent(s)
    func choose(_ card: Memorize<String>.Card) {
        model.choose(card)
    }
    
    func startNeGame() {
        theme = MemorizeGame.createTheme()
        model = MemorizeGame.createMemorizeGame(of: theme)
    }
    
}
