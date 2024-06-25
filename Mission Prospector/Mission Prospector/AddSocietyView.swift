//
//  AddSocietyView.swift
//  Mission Prospector
//
//  Created by Guillaume on 24/06/2024.
//

import SwiftUI

struct AddSocietyView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var isCEOExpanded = false
    @State private var isCTOExpanded = false
    @State private var isCOOExpanded = false
    @State private var isLeadDevExpanded = false
    @State private var alertName = false
    
    @State private var societyName: String = ""
    // CEO
    @State private var CEOFirstName: String
    @State private var CEOFamilyName: String
    @State private var CEOEmail: String
    @State private var CEOPhone: String
    @State private var CEONotes: String
    // CTO
    @State var CTOFirstName: String
    @State var CTOFamilyName: String
    @State var CTOEmail: String
    @State var CTOPhone: String
    @State var CTONotes: String
    // COO
    @State var COOFirstName: String
    @State var COOFamilyName: String
    @State var COOEmail: String
    @State var COOPhone: String
    @State var COONotes: String
    // Lead Dev
    @State var leadDevFirstName: String
    @State var leadDevFamilyName: String
    @State var leadDevEmail: String
    @State var leadDevPhone: String
    @State var leadDevNotes: String
    
    init(
        societyName: String,
        CEOFirstName: String = "",
        CEOFamilyName: String = "",
        CEOEmail: String = "",
        CEOPhone: String = "",
        CEONotes: String = "",
        CTOFirstName: String = "",
        CTOFamilyName: String = "",
        CTOEmail: String = "",
        CTOPhone: String = "",
        CTONotes: String = "",
        COOFirstName: String = "",
        COOFamilyName: String = "",
        COOEmail: String = "",
        COOPhone: String = "",
        COONotes: String = "",
        leadDevFirstName: String = "",
        leadDevFamilyName: String = "",
        leadDevEmail: String = "",
        leadDevPhone: String = "",
        leadDevNotes: String = ""
    ) {
        self.societyName = societyName
        self.CEOFirstName = CEOFirstName
        self.CEOFamilyName = CEOFamilyName
        self.CEOEmail = CEOEmail
        self.CEOPhone = CEOPhone
        self.CEONotes = CEONotes
        self.CTOFirstName = CTOFirstName
        self.CTOFamilyName = CTOFamilyName
        self.CTOEmail = CTOEmail
        self.CTOPhone = CTOPhone
        self.CTONotes = CTONotes
        self.COOFirstName = COOFirstName
        self.COOFamilyName = COOFamilyName
        self.COOEmail = COOEmail
        self.COOPhone = COOPhone
        self.COONotes = COONotes
        self.leadDevFirstName = leadDevFirstName
        self.leadDevFamilyName = leadDevFamilyName
        self.leadDevEmail = leadDevEmail
        self.leadDevPhone = leadDevPhone
        self.leadDevNotes = leadDevNotes
    }
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField(LocalizedStringKey("Society"), text: $societyName)
                }
                
                Section(isExpanded: $isCEOExpanded) {
                    TextField(LocalizedStringKey("FirstName"), text: $CEOFirstName)
                    TextField(LocalizedStringKey("FamilyName"), text: $CEOFamilyName)
                    TextField(LocalizedStringKey("email"), text: $CEOEmail).keyboardType(.emailAddress)
                    TextField(LocalizedStringKey("PhoneNb"), text: $CEOPhone).keyboardType(.phonePad)
                    TextEditor(text: $CEONotes)
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
                    TextField(LocalizedStringKey("FirstName"), text: $CTOFirstName)
                    TextField(LocalizedStringKey("FamilyName"), text: $CTOFamilyName)
                    TextField(LocalizedStringKey("email"), text: $CTOEmail).keyboardType(.emailAddress)
                    TextField(LocalizedStringKey("PhoneNb"), text: $CTOPhone).keyboardType(.phonePad)
                    TextEditor(text: $CTONotes)
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
                    TextField(LocalizedStringKey("FirstName"), text: $COOFirstName)
                    TextField(LocalizedStringKey("FamilyName"), text: $COOFamilyName)
                    TextField(LocalizedStringKey("email"), text: $COOEmail).keyboardType(.emailAddress)
                    TextField(LocalizedStringKey("PhoneNb"), text: $COOPhone).keyboardType(.phonePad)
                    TextEditor(text: $COONotes)
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
                    TextField(LocalizedStringKey("FirstName"), text: $leadDevFirstName)
                    TextField(LocalizedStringKey("FamilyName"), text: $leadDevFamilyName)
                    TextField(LocalizedStringKey("email"), text: $leadDevEmail).keyboardType(.emailAddress)
                    TextField(LocalizedStringKey("PhoneNb"), text: $leadDevPhone).keyboardType(.phonePad)
                    TextEditor(text: $leadDevNotes)
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
            
                Section {
                    Button(LocalizedStringKey("save")) {
                        guard societyName != "" else {
                            alertName = true
                            return
                        }
                        let newSociety = SocietyStorage(context: moc)
                        newSociety.id = UUID()
                        newSociety.societyName = societyName
                        newSociety.cEOFirstName = CEOFirstName
                        newSociety.cEOFamilyName = CEOFamilyName
                        newSociety.cEOEmail = CEOEmail
                        newSociety.cEOPhone = CEOPhone
                        newSociety.cEONotes = CEONotes
                        newSociety.cTOFirstName = CTOFirstName
                        newSociety.cTOFamilyName = CTOFamilyName
                        newSociety.cTOEmail = CTOEmail
                        newSociety.cTOPhone = CTOPhone
                        newSociety.cTONotes = CTONotes
                        newSociety.cOOFirstName = COOFirstName
                        newSociety.cOOFamilyName = COOFamilyName
                        newSociety.cOOEmail = COOEmail
                        newSociety.cOOPhone = COOPhone
                        newSociety.cOONotes = COONotes
                        newSociety.leadDevFirstName = leadDevFirstName
                        newSociety.leadDevFamilyName = leadDevFamilyName
                        newSociety.leadDevEmail = leadDevEmail
                        newSociety.leadDevPhone = leadDevPhone
                        newSociety.leadDevNotes = leadDevNotes
                        newSociety.lastUse = Date()
                        
                        do {
                            try moc.save()
                            dismiss()
                        } catch {
                            print("Error while saving: \(error.localizedDescription)")
                        }
                    }
                }
            }
            .navigationTitle(LocalizedStringKey("Society"))
            .alert(isPresented: $alertName, content: {
                Alert(title: Text(LocalizedStringKey("noNameTitle")), message: Text(LocalizedStringKey("noNameMessage")))
            })
        }
    }
}

#Preview {
    AddSocietyView(societyName: "Essai")
}
