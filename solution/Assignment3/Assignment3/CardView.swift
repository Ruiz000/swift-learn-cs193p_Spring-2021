//
//  CardView.swift
//  Assignment3
//
//  Created by Ryan Peng on 2023/4/14.
//

import SwiftUI

struct CardView: View {
    let card : setGameModel.Card
    var body: some View {
        // card normal state
            ZStack{
                let cardShape = RoundedRectangle(cornerRadius: styleValue.cornerRadius)
                if card.isSet {
                    cardShape.foregroundColor(.white)
                    cardShape.strokeBorder(lineWidth: styleValue.lineWidth).foregroundColor(.gray).opacity(styleValue.opacity)
                    Text("SET!!!")
                } else {
                    
                    cardShape.fill().foregroundColor(.white)
                    cardShape.strokeBorder(lineWidth: styleValue.lineWidth)
                    if card.isChosen {
                        cardShape.strokeBorder(lineWidth: styleValue.isChoesenLineWidth).foregroundColor(.blue)
                    }
                    VStack {
                        ForEach(0..<card.shapeCount.value,id:\.self) { _ in
                            createSymbol(use: card)
                            
                        }
                    }
                    .padding()
                }
        }
    }
    
    @ViewBuilder
    private func createSymbol(use card: setGameModel.Card) -> some View{
        switch card.shape {
        case .oval:
            createSymbolView(of: card,shape: RoundedRectangle(cornerRadius: 50))
        case .squiggle:
            createSymbolView(of: card, shape: Squiggle())
        case .diamond:
            createSymbolView(of: card, shape: Diamond())
        }
    }
    
    @ViewBuilder
    private func createSymbolView<SymbolShape>(of card : setGameModel.Card, shape: SymbolShape) -> some View where SymbolShape : Shape {
        switch card.shading {
        case .open:
            shape.stroke(lineWidth: 5).foregroundColor(card.color.value)
                .aspectRatio(2/1, contentMode: .fit)
        case .solid:
            shape.fill().foregroundColor(card.color.value)
                .aspectRatio(2/1, contentMode: .fit)
        case .striped:
            StripeView(shape: shape, color: card.color.value).foregroundColor(card.color.value)
                .aspectRatio(2/1, contentMode: .fit)
            
        }
    }
    
    private struct styleValue {
        static let cornerRadius : CGFloat = 20
        static let opacity : CGFloat = 0.1
        
        static let lineWidth : CGFloat = 3
        static let isChoesenLineWidth : CGFloat = 4
    }
}

 // original code doesn't look good

