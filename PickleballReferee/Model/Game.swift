//
//  Game.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import RealmSwift
import SwiftUI

class Game: Object, ObjectKeyIdentifiable {

    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var gameNumber = 0
    @Persisted var player1Team1Points = 0
    @Persisted var player2Team1Points = 0
    @Persisted var player1Team2Points = 0
    @Persisted var player2Team2Points = 0
    @Persisted var refereeName = ""
    @Persisted var asstRefereeName = ""
    @Persisted var traineeName = ""
    @Persisted var lineJudge1Name = ""
    @Persisted var lineJudge2Name = ""
    @Persisted var lineJudge3Name = ""
    @Persisted var lineJudge4Name = ""
    @Persisted var courtNumber = ""
    @Persisted var selectedFirstServeTeam = ""
    @Persisted var timeOutsTeam1 = 0
    @Persisted var timeOutsTeam2 = 0
    //@Persisted var servingTeam = 1    // This is handled by isTeam1Serving in Match
    //@Persisted var serverNumber = 2   // This is handled by isSecondServer in Match
    //@Persisted var whoIsServingText = "2nd Server"  // This is in Match ad duplicate
    @Persisted var isGameCompleted = false
    @Persisted var isGameStartingServer = true

    @Persisted var gameScoreImages: GameScoreImages?

    @Persisted(originProperty: "games") var match: LinkingObjects<Match>
                                                                    
    var gameScoreTeam1: Int {
        player1Team1Points + player2Team1Points
    }

    var gameScoreTeam2: Int {
        player1Team2Points + player2Team2Points
    }
    
    var finalScoreWinningTeam: Int {
        if isGameCompleted {
            if gameScoreTeam1 > (gameScoreTeam2 + 1) {
                return gameScoreTeam1
            } else {
                return gameScoreTeam2
            }
        }
        return 0
    }
    
    var finalScoreLosingTeam: Int {
        if isGameCompleted {
            if (gameScoreTeam1 + 1) < gameScoreTeam2 {
                return gameScoreTeam1
            } else {
                return gameScoreTeam2
            }
        }
        return 0
    }

    // Add Example Data
    static let example = Game()

    // Change Equatable test to only test on id since it is unique. Makes code faster
    static func ==(lhs: Game, rhs: Game) -> Bool {
        lhs.id == rhs.id
    }

    override class func primaryKey() -> String? {
      return "id"
    }
}
