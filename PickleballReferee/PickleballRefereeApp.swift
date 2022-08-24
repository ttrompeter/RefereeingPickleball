//
//  PickleballRefereeApp.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import SwiftUI

@main
struct PickleballRefereeApp: App {
    
    // Object so can pass it using environmentObject
    @StateObject var sheetManager = SheetManager()

    
    var body: some Scene {
        WindowGroup {
            WelcomeView(match: Match())
                .environmentObject(sheetManager)
                .onAppear {
                    // Get path to Realm database in SwiftUI
                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
                    
                    // Stop layout conflict messages
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                    
                    // Save sample_scorsheet.png to fileManager from the project assets directory
                    // It will be used in the Admin Scorsheet snapshot page
                    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                    let fileURL = paths[0].appendingPathComponent("sample_scoresheet.png")
                    let pngRepresentation = UIImage(named: "sample_scoresheet.png")!.pngData()
                    do {
                        try pngRepresentation!.write(to: fileURL, options: .atomic)
                    } catch {
                        print("Error saving image to fileSystem: \(error.localizedDescription)")
                    }
                }
        }
    }
    
}
