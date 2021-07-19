//
//  MainWidget.swift
//  CheapExtension
//
//  Created by Furkan Hanci on 7/19/21.
//

import WidgetKit
import SwiftUI

@main
struct MainWidget : Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "Cheap", provider: Provider()) { data in
            WidgetView(data: data)
        }
        
        .description(Text("Cheap Hunt"))
        .configurationDisplayName(Text("Cheap Hunt"))
        .supportedFamilies([.systemLarge , .systemMedium])
    }
}
