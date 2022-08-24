//
//  MatchOver.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/23/22.
//

import RealmSwift
import SwiftUI

struct MatchOverView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var sheetManager: SheetManager
    @ObservedRealmObject var match: Match
    
    var body: some View {
        Text("Match Over")
    }
}

struct MatchOverView_Previews: PreviewProvider {
    static var previews: some View {
        MatchOverView(match: Match())
    }
}
