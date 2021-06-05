//
//  GameDetailView.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 6/5/21.
//

import SwiftUI

struct GameDetailView: View {
    internal let games : Deal!
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.bg1 , Color.bg2 , Color.bg4 , Color.bg3]), startPoint: .bottomLeading, endPoint: .topTrailing)
                .edgesIgnoringSafeArea(.all)
        ZStack {
            VStack {
                
                Form {
                    Section(header: Text("Game Infos").font(.system(size: 20)).foregroundColor(.white)) {
                        Text("Name: \(games.title!)")
                        Text("Saled Price: \(games.salePrice!)")
                        Text("Normal Price: \(games.normalPrice!)")
                        Text("Rating: \(games.dealRating!)")
                    }
                

                }
                
               
                
                Image(systemName: "person").getData(url: URL(string : games.thumb!)!)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: UIScreen.main.bounds.size.width * 0.75 , height: UIScreen.main.bounds.size.height / 2)
            }
  
        }
            
        }
    }
}

