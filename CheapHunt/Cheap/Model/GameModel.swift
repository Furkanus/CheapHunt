//
//  GameModel.swift
//  CheapExtension
//
//  Created by Furkan Hanci on 7/19/21.
//

import Foundation

struct GameModel : Codable , Identifiable , Hashable {
    let id = UUID()
    var title: String?
    var salePrice: String?
    var normalPrice: String?
    var thumb: String?
    var dealRating : String?
}
