//
//  FizzBuzz.swift
//  CodingChallenges
//
//  Created by Rhency Delgado on 4/8/23.
//

import SwiftUI

struct FizzBuzz: View {
    
    @State var showFizz: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            
            Text("Fizz Buzz")
                .font(.largeTitle)
                .padding(.bottom, 40)
            
            VStack(spacing: 10) {
                Text("Need to write a program that prints the numbers from 1 to 100 such that:")
                    .padding(.bottom)
                
                Text("If the number is a multiple of 3, you need to print 'Fizz' instead of that number")
                    .padding(.bottom, 5).padding(.horizontal)
                Text("If the number is a multiple of 5, you need to print 'Buzz' instead of that number")
                    .padding(.bottom, 5).padding(.horizontal)
                Text("If the number is a multiple of both 3 and 5, you need to print 'FizzBuzz' instead of that number.")
                    .padding(.horizontal, 20)
            }
            
            
            if showFizz {
                print()
            }
            
            
            Spacer()
            
            Button("Get FizzBuzz!") {
                showFizz.toggle()
            }
            .font(.callout)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(20)
            .padding()
            
        }
    }
    
    func print() -> some View {
        
        ScrollView {
            
            HStack {
                
                VStack(alignment: .leading) {
                    
                    Text("FizBuzz List").underline()
                    
                    ForEach(1..<101) { i in
                        if i%3 == 0 && i%5 == 0 {
                            Text("FizzBuzz")
                        } else if i%3 == 0 {
                            Text("Fizz")
                        } else if i%5 == 0 {
                            Text("Buzz")
                        } else {
                            Text("\(i)")
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                VStack {
                    Text("List 1 to 100").underline()
                    ForEach(1..<101) { i in
                        Text("\(i)")
                    }
                }
                
            }
            .padding(.horizontal, 50)
        }
        
    }
}

struct FizzBuzz_Previews: PreviewProvider {
    static var previews: some View {
        FizzBuzz()
    }
}
