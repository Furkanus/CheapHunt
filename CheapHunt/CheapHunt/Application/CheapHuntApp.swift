//
//  CheapHuntApp.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 5/29/21.
//

import SwiftUI

@main
struct CheapHuntApp: App {
    @StateObject private var logged = FirstLaunch()
    var body: some Scene {
        WindowGroup {
            if self.logged.launch == 0 {
                ContentView()
                    
            } else {
                MainView()
            }
            
        }
    }
}
