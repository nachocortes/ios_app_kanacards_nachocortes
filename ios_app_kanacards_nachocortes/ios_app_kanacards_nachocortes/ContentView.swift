//
//  ContentView.swift
//  ios_app_kanacards_nachocortes
//
//  Created by Nacho on 06/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var value = 1

    var body: some View {
        
        VStack() {
            
            Spacer()
                .frame(height: 50)

            
            Picker(selection: $value, label: Text("seleccion")) {
                Text("Hirigana")
                    .tag(1)
                Text("Katakana")
                    .tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .font(.largeTitle)
            .padding()
            
            Spacer()
                .frame(height: 100)

            
            Label(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)

            Spacer()
                .frame(height: 200)

            
            HStack() {
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Button")/*@END_MENU_TOKEN@*/
                }
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Button")/*@END_MENU_TOKEN@*/
                }

                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Button")/*@END_MENU_TOKEN@*/
                }
            }
            
            Spacer()
                .frame(height: 120)

            
            HStack() {
                
                Label(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
                
                Label(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
            }
            
            Spacer()
                .frame(height: 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
