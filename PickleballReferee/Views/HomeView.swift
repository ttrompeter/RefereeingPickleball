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
    @EnvironmentObject var sheetManager: SheetManager
    @EnvironmentObject var scoresheetManager: ScoresheetManager
    
    var body: some View {
        
        VStack (alignment: .leading) {
            HStack {
                if !scoresheetManager.isShowArchive {
                    MatchView(match: match)
                } else {
                    ArchiveView()
                }
                FunctionalityButtonsView(match: match)
                VStack {
                    // Far right column for spacing
                    Text("     ")
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

// Button(" + ") {
//   withAnimation (.spring()) {
//       sheetManager.present(with: .init(systemName: "info", title: "Title Text", content: "Some text to show the user in the popup so that they can be informed and learn something from the whole process."))
//   }
// }
//            .popup(with: sheetManager)
