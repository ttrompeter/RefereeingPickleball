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
                    
                    /*
                     The app provides for printing the scoresheet so it can be turned in just like a paper scorsheet.
                     This is done by first taking a screenshot of the scoresheet page and then allowing the user to
                     print or email the screenshot image. The app also provides for making a screenshot of the statistics
                     page. It too can then by printed or emailed.
                     These images are maintained in the documents directory and there is only one of each. Every time a
                     new screenshot is taken, it replaces the prior one.
                     Here save a sample_scorsheet.png and a sample_statistics.png to fileManager from the project assets directory.
                     These samples will be used until they are replaced by screenshots of the live pages during a match.
                     
                     */
                    
                    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                    let scoresheetImageFileURL = paths[0].appendingPathComponent("scoresheet.png")
                    let scoresheetImagePngRepresentation = UIImage(named: "sample_scoresheet.png")!.pngData()
                    let statisticsImageFileURL = paths[0].appendingPathComponent("statistics.png")
                    let statisticsImagePngRepresentation = UIImage(named: "sample_statistics.png")!.pngData()
                    do {
                        try scoresheetImagePngRepresentation!.write(to: scoresheetImageFileURL, options: .atomic)
                        try statisticsImagePngRepresentation!.write(to: statisticsImageFileURL, options: .atomic)
                    } catch {
                        print("Error saving image to fileSystem: \(error.localizedDescription)")
                    }
                    

//                    let scoresheetImageFileURL = paths[0].appendingPathComponent("sample_scoresheet.png")
//                    let scoresheetImagePngRepresentation = UIImage(named: "sample_scoresheet.png")!.pngData()
//                    let statisticsImageFileURL = paths[0].appendingPathComponent("sample_statistics.png")
//                    let statisticsImagePngRepresentation = UIImage(named: "sample_statistics.png")!.pngData()
                    
                    // Get path to Realm database in SwiftUI - NOW DONE in RealmManger so don't repeat it here
                    //print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
                }
        }
    }
}
