//
//  Palindrome.swift
//  ReverseAStringChallenge
//
//  Created by Rhency Delgado on 4/8/23.
//

import SwiftUI

struct Palindrome: View {
    
    @State var string: String = ""
    
    var body: some View {
        VStack {
            
            Text("Palindromes")
                .font(.largeTitle)
                .padding(.bottom, 60)
            
            Text("A palindrome is a word that’s spelled the same backward and forwards — like “mom” or “racecar”")
                .padding()
            
            
            TextField("Type here..", text: $string)
                .textInputAutocapitalization(.never)
                .padding()
                .background(Color.gray.opacity(0.2).cornerRadius(10))
                .padding()
                
            
            if !string.isEmpty {
                Text(palindrome(string) ? "\(string) is a Palindrome" : "\(string) is not a Palindrome")
            }
            
        }
    }
    
    func palindrome(_ string: String) -> Bool {
        let reversed = String(string.reversed())
        
        if string == reversed {
            return true
        } else {
            return false
        }
    }
}

struct Palindrome_Previews: PreviewProvider {
    static var previews: some View {
        Palindrome()
    }
}
