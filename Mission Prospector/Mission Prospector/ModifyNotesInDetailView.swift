//
//  ModifyNotesInDetailView.swift
//  Mission Prospector
//
//  Created by Guillaume on 25/06/2024.
//

import SwiftUI
    
struct ModifyNotesInDetailView: View {
    
    @Binding var showSheet: Bool
    @Binding var notes: String
    
    var body: some View {
        VStack {
            HStack {
                Text("Notes")
            }
            TextEditor(text: $notes)
        }
    }
}

#Preview {
    ModifyNotesInDetailView(showSheet: .constant(true), notes: .constant("Texte"))
}

