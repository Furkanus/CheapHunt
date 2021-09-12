//
//  Cheap.swift
//  Cheap
//
//  Created by Furkan Hanci on 7/19/21.
//

import WidgetKit
import SwiftUI



struct WidgetModel : TimelineEntry {
    
    var date: Date
    var widgetData : [GameModel]
    
}


struct WidgetView : View {
    internal let data : WidgetModel
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.bg1 , Color.bg2]), startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
            ZStack {
                Text("Some of Games Today!")
                    .font(.body)
                    .foregroundColor(.blue)
                VStack(spacing : 17) {
                    ForEach(data.widgetData , id: \.self) { game in
                        VStack {
                            HStack {
                                
                                Text(game.title!)
                                    .font(.system(size: 17))
                                    .fontWeight(.light)
                                
                                
                                Text("Price \(game.salePrice!)")
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                
                                Spacer()
                                
                                
                            }
                            
                        }
                    }
                    
                    
                }
            }
        }
        
    }
    
}

struct Provider : TimelineProvider {
    private let randomPrice = RandomPriceHelper()
    func placeholder(in context: Context) -> WidgetModel {
        let loadingData = WidgetModel(date: Date(), widgetData: Array(repeating: GameModel(title: "", salePrice: "", normalPrice: "", thumb: "", dealRating: ""), count: 6))
        return loadingData
    }
    
    
    func getSnapshot(in context: Context, completion: @escaping (WidgetModel) -> Void) {
        let loadingData = WidgetModel(date: Date(), widgetData: Array(repeating: GameModel(title: "", salePrice: "", normalPrice: "", thumb: "", dealRating: ""), count: 6))
        
        completion(loadingData)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WidgetModel>) -> Void) {
        GetWidgetData.shared.getWidgetData(price: randomPrice.getRandomPrice() ) { (modelData) in
            let date = Date()
            let data = WidgetModel(date: date, widgetData: modelData)
            
            // Update widget datas 10 minutes.
            let update = Calendar.current.date(byAdding: .minute, value: 10  , to:  date)
            
            let timeline = Timeline(entries: [data], policy: .after(update!))
            
            completion(timeline)
            
        }
    }
}
