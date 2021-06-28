//
//  UserLoggedIn.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 5/30/21.
//

import Foundation
import Combine

class FirstLaunch : ObservableObject {
    @Published var launch : Int {
        didSet {
            UserDefaults.standard.setValue(self.launch, forKey: "Launched")
        }
    }
    
    init() {
        self.launch = UserDefaults.standard.object(forKey: "Launched") as? Int ?? 0
    }
}

// User Logged in has been saved 
