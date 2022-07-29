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
            HomeView(match: Match())
        }
    }
}
