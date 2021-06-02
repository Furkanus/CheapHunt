//
//  UserName.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 5/30/21.
//

import Foundation
import Combine

class UserName : ObservableObject {
    @Published var name : String {
        didSet {
            UserDefaults.standard.setValue(self.name, forKey: "UserName")
        }
    }
    
    init() {
        self.name = UserDefaults.standard.object(forKey: "UserName") as? String ?? ""
    }
}

// UserName store has been saved
