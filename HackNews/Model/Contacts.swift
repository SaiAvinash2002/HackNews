//
//  Contacts.swift
//  HackNews
//
//  Created by Sai Avinash Vagicherla on 8/27/25.
//
struct Contacts {
    var contactImage: String?
    var contactName: String
    var contactRole: String
    var contactCountry: String?
    
    static func contactsData() -> [Contacts] {
        return [
            Contacts(contactImage: "1", contactName: "Mohammed Hussain", contactRole: "SEO Specialist", contactCountry: "f1"),
            Contacts(contactImage: "2", contactName: "John Young", contactRole: "Interactive Designer", contactCountry: "f2"),
            Contacts(contactImage: "3", contactName: "Tamilarasi Mohan", contactRole: "Architect", contactCountry: "f3"),
            Contacts(contactImage: "4", contactName: "Kim Yu", contactRole: "Economist", contactCountry: "f4"),
            Contacts(contactImage: "5", contactName: "Derek Fowler", contactRole: "Web Strategist", contactCountry: "f5"),
            Contacts(contactImage: "6", contactName: "Shreya Nithin", contactRole: "Product Designer", contactCountry: "f6"),
            Contacts(contactImage: "7", contactName: "Sherlock Adams", contactRole: "Editor", contactCountry: "f7")
        ]
    }
}
