//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Orlando Moraes Martins on 26/01/23.
//

import SwiftUI

struct ResortView: View {
    let resort: Resort
    
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.dynamicTypeSize) var typeSize
    
    @EnvironmentObject var favorites: Favorites
    
    @State private var selectedFacillity: Facility?
    @State private var showingFacility = false
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 0) {
                ZStack(alignment: .bottomTrailing){
                    Image(decorative: resort.id)
                        .resizable()
                        .scaledToFit()
                    
                    Text(resort.imageCredit)
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.2))
                        .cornerRadius(4)
   
                }
                
                HStack {
                    if sizeClass == .compact && typeSize > .large {
                        VStack(spacing: 10) { ResortDetailsView(resort: resort) }
                        VStack(spacing: 10) { SkiDetailView(resort: resort) }
                    } else {
                        ResortDetailsView(resort: resort)
                        SkiDetailView(resort: resort)
                    }
                    
                }
                .padding(.vertical)
                .background(Color.primary.opacity(0.1))
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                
                Group {
                    Text(resort.description)
                        .padding(.vertical)
                    
                    Text("Facilities")
                        .font(.headline)
                    
                    HStack{
                        ForEach(resort.facilityTypes) { facility in
                            Button {
                                selectedFacillity = facility
                                showingFacility = true
                            } label: {
                                facility.icon
                                    .font(.title)
                            }
                        }
                    }
                    
                    Button (favorites.contains(resort) ? "Remove from favorites" : "Add to favorites") {
                        if favorites.contains(resort){
                            favorites.remove(resort)
                        } else {
                            favorites.add(resort)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(selectedFacillity?.name ?? "More information", isPresented: $showingFacility, presenting: selectedFacillity) { _ in
        } message: { facility in
            Text(facility.description)
        }
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ResortView(resort: Resort.example)
        }
        .environmentObject(Favorites())
    }
}
