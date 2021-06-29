//
//  GetData.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 5/31/21.
//

import SwiftUI
import CoreData
class GetData : ObservableObject  , DataService , CoreDataService {
   
    @Published private var deals : [Deal] = []
    
//    func saveData(with context: NSManagedObjectContext) {
//        deals.forEach { data in
//            // save entities to CoreData
//            let entity = Infos(context: context)
//            entity.dealRating = data.dealRating
//            entity.normalPrice = data.normalPrice
//            entity.salePrice = data.salePrice
//            entity.title = data.title
//        }
//    }
    
    private var second : Int = 0
    internal func getData(price: Int?,completion: @escaping ([Deal]) -> Void) {
        guard let url = URL(string: "https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=\(price ?? 20)")  else {
            return }
        
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { data, response, error in
            
            
           let resp = response as! HTTPURLResponse
            
            switch resp.statusCode == 404 {
            case .BooleanLiteralType(true):
                print("error get data from api!")
                
            case .BooleanLiteralType(false):
                print("passed from api")
                
            default:
                break;
            
            }
            
            let datas = try! JSONDecoder().decode([Deal].self, from: data!)
            //print(datas)
            DispatchQueue.main.asyncAfter(deadline: .now()) {

                var  timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { tim in

                    self.second += 1

                  if self.second == 3 {
                        tim.invalidate()
                        session.invalidateAndCancel()
                        print("done")
                   }
                session.invalidateAndCancel()
                 completion(datas)
                    print("Loaded!")
                }
                

                
            
            }
       
            
        }
        .resume()
        
    }
    

}
