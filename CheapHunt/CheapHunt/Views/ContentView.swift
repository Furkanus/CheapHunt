//
//  ContentView.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 5/29/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var userName = UserName()
    @ObservedObject private var monitor = NetworkError()
    @ObservedObject private var userLogged = FirstLaunch()
    @State private var alert : Bool = false
   @State private var isActive : Bool = false
    @State private var linkActive : Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.bg4, Color.bg3 , Color.bg2 , Color.bg1]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                ZStack {
                    VStack {
                        Text("Welcome")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("CheapHunt")
                            .font(.system(size: 40))
                            .fontWeight(.light)
                            .foregroundColor(.black)
                    
                    Spacer()
                    
                }.padding(.trailing , UIScreen.main.bounds.size.width / 4)
                Spacer()
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.size.height / 2)
                
                VStack(spacing : 50) {
                    Spacer()
                    
                    
                    TextField("Enter Your Name Here", text: $userName.name)
                        .textFieldStyle(OvalTextField())
                            
                    Button("A new journey is begin!") {
                        if self.userName.name.isEmpty {
                            self.isActive = true
                        } else {
                            self.linkActive = true
                            self.userLogged.launch += 1
                        }
                    }
                        
                        .background(
                            NavigationLink(
                                destination: MainView(), isActive : $linkActive) {
                                MainView()
                            }
                            .hidden()
                                )
                        
                        .alert(isPresented: $isActive , content: {
                            Alert(title: Text("Your Name Cannot be empty!"), message: Text("Write your name"), dismissButton: .default(Text("OK!")))
                        })
                    
                  
                    
                        
                        
                        .buttonStyle(OvalButton())
                        
                        Spacer()
                    }.frame(width: UIScreen.main.bounds.size.width / 1.5)
                }
            }.onAppear {
                switch self.monitor.isConnected {
                case .BooleanLiteralType(false):
                    self.alert = true
                    
                default:
                    break;
                }
            }  .alert(isPresented: $alert , content: {
               return Alert(title: Text("Please check your internet connection!"), message: Text("Connection failed"), dismissButton: .default(Text("OK")))
            })
            
        }
        
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
