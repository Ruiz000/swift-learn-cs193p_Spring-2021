//
//  Assignment_1App.swift
//  Assignment_1
//
//  Created by Ryan Peng on 2023/4/6.
//

import SwiftUI

@main
struct Assignment_1App: App {
    var viewmodel : MemorizeGame = MemorizeGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(vm : viewmodel)
        }
    }
}
