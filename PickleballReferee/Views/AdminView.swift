//
//  MapView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import SwiftUI

struct AdminView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        TabView {
            SnapshotAdminView()
                .tabItem {
                    Label("Snapshot", systemImage: "list.dash")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "list.dash")
                }
            StatisticsView()
                .tabItem {
                    Label("Statistics", systemImage: "list.dash")
                }
        }
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        AdminView()
//    }
//}
