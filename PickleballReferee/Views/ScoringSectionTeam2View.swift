//
//  ScoringSectionTeam2View.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import RealmSwift
import SwiftUI

struct ScoringSectionTeam2View: View {
    
    @ObservedRealmObject var match: Match
    
    var body: some View {
        
        HStack (alignment: .top, spacing: 0) {
            // Point Scoring column
            VStack (spacing: 0) {
                VStack (spacing: 0) {
                    PointsScoringTitlesView()
                    PointsFirstRowTeam2View()
                    PointsSecondRowTeam2View()
                    PointsThirdRowTeam2View()
                    ChangeMarkSideView(match: match)
                }
            }
        }
    }
}

struct ScoringSectionTeam2View_Previews: PreviewProvider {
    static var previews: some View {
        ScoringSectionTeam2View(match: Match())
    }
}