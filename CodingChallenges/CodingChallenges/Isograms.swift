//
//  Isograms.swift
//  ReverseAStringChallenge
//
//  Created by Rhency Delgado on 4/8/23.
//

import SwiftUI

struct Isograms: View {
    
    @State var string: String = ""
    @State var result: String = ""
    
    var body: some View {
        VStack {
            
            Text("Isograms")
                .font(.largeTitle)
                .padding(.bottom, 60)
            
            
            Text("An isogram is a word that has no repeated letters. For example, “today” is an isogram, but “tomorrow” is not")
                .font(.body)
                .padding(20)
            
            TextField("Type here..", text: $string)
                .padding()
                .background(Color.gray.opacity(0.2).cornerRadius(10))
                .padding()
            
            if !string.isEmpty {
                
                
                
                Text((isItAnIsogram(string) ? "\(string) is an isogram" : "\(string) isn't an isogram"))
            }
            
        }
    }
    
    func isItAnIsogram(_ string:String) -> Bool {
        
        var set = Set<String>()
        
        for letter in string {
            set.insert(String(letter))
        }
        
        if string.count == set.count {
            return true
        }
        else {
            return false
        }
    }
}

struct Isograms_Previews: PreviewProvider {
    static var previews: some View {
        Isograms()
    }
}
