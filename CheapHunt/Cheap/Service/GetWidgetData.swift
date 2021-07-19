//
//  GetWidgetData.swift
//  CheapExtension
//
//  Created by Furkan Hanci on 7/19/21.
//

import Foundation


final class GetWidgetData : WidgetServiceProtocol {
   
    
    static let shared = GetWidgetData()
    
    private init() { }
    
    
    func getWidgetData(completion: @escaping ([GameModel]) -> Void) {
        guard let url = URL(string: "https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=20") else {
            return
        }
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { data, _, err in
            if err != nil {
                print(err?.localizedDescription as Any)
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode([GameModel].self, from: data!)
                
                completion(jsonData)
            } catch {
                print(err?.localizedDescription as Any)
            }
        }.resume()
    }
}
