//
//  UserName.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 5/30/21.
//

import Foundation
import Combine
import UIKit

class UserName : ObservableObject {
    @Published var name : String {
        didSet {
            UserDefaults.standard.setValue(self.name, forKey: "UserName")
        }
    }
    
    init() {
        self.name = UserDefaults.standard.object(forKey: "UserName") as? String ?? ""
    }
    
    // I LEARNED ARC LIKE THIS DEINIT!
    
    /*
    deinit {
        print("The Class has been deinit!")
    }
 
 */
}

// UserName store has been saved