//struct CardV : View{
//    let color : setGameModel.Card.CardColor
//    let shapeType : setGameModel.Card.Shape
//    let shading : setGameModel.Card.Shading
//    let ShapeCount : setGameModel.Card.Count
//
//    var body: some View {
//        var shape : AnyView
//        switch shapeType {
//        case .diamond:
//            shape = AnyView(Diamond().padding(.all).frame(maxWidth: 200,maxHeight: 200).foregroundColor(.white))
//            if shading == .striped {
//                switch color {
//                case .Red:
//                    shape = AnyView(shape.overlay(content: {
//                        StripeView(shape: Diamond(), color: .red)
//                    }))
//                case .Green:
//                    shape = AnyView(shape.overlay(content: {
//                        StripeView(shape: Diamond(), color: .green)
//                    }))
//                case .Purple:
//                    shape = AnyView(shape.overlay(content: {
//                        StripeView(shape: Diamond(), color: .purple)
//                    }))
//                }
//            } else if shading == .open {
//                switch color {
//                case .Red:
//                    shape = AnyView(shape.overlay(content: {
//                        Diamond().stroke(lineWidth: 5).foregroundColor(.red)
//                    }))
//                case .Green:
//                    shape = AnyView(shape.overlay(content: {
//                        Diamond().stroke(lineWidth: 5).foregroundColor(.green)
//                    }))
//                case .Purple:
//                    shape = AnyView(shape.overlay(content: {
//                        Diamond().stroke(lineWidth: 5).foregroundColor(.purple)
//                    }))
//                }
//            } else if shading == .solid {
//                switch color {
//                case .Red:
//                    shape = AnyView(shape.overlay(content: {
//                        Diamond().foregroundColor(.red)
//                    }))
//                case .Green:
//                    shape = AnyView(shape.overlay(content: {
//                        Diamond().foregroundColor(.red)
//                    }))
//                case .Purple:
//                    shape = AnyView(shape.overlay(content: {
//                        Diamond().foregroundColor(.red)
//                    }))
//                }
//            }
//        case .oval:
//            shape = AnyView(RoundedRectangle(cornerRadius: 50).padding(.all).frame(maxWidth: 200,maxHeight: 100).foregroundColor(.white))
//            if shading == .striped {
//                switch color {
//                case .Red:
//                    shape = AnyView(shape.overlay(content: {
//                        StripeView(shape: RoundedRectangle(cornerRadius: 50), color: .red)
//                    }))
//                case .Green:
//                    shape = AnyView(shape.overlay(content: {
//                        StripeView(shape: RoundedRectangle(cornerRadius: 50), color: .green)
//                    }))
//                case .Purple:
//                    shape = AnyView(shape.overlay(content: {
//                        StripeView(shape: RoundedRectangle(cornerRadius: 50), color: .purple)
//                    }))
//                }
//            } else if shading == .open {
//                switch color {
//                case .Red:
//                    shape = AnyView(shape.overlay(content: {
//                        RoundedRectangle(cornerRadius: 50).stroke(lineWidth: 5).foregroundColor(.red)
//                    }))
//                case .Green:
//                    shape = AnyView(shape.overlay(content: {
//                        RoundedRectangle(cornerRadius: 50).stroke(lineWidth: 5).foregroundColor(.green)
//                    }))
//                case .Purple:
//                    shape = AnyView(shape.overlay(content: {
//                        RoundedRectangle(cornerRadius: 50).stroke(lineWidth: 5).foregroundColor(.purple)
//                    }))
//                }
//            } else if shading == .solid {
//                switch color {
//                case .Red:
//                    shape = AnyView(shape.overlay(content: {
//                        RoundedRectangle(cornerRadius: 50).foregroundColor(.red)
//                    }))
//                case .Green:
//                    shape = AnyView(shape.overlay(content: {
//                        RoundedRectangle(cornerRadius: 50).foregroundColor(.red)
//                    }))
//                case .Purple:
//                    shape = AnyView(shape.overlay(content: {
//                        RoundedRectangle(cornerRadius: 50).foregroundColor(.red)
//                    }))
//                }
//            }
//        case .squiggle:
//            shape = AnyView(Squiggle().padding(.all).frame(maxWidth: 200,maxHeight: 200).foregroundColor(.white))
//            if shading == .striped {
//                switch color {
//                case .Red:
//                    shape = AnyView(shape.overlay(content: {
//                        StripeView(shape: Squiggle(), color: .red)
//                    }))
//                case .Green:
//                    shape = AnyView(shape.overlay(content: {
//                        StripeView(shape: Squiggle(), color: .green)
//                    }))
//                case .Purple:
//                    shape = AnyView(shape.overlay(content: {
//                        StripeView(shape: Squiggle(), color: .purple)
//                    }))
//                }
//            } else if shading == .open {
//                switch color {
//                case .Red:
//                    shape = AnyView(shape.overlay(content: {
//                        Squiggle().stroke(lineWidth: 5).foregroundColor(.red)
//                    }))
//                case .Green:
//                    shape = AnyView(shape.overlay(content: {
//                        Squiggle().stroke(lineWidth: 5).foregroundColor(.green)
//                    }))
//                case .Purple:
//                    shape = AnyView(shape.overlay(content: {
//                        Squiggle().stroke(lineWidth: 5).foregroundColor(.purple)
//                    }))
//                }
//            } else if shading == .solid {
//                switch color {
//                case .Red:
//                    shape = AnyView(shape.overlay(content: {
//                        Squiggle().foregroundColor(.red)
//                    }))
//                case .Green:
//                    shape = AnyView(shape.overlay(content: {
//                        Squiggle().foregroundColor(.red)
//                    }))
//                case .Purple:
//                    shape = AnyView(shape.overlay(content: {
//                        Squiggle().foregroundColor(.red)
//                    }))
//                }
//            }
//        }
//
//        switch ShapeCount {
//        case .one:
//            shape = AnyView(VStack{
//                shape
//            })
//        case .two:
//            shape = AnyView(VStack {
//                shape
//                shape
//            })
//        case .three:
//            shape = AnyView(VStack {
//                shape
//                shape
//                shape
//            })
//        }
//
//        return shape
//
//    }
//}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = setGameModel.Card(id: 1, color: .Red, shading: .open, shape: .oval, shapeCount: .three)
        CardView(card: card)
    }
}
