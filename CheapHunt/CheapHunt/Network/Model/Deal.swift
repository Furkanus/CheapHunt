//
//  Deal.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 5/31/21.
//

import Foundation

struct Deal: Codable , Identifiable {
    let id = UUID()
    var title: String?
    var metacriticLink: String?
    var dealID: String?
    var storeID: String?
    var gameID: String?
    var salePrice: String?
    var normalPrice: String?
    var steamRatingPercent: String?
    var steamAppID: String?
    var releaseDate: Int?
    var lastChange: Int?
    var thumb: String?
    var dealRating : String?
    
}
