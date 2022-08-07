//
//  ScoringSectionTeam1View.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import RealmSwift
import SwiftUI

struct ScoringSectionTeam1View: View {
    
    @ObservedRealmObject var match: Match
    
    var body: some View {
        
        HStack (alignment: .top, spacing: 0) {
            
            // Point Scoring column
            VStack (spacing: 0) {

                VStack (spacing: 0) {
                    PointsScoringTitlesView()
                    PointsFirstRowTeam1View(match: match)
                    PointsSecondRowTeam1View(match: match)
                    PointsThirdRowTeam1View(match: match)
                    if match.selectedMatchFormat == 3 {
                        PointsFourthRowTeam1View(match: match)
                        PointsFifthRowTeam1View(match: match)
                    }
                    ChangeMarkSideView(match: match)
                }
            }
        }
    }
}

struct ScoringSectionTeam1View_Previews: PreviewProvider {
    static var previews: some View {
        ScoringSectionTeam1View(match: Match())
    }
}
