//
//  SheetContacts.swift
//  Mission Prospector
//
//  Created by Guillaume on 08/07/2024.
//

import SwiftUI
import Contacts

struct SheetContacts: View {
    @State var contacts: [CNContact] = []
    @Binding var contact: CNContact?
    @Binding var showSheet: Bool
    @State var searchText = ""
    @State var searchIsActive = true
    var body: some View {
        VStack {
            List {
                ForEach(contacts, id: \.self) { contact in
                    VStack(alignment: .leading) {
                        Text("P: \(contact.givenName)")
                        Text("F: \(contact.familyName)")
                        Text(getPhoneNumber(contact: contact))
                        Text(getEmail(contact: contact))
                    }
                        .padding()
                        .onTapGesture {
                            print(contact)
                            self.contact = contact
                            showSheet = false
                        }
                }
            }
        }
        .navigationTitle("Contacts").toolbarTitleDisplayMode(.inline)
        //.searchable(text: $searchText, isPresented: $searchIsActive, prompt: "Search")
        .padding()
        .onAppear() {
            getContacts()
        }
    }
    
    func getContacts() {
        let CNStore = CNContactStore()
        let queue = DispatchQueue(label: "Queue", qos: .background)
        
        switch CNContactStore.authorizationStatus(for: .contacts) {
            case .authorized:
                queue.async { [self] in
                    do {
                        let keys = [CNContactGivenNameKey as CNKeyDescriptor, CNContactFamilyNameKey as CNKeyDescriptor, CNContactPhoneNumbersKey as CNKeyDescriptor, CNContactEmailAddressesKey as CNKeyDescriptor]
                        let request = CNContactFetchRequest(keysToFetch: keys)
                        
                        
                        
                        try CNStore.enumerateContacts(with: request) { contact, _ in
                            contacts.append(contact)
                        }
                        
                        DispatchQueue.main.async {
                            contacts = contacts.sorted {$0.familyName < $1.familyName}
                        }
                        
                    } catch {
                        print("Error on contact fetching : \(error.localizedDescription)")
                    }
                }
            case .denied:
                print("Denied")
            case .notDetermined:
                CNStore.requestAccess(for: .contacts) { granted, error in
                    if granted {
                        getContacts()
                    } else if let error = error {
                        print("Error : \(error.localizedDescription)")
                    }
                }
            case .restricted:
                print("Restricted")
            @unknown default:
                print("Unknown")
        }
    }
    
    
    
    private func getPhoneNumber(contact: CNContact) -> String {
        contact.phoneNumbers.first?.value.stringValue ?? "N/A"
    }
    
    private func getEmail(contact: CNContact) -> String {
        contact.emailAddresses.first?.value as? String ?? "N/A"
    }
}

#Preview {
    SheetContacts(contact: .constant(nil), showSheet: .constant(true))
}
