//
//  Diamond.swift
//  Assignment3
//
//  Created by Ryan Peng on 2023/4/13.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        let startPoint = CGPoint(x: rect.midX, y: rect.minY)
        
        p.move(to: startPoint)
        p.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        p.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        p.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        p.addLine(to: startPoint)
        return p
    }
}

//struct Diamond_Previews: PreviewProvider {
//    static var previews: some View {
//        Diamond()
//    }
//}
