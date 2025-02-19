//
//  Home.swift
//  Mission Prospector
//
//  Created by Guillaume on 24/06/2024.
//

import SwiftUI

struct Home: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var societies: FetchedResults<SocietyStorage>
    
    @State private var showingAddScreen = false
    
    @State var societyName: String = ""
    // Agent
    @State var agentFirstName: String = ""
    @State var agentFamilyName: String = ""
    @State var agentEmail: String = ""
    @State var agentPhone: String = ""
    @State var agentNotes: String = ""
    // CEO
    @State var CEOFirstName: String = ""
    @State var CEOFamilyName: String = ""
    @State var CEOEmail: String = ""
    @State var CEOPhone: String = ""
    @State var CEONotes: String = ""
    // CTO
    @State var CTOFirstName: String = ""
    @State var CTOFamilyName: String = ""
    @State var CTOEmail: String = ""
    @State var CTOPhone: String = ""
    @State var CTONotes: String = ""
    // COO
    @State var COOFirstName: String = ""
    @State var COOFamilyName: String = ""
    @State var COOEmail: String = ""
    @State var COOPhone: String = ""
    @State var COONotes: String = ""
    // Lead Dev
    @State var leadDevFirstName: String = ""
    @State var leadDevFamilyName: String = ""
    @State var leadDevEmail: String = ""
    @State var leadDevPhone: String = ""
    @State var leadDevNotes: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(societies) { society in
                    NavigationLink {
                        DetailView(society: society)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(society.societyName ?? "N/A")
                                    .font(.headline)
                                
                                Text(societyContact(society))
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .swipeActions(allowsFullSwipe: false) {
                        Button(role: .destructive) {
                            deleteSociety(society)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        
                        Button {
                            editSociety(society)
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        .tint(.green)
                    }
                }
            }
            .navigationTitle("Sociétés")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add Society", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddSocietyView(societyName: societyName, agentFirstName: agentFirstName, agentFamilyName: agentFamilyName, agentEmail: agentEmail, agentPhone: agentPhone, agentNotes: agentNotes , CEOFirstName: CEOFirstName, CEOFamilyName: CEOFamilyName, CEOEmail: CEOEmail, CEOPhone: CEOPhone, CEONotes: CEONotes, CTOFirstName: CTOFirstName, CTOFamilyName: CTOFamilyName, CTOEmail: CTOEmail, CTOPhone: CTOPhone, CTONotes: CTONotes, COOFirstName: COOFirstName, COOFamilyName: COOFamilyName, COOEmail: COOEmail, COOPhone: COOPhone, COONotes: COONotes, leadDevFirstName: leadDevFirstName, leadDevFamilyName: leadDevFamilyName, leadDevEmail: leadDevEmail, leadDevPhone: leadDevPhone, leadDevNotes: leadDevNotes)
            }
            .onChange(of: showingAddScreen) { _, newValue in
                if !newValue {
                    societyName = ""
                    // Agent
                    agentFirstName = ""
                    agentFamilyName = ""
                    agentEmail = ""
                    agentPhone = ""
                    agentNotes = ""
                    // CEO
                    CEOFirstName = ""
                    CEOFamilyName = ""
                    CEOEmail = ""
                    CEOPhone = ""
                    CEONotes = ""
                    // CTO
                    CTOFirstName = ""
                    CTOFamilyName = ""
                    CTOEmail = ""
                    CTOPhone = ""
                    CTONotes = ""
                    // COO
                    COOFirstName = ""
                    COOFamilyName = ""
                    COOEmail = ""
                    COOPhone = ""
                    COONotes = ""
                    // Lead Dev
                    leadDevFirstName = ""
                    leadDevFamilyName = ""
                    leadDevEmail = ""
                    leadDevPhone = ""
                    leadDevNotes = ""
                }
            }
        }
    }
    
    func deleteSociety(_ society: SocietyStorage) {
        moc.delete(society)
        try? moc.save()
    }
    
    func editSociety(_ society: SocietyStorage) {
        societyName = society.societyName ?? ""
        // Agent
        agentFirstName = society.agentFirstName ?? ""
        agentFamilyName = society.agentFamilyName ?? ""
        agentEmail = society.agentEmail ?? ""
        agentPhone = society.agentPhone ?? ""
        agentNotes = society.agentNotes ?? ""
        // CEO
        CEOFirstName = society.cEOFirstName ?? ""
        CEOFamilyName = society.cEOFamilyName ?? ""
        CEOEmail = society.cEOEmail ?? ""
        CEOPhone = society.cEOPhone ?? ""
        CEONotes = society.cEONotes ?? ""
        // CTO
        CTOFirstName = society.cTOFirstName ?? ""
        CTOFamilyName = society.cTOFamilyName ?? ""
        CTOEmail = society.cTOEmail ?? ""
        CTOPhone = society.cTOPhone ?? ""
        CTONotes = society.cTONotes ?? ""
        // COO
        COOFirstName = society.cOOFirstName ?? ""
        COOFamilyName = society.cOOFamilyName ?? ""
        COOEmail = society.cOOEmail ?? ""
        COOPhone = society.cOOPhone ?? ""
        COONotes = society.cOONotes ?? ""
        // Lead Dev
        leadDevFirstName = society.leadDevFirstName ?? ""
        leadDevFamilyName = society.leadDevFamilyName ?? ""
        leadDevEmail = society.leadDevEmail ?? ""
        leadDevPhone = society.leadDevPhone ?? ""
        leadDevNotes = society.leadDevNotes ?? ""
        
        moc.delete(society)
        try? moc.save()
        
        showingAddScreen = true
    }
    
    func societyContact(_ society: SocietyStorage) -> String {
        if let firstName = society.agentFirstName, let familyName = society.agentFamilyName, firstName != "", familyName != "" {
            return firstName + " " + familyName
            
        } else if let firstName = society.cEOFirstName, let familyName = society.cEOFamilyName, firstName != "", familyName != "" {
            return firstName + " " + familyName
            
        } else if let firstName = society.cTOFirstName, let familyName = society.cTOFamilyName, firstName != "", familyName != "" {
            return firstName + " " + familyName
            
        } else if let firstName = society.cOOFirstName, let familyName = society.cOOFamilyName, firstName != "", familyName != "" {
            return firstName + " " + familyName
            
        } else if let firstName = society.leadDevFirstName, let familyName = society.leadDevFamilyName, firstName != "", familyName != "" {
            return firstName + " " + familyName
            
        }
        return "Pas de contact défini"
    }
}

#Preview {
    Home()
}
