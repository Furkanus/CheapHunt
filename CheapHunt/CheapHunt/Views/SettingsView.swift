//
//  SettingsView.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 6/4/21.
//

import SwiftUI
import UserNotifications
import UserNotificationsUI

struct SettingsView: View {
    @ObservedObject private var userName = UserName()
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.bg3 , Color.bg1]), startPoint: .bottomTrailing, endPoint: .topLeading).edgesIgnoringSafeArea(.all)
            ZStack {
                VStack {
                    Button("Send me a daily notification") {
                        self.sendNotification()
                    }
                    .buttonStyle(OvalButton())
                   
                    
                    Button("Notification Permission") {
                        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                            if success {
                                print("All set!")
                            } else if let error = error {
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func sendNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert , .sound , .badge]) { _, _ in
            
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Welcome \(userName.name)!"
        content.body = "Thank you for interesting"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let request = UNNotificationRequest(identifier: "req", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
