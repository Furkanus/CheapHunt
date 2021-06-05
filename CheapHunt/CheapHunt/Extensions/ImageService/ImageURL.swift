//
//  ImageURL.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 6/5/21.
//

import SwiftUI

extension Image {
    func getData(url : URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        
        return self
            .resizable()
    }
}
