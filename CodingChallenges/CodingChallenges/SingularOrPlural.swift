//
//  SingularOrPlural.swift
//  ReverseAStringChallenge
//
//  Created by Rhency Delgado on 4/8/23.
//

import SwiftUI

struct SingularOrPlural: View {
    
    @State var string: String = ""
    @State var result: String = ""
    
    var body: some View {
        VStack {
            
            Text("Finding Plurals and Singulars")
                .font(.largeTitle)
                .padding(.bottom, 60)
            
            Text("If the string ends in “-s,” then indicate that the word is plural. Otherwise, it should return singular. ")
                .padding()
            
            TextField("Type here", text: $string)
                .padding()
                .background(Color.gray.opacity(0.2).cornerRadius(10))
                .padding()
            
            if !string.isEmpty {
                Text(plural(string) ? "\(string) is plural" : "\(string) is singular")
            }
            
        }
    }
    
    func plural(_ string:String) -> Bool {
        if string.last == "s" {
            return true
        }
        else {
            return false
        }
    }
}

struct SingularOrPlural_Previews: PreviewProvider {
    static var previews: some View {
        SingularOrPlural()
    }
}
