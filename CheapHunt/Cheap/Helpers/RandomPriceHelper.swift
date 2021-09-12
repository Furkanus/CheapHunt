//
//  RandomPriceHelper.swift
//  CheapExtension
//
//  Created by Furkan Hanci on 9/12/21.
//

import Foundation


class RandomPriceHelper {
    lazy var randomPrice = Int.random(in: 5...30)
    
     func getRandomPrice() -> Int {
        return randomPrice
    }
    
    deinit {
        print("The class hes been deinit")
    }
}
