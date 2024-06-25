//
//  DetailView.swift
//  Mission Prospector
//
//  Created by Guillaume on 24/06/2024.
//

import SwiftUI

struct DetailView: View {
    let society: SocietyStorage
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    @State private var isCEOExpanded = true
    @State private var isCTOExpanded = true
    @State private var isCOOExpanded = true
    @State private var isLeadDevExpanded = true
    
    var body: some View {
        VStack {
            List {
                Section(isExpanded: $isCEOExpanded) {
                    Text(society.cEOFirstName ?? "Inconnu")
                    Text(society.cEOFamilyName ?? "Inconnu")
                    HStack {
                        if let mail = society.cEOEmail, mail != "" {
                            Link(destination: URL(string: "mailto:\(mail)")!) {
                                Image(systemName: "envelope")
                            }
                        }
                        Text(society.cEOEmail ?? "Inconnu")
                    }
                    HStack {
                        if let phone = society.cEOPhone, phone != "" {
                            Link(destination: URL(string: "tel:\(phone)")!) {
                                Image(systemName: "phone")
                            }
                        }
                        Text(society.cEOPhone ?? "Inconnu")
                    }
                    Text(society.cEONotes ?? "Inconnu")
                } header: {
                    HStack {
                        Text("CEO")
                        Spacer()
                        isCEOExpanded ? Image(systemName: "chevron.down.circle")
                            .font(.system(size: 20)) :
                        Image(systemName: "chevron.left.circle")
                            .font(.system(size: 20))
                    }
                    .onTapGesture {
                        withAnimation {
                            isCEOExpanded.toggle()
                        }
                    }
                }
                
                Section(isExpanded: $isCTOExpanded) {
                    Text(society.cTOFirstName ?? "Inconnu")
                    Text(society.cTOFamilyName ?? "Inconnu")
                    HStack {
                        if let mail = society.cTOEmail, mail != "" {
                            Link(destination: URL(string: "mailto:\(mail)")!) {
                                Image(systemName: "envelope")
                            }
                        }
                        Text(society.cTOEmail ?? "Inconnu")
                    }
                    HStack {
                        if let phone = society.cTOPhone, phone != "" {
                            Link(destination: URL(string: "tel:\(phone)")!) {
                                Image(systemName: "phone")
                            }
                        }
                        Text(society.cTOPhone ?? "Inconnu")
                    }
                    Text(society.cTONotes ?? "Inconnu")
                } header: {
                    HStack {
                        Text("CTO")
                        Spacer()
                        isCTOExpanded ? Image(systemName: "chevron.down.circle")
                            .font(.system(size: 20)) :
                        Image(systemName: "chevron.left.circle")
                            .font(.system(size: 20))
                    }
                    .onTapGesture {
                        withAnimation {
                            isCTOExpanded.toggle()
                        }
                    }
                }
                
                Section(isExpanded: $isCOOExpanded) {
                    Text(society.cOOFirstName ?? "Inconnu")
                    Text(society.cOOFamilyName ?? "Inconnu")
                    HStack {
                        if let mail = society.cOOEmail, mail != "" {
                            Link(destination: URL(string: "mailto:\(mail)")!) {
                                Image(systemName: "envelope")
                            }
                        }
                        Text(society.cOOEmail ?? "Inconnu")
                    }
                    HStack {
                        if let phone = society.cOOPhone, phone != "" {
                            Link(destination: URL(string: "tel:\(phone)")!) {
                                Image(systemName: "phone")
                            }
                        }
                        Text(society.cOOPhone ?? "Inconnu")
                    }
                    Text(society.cOONotes ?? "Inconnu")
                } header: {
                    HStack {
                        Text("COO")
                        Spacer()
                        isCOOExpanded ? Image(systemName: "chevron.down.circle")
                            .font(.system(size: 20)) :
                        Image(systemName: "chevron.left.circle")
                            .font(.system(size: 20))
                    }
                    .onTapGesture {
                        withAnimation {
                            isCOOExpanded.toggle()
                        }
                    }
                }
                
                Section(isExpanded: $isLeadDevExpanded) {
                    Text(society.leadDevFirstName ?? "Inconnu")
                    Text(society.leadDevFamilyName ?? "Inconnu")
                    HStack {
                        if let mail = society.leadDevEmail, mail != "" {
                            Link(destination: URL(string: "mailto:\(mail)")!) {
                                Image(systemName: "envelope")
                            }
                        }
                        Text(society.leadDevEmail ?? "Inconnu")
                    }
                    HStack {
                        if let phone = society.leadDevPhone, phone != "" {
                            Link(destination: URL(string: "tel:\(phone)")!) {
                                Image(systemName: "phone")
                            }
                        }
                        Text(society.leadDevPhone ?? "Inconnu")
                    }
                    Text(society.leadDevNotes ?? "Inconnu")
                } header: {
                    HStack {
                        Text("Lead Dev")
                        Spacer()
                        isLeadDevExpanded ? Image(systemName: "chevron.down.circle")
                            .font(.system(size: 20)) :
                        Image(systemName: "chevron.left.circle")
                            .font(.system(size: 20))
                    }
                    .onTapGesture {
                        withAnimation {
                            isLeadDevExpanded.toggle()
                        }
                    }
                }
            }
            .navigationTitle(society.societyName ?? "Nom inconnu")
            .navigationBarTitleDisplayMode(.inline)
            .alert(LocalizedStringKey("delete?"), isPresented: $showingDeleteAlert) {
                Button(LocalizedStringKey("delete"), role: .destructive, action: deleteSociety)
                Button(LocalizedStringKey("cancel"), role: .cancel) { }
            } message: {
                Text(LocalizedStringKey("sure?"))
            }
            .toolbar {
                Button {
                    showingDeleteAlert = true
                } label: {
                    Label("Suppr.", systemImage: "trash")
                }
            }
        }
    }
    
    func deleteSociety() {
        moc.delete(society)
        
        try? moc.save()
        dismiss()
    }
}
