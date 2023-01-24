//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Orlando Moraes Martins on 24/01/23.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Orlando Gabriel")
            Text("Country: Brazil")
            Text("Pet: Nikita")
        }
    }
}

struct ContentView: View {
    @State private var layoutVertically = false
    
    var body: some View {
        Group{
            if layoutVertically {
                VStack{
                    UserView()
                }
            } else {
                HStack{
                    UserView()
                }
            }
        }
        .onTapGesture {
            layoutVertically.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
