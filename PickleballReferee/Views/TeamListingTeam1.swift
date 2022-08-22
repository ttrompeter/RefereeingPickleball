//
//  TeamListingTeam1.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import RealmSwift
import SwiftUI

struct TeamListingTeam1: View {
    
    @ObservedRealmObject var match: Match
    
    var body: some View {
        
        HStack {
            HStack {
                Text("Team 1:   ")
                    //.font(.headline)
                    .foregroundColor(Constants.DARK_SLATE)
                
                if match.games[match.currentGameNumber - 1].selectedFirstServerTeam1 == 1 {
                    Text("   \(match.namePlayer1Team1)   ")
                        //.font(.headline)
                        .foregroundColor(Constants.MINT_LEAF)
                } else {
                    Text("   \(match.namePlayer1Team1)   ")
                        //.font(.headline)
                        .foregroundColor(Constants.DARK_SLATE)
                }
            }
            .font(.headline)
            
            Text("[ \(match.player1Team1Identifiers) ]")
                .italic()
                .font(.subheadline)
                .foregroundColor(Constants.SLATE_GRAY)
            Text("     ||     ")
                .font(.headline)
                .foregroundColor(Constants.DARK_SLATE)
            
            if match.games[match.currentGameNumber - 1].selectedFirstServerTeam1 == 2 {
                Text("\(match.namePlayer2Team1)   ")
                    .font(.headline)
                    .foregroundColor(Constants.MINT_LEAF)
            } else {
                Text("\(match.namePlayer2Team1)   ")
                    .font(.headline)
                    .foregroundColor(Constants.DARK_SLATE)
            }
            
            Text("[ \(match.player2Team1Identifiers) ]")
                .italic()
                .font(.subheadline)
                .foregroundColor(Constants.SLATE_GRAY)
        }
        .padding(10)
        .background(Constants.CLOUDS)
    }
}

//struct TeamListingTeam1_Previews: PreviewProvider {
//    static var previews: some View {
//        TeamListingTeam1()
//    }
//}
