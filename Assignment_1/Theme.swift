//
//  Theme.swift
//  Assignment_1
//
//  Created by Ryan Peng on 2023/4/10.
//

import Foundation

struct Theme {
    
    var name : String
    var color : String
    var emojis: Array<String>
    var cardsCount : Int
    
    enum cardThemes : String,CaseIterable {
         case vehicle
         case food
         case animals
         case sports
         case flags
         case jobs
    }
    
    enum cardColors : String,CaseIterable {
        case red
        case blue
        case green
        case gray
        case purple
        case yellow
    }
    
    init() {
        let randomIndex = Int.random(in: 0..<cardThemes.allCases.count)
        let theme = cardThemes.allCases[randomIndex]
        let color = cardColors.allCases[randomIndex]
        
        self.name = theme.rawValue
        self.color = color.rawValue
        
        
        switch theme {
        case .vehicle:
            self.emojis = ["🚁","🚗","⛴️","🚂","🚀","🏍️","🚲","🚌","🚆","🛸","🛴","✈️","🚤","🚖","🛵","🛺","🏎️","🛻"].shuffled()
        case .food:
            self.emojis = ["🌭","🌮","🌯","🥐","🍕","🍔","🥘","🍛","🥙","🍜","🥞","🍟","🥯","🍙","🧇","🥘","🍘","🍱"].shuffled()
        case .animals:
            self.emojis = ["🐈‍⬛","🦈","🦓","🐇","🐒","🦏"].shuffled()
        case .sports:
            self.emojis = ["🥎","🥏","🏀","🏈","⚽️","⚾️","🎾","🏐"].shuffled()
        case .flags:
            self.emojis = ["🇿🇦","🇫🇮","🇯🇵","🇻🇳","🇳🇱","🇻🇬","🇧🇷","🇧🇶"].shuffled()
        case .jobs:
            self.emojis = ["👩‍🔧","👩‍🌾","👨‍💻","👨‍🚀","🧑‍🚒","👨‍🎨","👨‍🍳","👩‍🚒"].shuffled()
        }
        self.cardsCount = self.emojis.count >= 10 ? 10 :  self.emojis.count
        
    }
}
