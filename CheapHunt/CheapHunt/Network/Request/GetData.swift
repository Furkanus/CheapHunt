//
//  GetData.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 5/31/21.
//


import SwiftUI

class GetData : ObservableObject  , DataService {
    @Published private var deals : [Deal] = []
    private var second : Int = 0
    internal func getData(price: Int?,completion: @escaping ([Deal]) -> Void) {
        guard let url = URL(string: "https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=\(price ?? 20)")  else {
            print(AppError.custom(description: "Error when get data from api"))
            return }
        
        
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            
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
