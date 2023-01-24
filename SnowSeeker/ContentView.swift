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
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        if sizeClass == .compact {
            VStack(content: UserView.init)
        } else {
            HStack(content: UserView.init)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
