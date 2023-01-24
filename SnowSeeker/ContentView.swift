//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Orlando Moraes Martins on 24/01/23.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct ContentView: View {
    @State private var selectedUser: User? = nil
    @State private var isPresented = false
    
    var body: some View {
        Text("Hello World")
            .onTapGesture {
                selectedUser = User()
                isPresented = true
            }
            .alert("Welcome", isPresented: $isPresented, presenting: selectedUser) { user in
                Button(user.id) { }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
