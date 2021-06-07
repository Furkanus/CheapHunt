//
//  DataServiceProtocol.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 6/6/21.
//

import Foundation


protocol DataService {
    
    func getData(price:Int?,completion : @escaping ([Deal]) -> Void)
    
}
