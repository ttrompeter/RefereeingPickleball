//
//  PickleballRefereeApp.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import SwiftUI

@main
struct PickleballRefereeApp: App {
    
    // Environment Objects so can pass throughout project using environmentObject
    @StateObject var realmManager = RealmManager()
    @StateObject var sheetManager = SheetManager()
    //@StateObject var timerWrapper = TimerWrapper()
    var scoresheetManager = ScoresheetManager()
    
    var body: some Scene {
        WindowGroup {
            DataLoadView()
                .environmentObject(sheetManager)
                .environmentObject(scoresheetManager)
                .environmentObject(realmManager)
                .onAppear {
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
                    
                    // Get path to Realm database in SwiftUI - NOW DONE in RealmManger so don't repeat it here
                    //print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
                }
        }
    }
}
