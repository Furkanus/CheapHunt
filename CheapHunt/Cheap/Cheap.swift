//
//  Cheap.swift
//  Cheap
//
//  Created by Furkan Hanci on 7/19/21.
//

import WidgetKit
import SwiftUI
import Intents


struct WidgetModel : TimelineEntry {
    
    var date: Date
    var widgetData : [GameModel]
}


struct WidgetView : View {
    internal let data : WidgetModel
    
    var body: some View {
        VStack(spacing : 15) {
            Text("CheapHunt")
                .font(.system(size: 20))
           
            ForEach(data.widgetData , id: \.self) { game in
                VStack {
                    Text(game.title!)
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
            
            let update = Calendar.current.date(byAdding: .minute, value: 10  , to:  date)
            
            let timeline = Timeline(entries: [data], policy: .after(update!))
            
            completion(timeline)
        }
    }
}
