//
//  StripeView.swift
//  Assignment3
//
//  Created by Ryan Peng on 2023/4/15.
//

import SwiftUI

struct StripeView<SimpleView>: View where SimpleView : Shape {
    let number : Int = 8
    let border : CGFloat = 1.3
    
    let shape : SimpleView
    let color : Color
    let spcaingColor = Color.white
    
    
    var body: some View {
        VStack(spacing: 0.5){
            ForEach(0..<number) { _ in
                spcaingColor
                color
            }
            spcaingColor
        }
        .mask(shape)
        .overlay(shape.stroke(color, lineWidth: border))
    }
}

struct StripeView_Previews: PreviewProvider {
    static var previews: some View {
        StripeView(shape: Diamond(), color: .red)
    }
}
