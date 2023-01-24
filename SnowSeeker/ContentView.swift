//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Orlando Moraes Martins on 24/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("New secondary")
            } label: {
                Text("Hello World")
            }
                .navigationTitle("Primary")
            
            Text("Secondary")
            
            Text("Terceira")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
