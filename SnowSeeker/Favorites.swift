//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Orlando Moraes Martins on 27/01/23.
//

import Foundation

class Favorites: ObservableObject {
    private var resorts = Set<String>()
    private let saveKey = "Favorites.json"
    
    init(){
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let url = documentsDirectory.appendingPathComponent(saveKey)
        
        guard let data = try? Data(contentsOf: url) else { return }
        
        do {
            let decodedData = try JSONDecoder().decode([String].self, from: data)
            resorts = Set(decodedData)
        } catch {
            print("Error while decoding file \(error.localizedDescription)")
            resorts = []
        }
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save()  {
        guard let data = try? JSONEncoder().encode(resorts) else { return }
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let url = documentsDirectory.appendingPathComponent(saveKey)
        
        do {
            try data.write(to: url)
        } catch {
            print("Error while saving the file \(error.localizedDescription)")
        }
        
    }
}
