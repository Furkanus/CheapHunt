//
//  CustomButton.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 5/30/21.
//

import SwiftUI


struct OvalButton : ButtonStyle {
     
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding()
            .background(Color.bg4)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }

}
