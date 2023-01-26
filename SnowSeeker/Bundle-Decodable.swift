//
//  Bundle-Decodable.swift
//  SnowSeeker
//
//  Created by Orlando Moraes Martins on 25/01/23.
//

import Foundation


extension Bundle{
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url  = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate the \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load the \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed decode \(file) from bundle ")
        }
        
        return loadedData
    }
}
