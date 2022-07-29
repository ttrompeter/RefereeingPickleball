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
    @Persisted var boxDimensions = 30  // Needs to be a CGFloat - CGFloat(30)
    @Persisted var eventTitle = ""
    @Persisted var matchNumber = ""
    @Persisted var matchDate = Date()
    @Persisted var matchLocation = ""
    @Persisted var selectedMatchFormat = 1
    @Persisted var selectedDoublesPlay = "Doubles"
    @Persisted var selectedFirstServeTeam = "Team 1"
    @Persisted var selectedGameFormat = 1
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
    @Persisted var matchStartingServer = "Team 1"
    @Persisted var isSecondServer = false
    @Persisted var isTeam1Serving = true
    @Persisted var isMatchSetup = false
    @Persisted var isStaringServer = true
    @Persisted var whoIsServingText = "1st Server"
    @Persisted var gameNumber = 1

    @Persisted var games: RealmSwift.List<Game> = RealmSwift.List<Game>()
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}
