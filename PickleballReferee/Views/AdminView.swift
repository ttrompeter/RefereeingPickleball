//
//  MapView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import RealmSwift
import SwiftUI

struct AdminView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedRealmObject var match: Match
    
    var body: some View {
        
        TabView {
            ScreenshotAdminView(match: match)
                .tabItem {
                    Label("Screenshot", systemImage: "camera")
                }
            SettingsAdminView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            StatisticAdminView(match: match)
                .tabItem {
                    Label("Statistics", systemImage: "list.bullet")
                }
        }
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        AdminView()
//    }
//}
