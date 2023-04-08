//
//  NameCards.swift
//  ReverseAStringChallenge
//
//  Created by Rhency Delgado on 4/8/23.
//

import SwiftUI

struct NameCards: View {
    
    enum FocusFields {
        case name
        case country
    }

    
    @State var textfield: String = ""
    @State var country: String = ""
    @State var guests: [String: String] =
    [ "Mike" : "Canada", "Jane" : "Australia", "Angela" : "Germany", "Robert" : "Nigeria", "Rhency" : "Venezuela"]
    
    @State var showGreetings: Bool = false
    @State var save: Bool = false
    @State var disableButton :Bool = false
    @State var showAlert: Bool = false
    @FocusState var fieldInFocus: FocusFields?
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Text("Imagine that you’re creating name cards for a group of international guests. Their names and home countries can be stored as key-value pairs in a dictionary")
                    .padding(.bottom)
                
                Text(" guests = [ “Mike” : “Canada”, “Jane” : “Australia”, “Angela” : “Germany”, “Robert” : “Nigeria”]")
                    .padding(.bottom)
                
                Text("Create a function that accepts a name as an input string and outputs a name card greeting that includes the person’s name and country. For example, “I’m [name], and I’m from [country].” So, inputting Robert’s name would output, “I’m Robert, and I’m from Nigeria.”")
            }
            .padding()
            
            
            TextField("Type your name here...", text: $textfield)
                .padding()
                .background(Color.gray.opacity(0.2).cornerRadius(10))
                .padding()
                .focused($fieldInFocus, equals: .name)
            
            
            
            Spacer()
            
            if showGreetings && !textfield.isEmpty {
                
                if save {
                    TextField("Country",
                              text: $country)
                    .padding()
                    .focused($fieldInFocus, equals: .country)
                    .background(Color.blue.opacity(0.2).cornerRadius(10))
                    .padding()
                    .onAppear {
                        disableButton = true
                    }
                    
                    Button("Save user") {
                        
                        if !country.isEmpty {
                            saveUser(textfield, country)
                            save = false
                            country = ""
                            disableButton.toggle()
                        }
                        
                    }
                    .onAppear() {
                        fieldInFocus = .country
                    }
                    .font(.callout)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(20)
                    .padding()
                    
                    Spacer()
                }
                
                else {
                    Text(greetings(textfield)).font(.headline)
                }
                
                
            }
            
            Spacer()
            
            Button("Press me!") {
                
                isThereAName(textfield)
                
                showGreetings.toggle()
                
                if showGreetings == false {
                    textfield = ""
                }
            }.font(.callout)
            .foregroundColor(.white)
            .padding()
            .background(disableButton ? Color.gray : Color.blue)
            .cornerRadius(20)
            .padding()
            .disabled(disableButton)
            
            .navigationTitle("Name Cards")
            
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("New name detected. Please enter your country"))
        }
        
        
    }
    
    func saveUser(_ name:String,_ country:String) {
        guests[name] = country
    }
    
    func isThereAName(_ name: String) -> Bool {
        
        if guests[name] != nil {
            save = false
            return true
        }
        else if !name.isEmpty {
            showAlert.toggle()
            save = true
            return false
        }
        else {
            return false
        }
        
    }
    
    
    func greetings(_ name: String) -> String {
        
        var greet = "Hello I'm \(name)"
        
        if let country = guests[name] {
            let origin = ", and I'm from \(country)"
            greet += origin
        }
        
        return greet
        
    }
}

struct NameCards_Previews: PreviewProvider {
    static var previews: some View {
        NameCards()
    }
}
