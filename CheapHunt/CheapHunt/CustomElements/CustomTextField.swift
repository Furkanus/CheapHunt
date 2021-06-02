//
//  CustomTextField.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 5/30/21.
//

import SwiftUI

struct OvalTextField : TextFieldStyle {

    func _body(configuration : TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(Color.bg3)
            .cornerRadius(15)
            .shadow(color: .gray, radius: 15)
    }
    
    
}
