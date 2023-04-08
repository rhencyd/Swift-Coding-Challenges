//
//  ReverseAString.swift
//  CodingChallenges
//
//  Created by Rhency Delgado on 4/8/23.
//

import SwiftUI

struct ReverseAString: View {
    
    @State var string: String = ""
    @State var reversed: String = ""
    
    var body: some View {
        
        VStack {
            
            Text("Reversing a String")
                .font(.largeTitle)
                .padding(.bottom, 60)
            
            Text("Come up with a function that takes an input string and reverses its order. For example, “I love coding!” should return “!gnidoc evol I”")
                .padding()
            
            TextField("type here", text: $string)
                .padding()
                .background(Color.gray.opacity(0.2).cornerRadius(10))
                .padding()
                .onChange(of: string) { newValue in
                    reverse(string: string)
                }
                
            if !string.isEmpty {
                HStack {
                    Text("Do you mean")
                    Text(reversed).underline()
                    Text("?")
                }
            }
        
            
        }
        .padding()
    }
    
    func reverse(string: String) {
        reversed = String(string.reversed())
    }
    
}

struct ReverseAString_Previews: PreviewProvider {
    static var previews: some View {
        ReverseAString()
    }
}
