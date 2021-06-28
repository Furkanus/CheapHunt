//
//  Deal.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 5/31/21.
//

import Foundation

struct Deal: Codable , Identifiable , Hashable {
    let id = UUID()
    var title: String?
    var salePrice: String?
    var normalPrice: String?
    var thumb: String?
    var dealRating : String?
    
}
