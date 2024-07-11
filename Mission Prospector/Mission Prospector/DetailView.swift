//
//  DetailView.swift
//  Mission Prospector
//
//  Created by Guillaume on 24/06/2024.
//

import SwiftUI

struct DetailView: View {
    @FetchRequest(sortDescriptors: []) var societies: FetchedResults<SocietyStorage>
    
    @State var society: SocietyStorage
    
    @State var modifyNotes = false
    @State var notesOrigin: NotesOrigin = .CEO
    @State var notesToModify = ""
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    @State private var isAgentExpanded = true
    @State private var isCEOExpanded = true
    @State private var isCTOExpanded = true
    @State private var isCOOExpanded = true
    @State private var isLeadDevExpanded = true
    
    var body: some View {
        VStack {
            List {
                Section(isExpanded: $isAgentExpanded) {
                    Text(society.agentFirstName ?? "Inconnu")
                    Text(society.agentFamilyName ?? "Inconnu")
                    HStack {
                        if let mail = society.agentEmail, mail != "" {
                            Link(destination: URL(string: "mailto:\(mail)")!) {
                                Image(systemName: "envelope")
                            }
                        }
                        Text(society.agentEmail ?? "Inconnu")
                    }
                    HStack {
                        if let phone = society.agentPhone, phone != "" {
                            Link(destination: URL(string: "tel:\(phone)")!) {
                                Image(systemName: "phone")
                            }
                        }
                        Text(society.agentPhone ?? "Inconnu")
                    }
                    HStack(alignment: .top) {
                        Text(society.agentNotes ?? "Inconnu")
                        Spacer()
                        Button {
                            notesOrigin = .agent
                            updateNotes()
                            modifyNotes = true
                        } label: {
                            Image(systemName: "pencil")
                        }
                    }
                } header: {
                    HStack {
                        Text("Agent")
                        Spacer()
                        isAgentExpanded ? Image(systemName: "chevron.down.circle")
                            .font(.system(size: 20)) :
                        Image(systemName: "chevron.left.circle")
                            .font(.system(size: 20))
                    }
                    .onTapGesture {
                        withAnimation {
                            isAgentExpanded.toggle()
                        }
                    }
                }
                
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
                    HStack(alignment: .top) {
                        Text(society.cEONotes ?? "Inconnu")
                        Spacer()
                        Button {
                            notesOrigin = .CEO
                            updateNotes()
                            modifyNotes = true
                        } label: {
                            Image(systemName: "pencil")
                        }
                    }
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
                    HStack(alignment: .top) {
                        Text(society.cTONotes ?? "Inconnu")
                        Spacer()
                        Button {
                            notesOrigin = .CTO
                            updateNotes()
                            modifyNotes = true
                        } label: {
                            Image(systemName: "pencil")
                        }
                    }
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
                    HStack(alignment: .top) {
                        Text(society.cOONotes ?? "Inconnu")
                        Spacer()
                        Button {
                            notesOrigin = .COO
                            updateNotes()
                            modifyNotes = true
                        } label: {
                            Image(systemName: "pencil")
                        }
                    }
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
                    HStack(alignment: .top) {
                        Text(society.leadDevNotes ?? "Inconnu")
                        Spacer()
                        Button {
                            notesOrigin = .leadDev
                            updateNotes()
                            modifyNotes = true
                        } label: {
                            Image(systemName: "pencil")
                        }
                    }
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
            .sheet(isPresented: $modifyNotes) {
                    ModifyNotesInDetailView(showSheet: $modifyNotes, notes: $notesToModify)
            }
            .onChange(of: modifyNotes) { _, newValue in
                if !newValue {
                    print("On garde les notes")
                    switch notesOrigin {
                        case .agent:
                            society.agentNotes = notesToModify
                        case .CEO:
                            society.cEONotes = notesToModify
                        case .CTO:
                            society.cTONotes = notesToModify
                        case .COO:
                            society.cOONotes = notesToModify
                        case .leadDev:
                            society.leadDevNotes = notesToModify
                    }
                    do {
                        try moc.save()
                        update()
                    } catch {
                        print("Error : \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    private func updateNotes() {
        switch notesOrigin {
            case .agent:
                notesToModify = society.agentNotes ?? ""
            case .CEO:
                notesToModify = society.cEONotes ?? ""
            case .CTO:
                notesToModify = society.cTONotes ?? ""
            case .COO:
                notesToModify = society.cOONotes ?? ""
            case .leadDev:
                notesToModify = society.leadDevNotes ?? ""
        }
    }
    
    func deleteSociety() {
        moc.delete(society)
        
        try? moc.save()
        dismiss()
    }
    
    func update() {
        for societyToFind in societies {
            if societyToFind.id == society.id {
                society = societyToFind
            }
        }
    }
}
