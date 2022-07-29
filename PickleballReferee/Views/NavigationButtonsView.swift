//
//  NavigationButtonsView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//
import RealmSwift
import SwiftUI

struct NavigationButtonsView: View {
    
    @ObservedRealmObject var match: Match
    //@State private var isTeam1Serving = true
    
    var body: some View {
        
        VStack  {
            Spacer()
            
            TopButtonsView(match: match)
            
            VStack (spacing: 1) {
                if match.isTeam1Serving {
                    Image(systemName: "arrow.right.square")
                        .font(.system(size: 90))
                }
                //else if orientation.type == .landscapeLeft {
                else if !match.isTeam1Serving {
                    Image(systemName: "arrow.left.square")  // Left arrow
                        .font(.system(size: 90))
                } else {
                    Image(systemName: "arrow.clockwise")  // Left arrow
                        .font(.system(size: 90))
                }
            }
            
            BottomButtonsView()
            
            Spacer()
        }
    }
}

struct NavigationButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButtonsView(match: Match())
    }
}
