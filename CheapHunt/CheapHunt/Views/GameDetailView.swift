//
//  GameDetailView.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 6/5/21.
//

import SwiftUI

struct GameDetailView: View  {
    internal let games : Deal!
    @State private var addFavorites : Bool = false
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
                        HStack {
                            Text("Normal Price: \(games.normalPrice!)")
                            Image(systemName: "dollarsign.circle.fill")
                                .foregroundColor(.green)

                        }
                        HStack {
                            Text("Rating: \(games.dealRating!)")
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)

                        }
                    }
                

                }
                
                
                    

               
                VStack {
                    Image(systemName: "person").getData(url: URL(string : games.thumb!)!)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .frame(width: UIScreen.main.bounds.size.width * 0.75 , height: UIScreen.main.bounds.size.height / 2)
                        .padding(.bottom , 50)
                    
                    
                    Button(action: {
                       print("save favorites")
                    }) {
                        Image(systemName: "heart.circle.fill")
                            .font(.system(size: 50))
                            .foregroundColor(Color.heart)
                    }
                }
                 
            }
  
        }
            
        }
    }
}

