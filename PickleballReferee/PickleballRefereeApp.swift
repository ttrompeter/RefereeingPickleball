//
//  PickleballRefereeApp.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import SwiftUI

@main
struct PickleballRefereeApp: App {
    
    var body: some Scene {
        WindowGroup {
            WelcomeView(match: Match())
                .onAppear {
                    // Get path to Realm database in SwiftUI
                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
                     // Stop layout conflict messages
                      UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
