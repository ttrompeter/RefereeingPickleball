//
//  Match.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import RealmSwift
import SwiftUI

class Match: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var eventTitle = ""
    @Persisted var matchNumber = ""
    @Persisted var matchDate = Date()
    @Persisted var matchLocation = ""
    @Persisted var courtNumber = ""
    @Persisted var selectedMatchFormat = 2
    @Persisted var selectedDoublesPlay = 2
    @Persisted var selectedGameFormat = 11
    @Persisted var matchNotes = ""
    @Persisted var matchRefereeRemarks = ""
    @Persisted var namePlayer1Team1 = ""
    @Persisted var namePlayer2Team1 = ""
    @Persisted var namePlayer1Team2 = ""
    @Persisted var namePlayer2Team2 = ""
    @Persisted var player1Team1Identifiers = ""
    @Persisted var player2Team1Identifiers = ""
    @Persisted var player1Team2Identifiers = ""
    @Persisted var player2Team2Identifiers = ""
    @Persisted var matchWinner = ""
    @Persisted var isSecondServer = true
    @Persisted var isTeam1Serving = true
    @Persisted var isMatchSetup = false
    @Persisted var whoIsServingText = "1st Server"
    @Persisted var servingPlayerNumber = 1
    @Persisted var currentGameNumber = 1
    @Persisted var isMatchCompleted = false
    @Persisted var isMatchStarted = false
    @Persisted var selectedTestValue = ""
    @Persisted var selectedGameStartingServer = 0

    @Persisted var games = RealmSwift.List<Game>()
    
    
    
    var matchFormatDescription: String {
        switch selectedMatchFormat {
        case 1:
            return "Single game"
        case 2:
            return "Best 2 out of 3 games"
        case 3:
            return "Best 3 out of 5 games"
        default:
            print("Error selecting matchFormatDescription.")
            return "Unknown Match Format"
        }
    }
    
    var gameFormatDescription: String {
        switch selectedGameFormat {
        case 7:
            return "7 points, win by 2 points"
        case 11:
            return "11 points, win by 2 points"
        case 15:
            return "15 points, win by 2 points"
        case 21:
            return "21 points, win by 2 points"
        default:
            print("Error selecting gameFormatDescription.")
            return "Unknown Game Format"
        }
    }
    
    var matchStyleDescription: String {
        switch selectedDoublesPlay {
        case 1:
            return "Doubles"
        case 2:
            return "Singles"
        default:
            print("Error selecting gameFormatDescription.")
            return "Unknown Match Style"
        }
    }
    
    
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}

