//
//  GetData.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 5/31/21.
//

import Foundation
import Combine
import SwiftUI

protocol DataService {
    func getData(price:Int?,completion : @escaping ([Deal]) -> Void)
}

class GetData : ObservableObject , DataService {
    @Published var deals : [Deal] = []
    
    func getData(price: Int?,completion: @escaping ([Deal]) -> Void) {
        guard let url = URL(string: "https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=\(price ?? 20)")  else {
            AppError.custom(description: "ERROR AQ")
            return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            let datas = try! JSONDecoder().decode([Deal].self, from: data!)
            //print(datas)
            DispatchQueue.main.async {
                completion(datas)
                print("Loaded!")
            }
        }
        .resume()
    }
    
}
