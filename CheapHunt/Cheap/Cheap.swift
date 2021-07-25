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
                VStack(spacing : 17) {
                    ForEach(data.widgetData , id: \.self) { game in
                        VStack {
                            HStack {
                                
                                Text(game.title!)
                                    .font(.system(size: 17))
                                
                                
                                Text("Price \(game.salePrice!)")
                                    .font(.system(size: 15))
                                
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
    func placeholder(in context: Context) -> WidgetModel {
        let loadingData = WidgetModel(date: Date(), widgetData: Array(repeating: GameModel(title: "", salePrice: "", normalPrice: "", thumb: "", dealRating: ""), count: 6))
        return loadingData
    }
    
    
    func getSnapshot(in context: Context, completion: @escaping (WidgetModel) -> Void) {
        let loadingData = WidgetModel(date: Date(), widgetData: Array(repeating: GameModel(title: "", salePrice: "", normalPrice: "", thumb: "", dealRating: ""), count: 6))
        
        completion(loadingData)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WidgetModel>) -> Void) {
        GetWidgetData.shared.getWidgetData { (modelData) in
            let date = Date()
            let data = WidgetModel(date: date, widgetData: modelData)
            
            let update = Calendar.current.date(byAdding: .minute, value: 15  , to:  date)
            
            let timeline = Timeline(entries: [data], policy: .after(update!))
            
            completion(timeline)
        }
    }
}
