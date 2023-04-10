//
//  ContentView.swift
//  Assignment_1
//
//  Created by Ryan Peng on 2023/4/6.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm : MemorizeGame
//    @State var emojis = ["🚁","🚗","⛴️","🚂","🚀","🏍️","🚲","🚌","🚆","🛸","🛴","✈️","🚤","🚖","🛵","🛺","🏎️","🛻"]
//    @State var emojiCount = Int.random(in: 0...4)
    var body: some View {
        VStack{
            Text("Your score:\t" + String(vm.score)).font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]){
                    ForEach(vm.cards) {
                        card in CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                            vm.choose(card)
                        }
                    }
                }
            }.foregroundColor(vm.color)
            Spacer()
            HStack{
//                remove
//                Spacer()
//                vehicls
//                Spacer()
//                foods
//                Spacer()
//                animals
//                Spacer()
//                add
                Button("Start New Game😃", action: {
                    vm.startNeGame()
                })
            }
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
//    var remove: some View {
//        Button(action: {
//            if emojiCount > 1 {
//                emojiCount -= 1
//            }
//        }, label: {
//            Image(systemName: "minus.circle")
//        })
//    }
//    var add: some View {
//        Button(action: {
//            if emojiCount < emojis.count {
//                emojiCount += 1
//            }
//        }, label: {
//            Image(systemName: "plus.circle")
//        })
//    }
//    var vehicls : some View {
//        Button(action: {
//            emojis = ["🚁","🚗","⛴️","🚂","🚀","🏍️","🚲","🚌","🚆","🛸","🛴","✈️","🚤","🚖","🛵","🛺","🏎️","🛻"].shuffled()
//            emojiCount = Int.random(in: 0...4)
//        },label:{
//            Image(systemName: "car.circle")
//        })
//    }
//    var foods : some View {
//        Button(action: {
//            emojis =
//            ["🍔","🍟","🫓","🥪","🌮","🥙","🧆","🥘"].shuffled()
//            emojiCount = Int.random(in: 0...4)
//        },label:{
//            Image(systemName: "fork.knife.circle")
//        })
//    }
//    var animals : some View {
//        Button(action: {
//            emojis =
//            ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼"].shuffled()
//            emojiCount = Int.random(in: 0...4)
//        },label:{
//            Image(systemName: "pawprint.circle")
//        })
//    }
}

struct CardView: View {
    var card : Memorize<String>.Card
//    var content : String
//    @State var isFaceUp : Bool = true
    let shape = RoundedRectangle(cornerRadius: 20)
    var body: some View {
        ZStack{
            if card.isFaceUp {
                shape.foregroundColor(.white)
                shape.strokeBorder()
                Text(card.content)
            } else if card.isMatch{
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}





struct CletentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewmodel : MemorizeGame = MemorizeGame()
        ContentView(vm: viewmodel)
        ContentView(vm: viewmodel)
            .preferredColorScheme(.dark)
    }
}
