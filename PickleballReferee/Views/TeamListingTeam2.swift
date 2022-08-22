//
//  TeamListingTeam2.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import RealmSwift
import SwiftUI

struct TeamListingTeam2: View {
    
    @ObservedRealmObject var match: Match
    
    var body: some View {
        
        HStack {
            HStack {
                Text("Team 2:   ")
                    .font(.headline)
                    .foregroundColor(Constants.DARK_SLATE)
                if match.games[match.currentGameNumber - 1].selectedFirstServerTeam2 == 3 {
                    Text("   \(match.namePlayer1Team2)   ")
                        .font(.headline)
                        .foregroundColor(Constants.MINT_LEAF)
                } else {
                    Text("   \(match.namePlayer1Team2)   ")
                        .font(.headline)
                        .foregroundColor(Constants.DARK_SLATE)
                }
            }
            
            Text("[ \(match.player1Team2Identifiers) ]")
                .italic()
                .font(.subheadline)
                .foregroundColor(Constants.SLATE_GRAY)
            Text("     ||     ")
                .font(.headline)
                .foregroundColor(Constants.DARK_SLATE)
            if match.games[match.currentGameNumber - 1].selectedFirstServerTeam2 == 4 {
                Text("   \(match.namePlayer2Team2)   ")
                    .font(.headline)
                    .foregroundColor(Constants.MINT_LEAF)
            } else {
                Text("   \(match.namePlayer2Team2)   ")
                    .font(.headline)
                    .foregroundColor(Constants.DARK_SLATE)
            }
            Text("[ \(match.player2Team2Identifiers) ]")
                .italic()
                .font(.subheadline)
                .foregroundColor(Constants.SLATE_GRAY)
        }
        .padding(10)
        .background(Constants.CLOUDS)
    }
}

//struct TeamListingTeam2_Previews: PreviewProvider {
//    static var previews: some View {
//        TeamListingTeam2()
//    }
//}
