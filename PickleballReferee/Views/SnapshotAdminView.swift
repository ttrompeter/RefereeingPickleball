//
//  SnapshotAdminView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/8/22.
//

import SwiftUI

struct SnapshotAdminView: View {
    
    var body: some View {
        
        VStack {
            
            Text("View Snapshot of Match")
                .padding()
            
            Text("Email Snapshot of Match")
                .padding()
            
            
            Text("Print Snapshot of Match")
                .padding()
            
            
        }  // End Top VStack
        
    }
}

struct SnapshotAdminView_Previews: PreviewProvider {
    static var previews: some View {
        SnapshotAdminView()
    }
}
