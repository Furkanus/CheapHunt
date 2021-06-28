//
//  Constants.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 6/28/21.
//

import SwiftUI


struct Constants {
    struct Network {
        static let baseUrl = "https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=15"

    }
    
    struct Style {
        enum Image {
            static let heart = "heart.circle.fill"
            static let gear = "gear"            
        }
    }
    
    struct Texts {
        static let welcome = "Welcome"
        static let appName = "CheapHunt"
        static let enterName = "Enter Your Name Here"
        static let newJourney = "A new journey is begin!"
        static let enterAmount = "Enter Your Amount Here!"
        static let fetch = "Get Games"
        static let underDollar = "Your amount Cannot be empty or under 1 dollars!"
        static let again = "Enter Again"
        static let loading = "Loading"
    }
    
    enum Error {
        static let ok = "OK"
        static let oops = "Oops"
        static let genericError = "Generic Error"
        static let decodingError = "Decoding Error"
        static let noResultsFound = "No results found"
        static let cannotEmpty = "Your Name Cannot be empty!"
        static let checkConnection = "Please check your internet connection!"
        static let enterYourName = "Enter your name!"
    }
    
}
