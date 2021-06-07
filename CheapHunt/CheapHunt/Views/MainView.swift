//
//  MainView.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 5/30/21.
//

import SwiftUI

struct MainView: View {
    @ObservedObject private var userName = UserName()
    @State private var dat : [Deal] = []
    @State private var isWorking : Bool = true
    private let second : Double = 4.0
    @State private var isString = ""
    @State private var isActive : Bool = false
    @State private var settingsActive : Bool = false
    @State private var emptyAlert : Bool = false
    @ObservedObject private var getData = GetData()
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = .clear
        
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.bg2, Color.bg3 , Color.bg4 , Color.bg1]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    TextField("Enter Your Amount Here!", text: $isString)
                        .textFieldStyle(OvalTextField())
                    Button("Fetch") {
                        
                        switch self.isString.isEmpty {
                        case .BooleanLiteralType(true):
                            self.emptyAlert = true
                            
                        default:
                            getData.getData(price: Int((isString))) { data in
                                self.dat = data
                            }
                        }
                        
                        
                    } .alert(isPresented: $emptyAlert , content: {
                        Alert(title: Text("Your amount Cannot be empty or under 1 dollars!"), message: Text("Enter again"), dismissButton: .default(Text("OK!")))
                    })
                    
                    .buttonStyle(OvalButton())
                    
                    
                    
                    Text("Welcome \(userName.name), enter your amount for matched games!")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                    
                    Spacer()
                }.padding(.bottom , 30)
                .frame(width: UIScreen.main.bounds.size.width * 0.7, height: UIScreen.main.bounds.size.height * 0.8)
                Spacer()
                
                ZStack {
                    VStack {
                        
                        Spacer()
                        List(dat) { data in
                            VStack {
                                HStack {
                                    Text(data.title!)
                                        .font(.system(size: 20))
                                    
                                    
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    NavigationLink(destination: GameDetailView(games: data)) {
                                        Text("Saled Price \(data.salePrice!)")
                                            .font(.system(size: 15))
                                            .fontWeight(.light)
                                        
                                        Text("Normal Price \(data.normalPrice!)")
                                            .font(.system(size: 10))
                                            .fontWeight(.medium)
                                            .foregroundColor(.red)
                                        
                                        Spacer()
                                        
                                        
                                        Text("Rating \(data.dealRating!)⭐️")
                                            .font(.system(size: 10))
                                            .fontWeight(.medium)
                                            .foregroundColor(.green)
                                    }
                                    
                                }
                                
                            }
                        }.cornerRadius(15)
                    }
                    .padding(.top , 60)
                    .frame(height: UIScreen.main.bounds.width / 1.2)
                    
                    VStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .opacity(isWorking ? 1 : 0)
                            .animation(.easeIn)
                        
                        
                        Text("Loading")
                            .font(.system(size: 25))
                            .fontWeight(.light)
                            .opacity(isWorking ? 1 : 0)
                            .animation(.easeIn)
                        
                    }
                    
                    
                    .navigationBarBackButtonHidden(true)
                    
                }.onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + second) {
                        getData.getData(price: Int(isString) ) { data in
                            self.dat = data
                        }
                        
                        self.isWorking = false
                        
                    }
                    
                }
                
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Favorites tapped")
                        self.isActive = true
                    }) {
                        Image(systemName: "heart.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(Color.heart)
                    } .background(
                        NavigationLink(
                            destination: FavoritesView(), isActive : $isActive) {
                            FavoritesView()
                        }
                        .hidden()
                    )
                }
                
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    
                    
                    Button(action: {
                        print("settings tapped")
                        self.settingsActive = true
                    }) {
                        Image(systemName: "gear")
                            .font(.system(size: 30))
                            .foregroundColor(Color.gear)
                    }.background(
                        NavigationLink(destination: SettingsView(), isActive: $settingsActive) {
                            SettingsView()
                        }
                        
                        .hidden()
                        
                    )
                    
                    
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

