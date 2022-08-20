//
//  NavigationButtonsView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//
import RealmSwift
import SwiftUI

struct FunctionalityButtonsView: View {
    
    @ObservedRealmObject var match: Match
    
    var body: some View {
        
        VStack  {
            Spacer()
            TopButtonsView(match: match)
            VStack (spacing: 1) {
                if !match.isServingLeftSide {
                    Image(systemName: "arrow.right.square")
                        .font(.system(size: 90))
                }
                //else if orientation.type == .landscapeLeft {
                else if match.isServingLeftSide {
                    Image(systemName: "arrow.left.square")  // Left arrow
                        .font(.system(size: 90))
                } else {
                    Image(systemName: "arrow.clockwise")  // Left arrow
                        .font(.system(size: 90))
                }
            }
            BottomButtonsView(match: match)
            Spacer()
        }
    }
}

struct FunctionalityButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        FunctionalityButtonsView(match: Match())
    }
}
