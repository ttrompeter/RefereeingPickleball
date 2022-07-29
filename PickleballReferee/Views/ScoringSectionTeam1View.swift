//
//  ScoringSectionTeam1View.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import SwiftUI

struct ScoringSectionTeam1View: View {
    var body: some View {
        
        HStack (alignment: .top, spacing: 0) {
            
            // Point Scoring column
            VStack (spacing: 0) {

                VStack (spacing: 0) {
                    PointsScoringTitlesView()
                    PointsFirstRowTeam1View()
                    PointsSecondRowTeam1View()
                    PointsThirdRowTeam1View()
                }
            }
        }
    }
}

struct ScoringSectionTeam1View_Previews: PreviewProvider {
    static var previews: some View {
        ScoringSectionTeam1View()
    }
}
