//
//  Assignment3App.swift
//  Assignment3
//
//  Created by Ryan Peng on 2023/4/13.
//

import SwiftUI

@main
struct Assignment3App: App {
    let vModel : SetGameViewModel = SetGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: vModel)
        }
    }
}
