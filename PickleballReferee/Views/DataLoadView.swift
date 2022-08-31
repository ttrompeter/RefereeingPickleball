//
//  DataLoadView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/30/22.
//

import RealmSwift
import SwiftUI

struct DataLoadView: View {
    
    @Environment(\.realm) var realm
    @EnvironmentObject var scoresheetManager: ScoresheetManager
    @State private var isShowWelcome = false
    @State private var isIncompleteMatch = false
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Gaday")
                if isIncompleteMatch {
                    // Use the existing Match that is not completed
                    NavigationLink(destination: WelcomeView(match: realm.objects(Match.self).where {$0.isMatchCompleted == false}.first!).environmentObject(scoresheetManager), isActive: $isShowWelcome) { }
                } else {
                    // Create a new empty Match in environment
                    NavigationLink(destination: WelcomeView(match: Match()).environmentObject(scoresheetManager), isActive: $isShowWelcome) { }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .onAppear {
                $isShowWelcome.wrappedValue = true
                let activeMatch = realm.objects(Match.self).where {$0.isMatchCompleted == false}.first!
                if activeMatch != nil {
                    
                }
                if activeMatch.isMatchCompleted == false {
                    print("     Active match: \(activeMatch.id)")
                    $isIncompleteMatch.wrappedValue = true
                }
            }
        }  // End NavigationView
        .navigationViewStyle(.stack)
        .statusBar(hidden: true)
    }
}

struct DataLoadView_Previews: PreviewProvider {
    static var previews: some View {
        DataLoadView()
    }
}


//NavigationView {
//            VStack {
//                Text("Waiting...")
//
//                NavigationLink(destination: Text("Red"), tag: .red, selection: $pushed) {
//                    EmptyView()
//                }
//
//                NavigationLink(destination: Text("Green"), tag: .green, selection: $pushed) {
//                    EmptyView()
//                }
//            }
//        }
//        .onAppear() {
//            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
//                self.pushed = .green
//            }
//        }
