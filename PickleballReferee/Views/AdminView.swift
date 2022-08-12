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
            SnapshotAdminView(match: match)
                .tabItem {
                    Label("Snapshot", systemImage: "camera")
                }
            SettingsAdminView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            StatisticAdminView()
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
