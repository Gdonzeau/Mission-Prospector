//
//  PlanNotificationView.swift
//  Mission Prospector
//
//  Created by Guillaume on 14/07/2024.
//

import UserNotifications
import SwiftUI

struct PlanNotificationView: View {
    @Environment(\.dismiss) var dismiss
    @State var date: Date = Date()
    var society: SocietyStorage
    
    var body: some View {
        VStack {
            DatePicker(
                "", selection: $date,
                displayedComponents: [.date, .hourAndMinute]
            )
            .labelsHidden()
            .padding()
            
            notificationButton
        }
    }
    
    var notificationButton: some View {
        Button("Rappel") {
            let content = UNMutableNotificationContent()
            content.title = "MissionProspector"
            content.subtitle = society.societyName != nil ? "Contacter \(society.societyName!)" : "Rappel"
            content.sound = UNNotificationSound.default
            
            let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
            print(dateComponents)
            let trigger2 = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            
            // choose a random identifier
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger2)
            
            // add our notification request
            UNUserNotificationCenter.current().add(request)
            dismiss()
        }
        .padding()
        .background(.secondary)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .tint(.primary)
        
    }
    
}
