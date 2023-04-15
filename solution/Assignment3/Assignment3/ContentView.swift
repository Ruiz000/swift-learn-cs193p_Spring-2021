//
//  ContentView.swift
//  Assignment3
//
//  Created by Ryan Peng on 2023/4/13.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var viewModel : SetGameViewModel
    
    var body: some View {
        VStack{
            VStack{
                AspectVGrid(items: viewModel.deskCards, aspectRatio: 2/3) { card in
                    CardView(card: card)
                        .padding(2)
                        .onTapGesture {
                            viewModel.choose(card: card)
                        }
                }
            }
            HStack{
                Button(action: {
                    viewModel.addThreeCards()
                }, label: {
                    Text("Add 3 new Cards")
                }).disabled(viewModel.deskCards.count == 81)
                Spacer()
                Button(action: {
                    viewModel.newGame()
                } , label: {
                    Text("New Game")
                })
            }.padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = SetGameViewModel()
        ContentView(viewModel: vm)
        ContentView(viewModel: vm)
            .preferredColorScheme(.dark)
    }
}
