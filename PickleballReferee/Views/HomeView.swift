//
//  HomeView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//
import RealmSwift
import SwiftUI

struct HomeView: View {
    
    @Environment(\.realm) var realm
    @ObservedRealmObject var match: Match
    
    
    // **********************************************************************************************
    // This section gets path to realm database for use by Realm Studio
    // Display the path to the Realm database files in the console
    //let realmPath: () = print("Realm database files path: \(Realm.Configuration.defaultConfiguration.fileURL!)")
    
    // Find path another way
    // po Realm.Configuration.defaultConfiguration.fileURL
    // **********************************************************************************************
    
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            if match.isTeam1Serving {
                HStack {
                    MatchView(match: match)
                    NavigationButtonsView(match: match)
                    VStack {
                        // Far right column for spacing
                        Text("     ")
                    }
                }
            } else if !match.isTeam1Serving {
                HStack {
                    VStack {
                        // Far left column for spacing
                        Text("     ")
                    }
                    NavigationButtonsView(match: match)
                    MatchView(match: match)
                }
            }
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(match: Match())
//    }
//}
