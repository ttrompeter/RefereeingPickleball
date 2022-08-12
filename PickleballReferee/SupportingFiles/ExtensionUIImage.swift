//
//  ExtensionUIImage.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/8/22.
//

import UIKit

extension UIImage {
    
    func saveToFile(atURL url: URL) {
        guard let data = self.pngData() else { return }
        do {
            try data.write(to: url)
            print("Screenshot saved at path \(url.absoluteString)")
        }
        catch (let error) {
            print("Error \(error.localizedDescription)")
        }
    }
    
    func saveToDocuments() {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        //let name = "match-\(Date().timeIntervalSince1970).png"
        let fileURL = paths[0].appendingPathComponent("match.png")
        saveToFile(atURL: fileURL)
    }
    
}

// Remove item using FileManger
//try fileManager.removeItem(atPath: filePath)
