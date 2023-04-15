//
//  SetGameViewModel.swift
//  Assignment3
//
//  Created by Ryan Peng on 2023/4/13.
//

import Foundation

class SetGameViewModel : ObservableObject {
    
    // model init
    @Published private var model : setGameModel = setGameModel()
    
    
    var deskCards: Array<setGameModel.Card> {
        return model.onDesk
    }
    
    // newGame()
    
    // user behavior
    
    // MARK: - Intents
    
    // chose card
    func choose(card: setGameModel.Card) {
        model.choosen(of: card)
    }
    
    func newGame() {
        model = setGameModel()
    }
    
    func addThreeCards(){
        model.addThreeCards()
    }
}
