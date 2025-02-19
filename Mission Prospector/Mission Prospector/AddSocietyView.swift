//
//  AddSocietyView.swift
//  Mission Prospector
//
//  Created by Guillaume on 24/06/2024.
//

import Contacts
import SwiftUI

struct AddSocietyView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State var contact: CNContact?
    @State var showSheetContacts: Bool = false
    @State var origin: NotesOrigin?
    
    @State private var isAgentExpanded = false
    @State private var isCEOExpanded = false
    @State private var isCTOExpanded = false
    @State private var isCOOExpanded = false
    @State private var isLeadDevExpanded = false
    @State private var alertName = false
    
    @State private var societyName: String = ""
    
    // Agent
    @State private var agentFirstName: String
    @State private var agentFamilyName: String
    @State private var agentEmail: String
    @State private var agentPhone: String
    @State private var agentNotes: String
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
        agentFirstName: String = "",
        agentFamilyName: String = "",
        agentEmail: String = "",
        agentPhone: String = "",
        agentNotes: String = "",
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
        self.agentFirstName = agentFirstName
        self.agentFamilyName = agentFamilyName
        self.agentEmail = agentEmail
        self.agentPhone = agentPhone
        self.agentNotes = agentNotes
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
                
                Section(isExpanded: $isAgentExpanded) {
                    TextField(LocalizedStringKey("FirstName"), text: $agentFirstName)
                    TextField(LocalizedStringKey("FamilyName"), text: $agentFamilyName)
                    TextField(LocalizedStringKey("email"), text: $agentEmail).keyboardType(.emailAddress)
                    TextField(LocalizedStringKey("PhoneNb"), text: $agentPhone).keyboardType(.phonePad)
                    TextEditor(text: $agentNotes)
                        
                } header: {
                    HStack {
                        Text("Agent")
                        Spacer()
                        Button {
                            isAgentExpanded = true
                            showSheetContacts = true
                            origin = .agent
                        } label: {
                            Text("Contacts")
                                .font(.footnote)
                                .padding(.trailing)
                        }
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
                    TextField(LocalizedStringKey("FirstName"), text: $CEOFirstName)
                    TextField(LocalizedStringKey("FamilyName"), text: $CEOFamilyName)
                    TextField(LocalizedStringKey("email"), text: $CEOEmail).keyboardType(.emailAddress)
                    TextField(LocalizedStringKey("PhoneNb"), text: $CEOPhone).keyboardType(.phonePad)
                    TextEditor(text: $CEONotes)
                        
                } header: {
                    HStack {
                        Text("CEO")
                        Spacer()
                        Button {
                            isCEOExpanded = true
                            showSheetContacts = true
                            origin = .CEO
                        } label: {
                            Text("Contacts")
                                .font(.footnote)
                                .padding(.trailing)
                        }
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
                        Button {
                            isCTOExpanded = true
                            showSheetContacts = true
                            origin = .CTO
                        } label: {
                            Text("Contacts")
                                .font(.footnote)
                                .padding(.trailing)
                        }
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
                        Button {
                            isCOOExpanded = true
                            showSheetContacts = true
                            origin = .COO
                        } label: {
                            Text("Contacts")
                                .font(.footnote)
                                .padding(.trailing)
                        }
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
                        Button {
                            isLeadDevExpanded = true
                            showSheetContacts = true
                            origin = .leadDev
                        } label: {
                            Text("Contacts")
                                .font(.footnote)
                                .padding(.trailing)
                        }
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
                        //saveSociety()
                        dismiss()
                    }
                }
            }
            .navigationTitle(LocalizedStringKey("Society"))
            .alert(isPresented: $alertName, content: {
                Alert(title: Text(LocalizedStringKey("noNameTitle")), message: Text(LocalizedStringKey("noNameMessage")))
            })
            .sheet(isPresented: $showSheetContacts, content: {
                SheetContacts(contact: $contact, showSheet: $showSheetContacts)
            })
            /*
            .fullScreenCover(isPresented: $showSheetContacts, content: {
                SheetContacts(contact: $contact, showSheet: $showSheetContacts)
            })
             */
            .onChange(of: showSheetContacts) { _, newValue in
                if newValue == false {
                    if let contact = contact {
                        switch origin {
                            case .agent:
                                agentFirstName = contact.givenName
                                agentFamilyName = contact.familyName
                                agentEmail = (contact.emailAddresses.first?.value ?? "") as String
                                agentPhone = contact.phoneNumbers.first?.value.stringValue ?? ""
                                
                            case .CEO:
                                CEOFirstName = contact.givenName
                                CEOFamilyName = contact.familyName
                                CEOEmail = (contact.emailAddresses.first?.value ?? "") as String
                                CEOPhone = contact.phoneNumbers.first?.value.stringValue ?? ""
                                
                            case .CTO:
                                CTOFirstName = contact.givenName
                                CTOFamilyName = contact.familyName
                                CTOEmail = (contact.emailAddresses.first?.value ?? "") as String
                                CTOPhone = contact.phoneNumbers.first?.value.stringValue ?? ""
                                
                            case .COO:
                                COOFirstName = contact.givenName
                                COOFamilyName = contact.familyName
                                COOEmail = (contact.emailAddresses.first?.value ?? "") as String
                                COOPhone = contact.phoneNumbers.first?.value.stringValue ?? ""
                            case .leadDev:
                                leadDevFirstName = contact.givenName
                                leadDevFamilyName = contact.familyName
                                leadDevEmail = (contact.emailAddresses.first?.value ?? "") as String
                                leadDevPhone = contact.phoneNumbers.first?.value.stringValue ?? ""
                            case nil:
                                break
                        }
                    }
                }
            }
            .onDisappear() {
                saveSociety()
            }
        }
    }
    
    private func saveSociety() {
        /*
        guard societyName != "" else {
            alertName = true
            
            return
        }
         */
        let newSociety = SocietyStorage(context: moc)
        newSociety.id = UUID()
        newSociety.societyName = societyName
        newSociety.agentFirstName = agentFirstName
        newSociety.agentFamilyName = agentFamilyName
        newSociety.agentEmail = agentEmail
        newSociety.agentPhone = agentPhone
        newSociety.agentNotes = agentNotes
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

#Preview {
    AddSocietyView(societyName: "Essai")
}
