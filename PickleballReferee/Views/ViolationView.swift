//
//  ViolationView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/21/22.
//

import RealmSwift
import SwiftUI

struct ViolationView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var sheetManager: SheetManager
    @ObservedRealmObject var match: Match
    
    var body: some View {
        Text("Violation")
    }
}

struct ViolationView_Previews: PreviewProvider {
    static var previews: some View {
        ViolationView(match: Match())
    }
}
