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
    
    @Persisted var asstRefereeName = ""
    @Persisted var gameDuration = 0.0
    @Persisted var gameEndDateValue = Date.now
    @Persisted var gameFinalScore = "N/A"
    @Persisted var gameFirstServerName = "Adam Rocafeller"  // Should be Undetermined
    @Persisted var gameFirstServerPlayerNumber = 1  // Should be 0 as default
    @Persisted var gameNumber = 0
    @Persisted var gameStartDateValue = Date.now
    @Persisted var gameWinner = ""
    @Persisted var gameWinningTeam = 0
    @Persisted var isGameCompleted = false
    @Persisted var lineJudge1Name = ""
    @Persisted var lineJudge2Name = ""
    @Persisted var lineJudge3Name = ""
    @Persisted var lineJudge4Name = ""
    @Persisted var penaltiessTeam1 = 0
    @Persisted var penaltiessTeam2 = 0
    //@Persisted var player2Points = 0
    //@Persisted var player3Points = 0
    //@Persisted var player4Points = 0
    @Persisted var player1Points = 0
    @Persisted var player2Points = 0
    @Persisted var player3Points = 0
    @Persisted var player4Points = 0
    @Persisted var refereeName = "Buddy Vistok"  // Should be ""
    @Persisted var selectedFirstServerTeam1 = 1     // Should be 0 as default
    @Persisted var selectedFirstServerTeam2 = 4     // Should be 0 as default
    @Persisted var sideOutsTeam1 = 0
    @Persisted var sideOutsTeam2 = 0
    @Persisted var timeOutsTeam1 = 0
    @Persisted var timeOutsTeam2 = 0
    @Persisted var traineeName = ""
    @Persisted var warningsTeam1 = 0
    @Persisted var warningsTeam2 = 0
    
    @Persisted(originProperty: "games") var match: LinkingObjects<Match>
    
    var gameComputedDuration: Double {
        if isGameCompleted {
            let gameDurationSeconds = gameStartDateValue.distance(to: gameEndDateValue)
            return (gameDurationSeconds / 60)
        } else {
            print("isCompleted is false in matchComputedDuration so can't provide useful result.")
            return 0.0
        }
        
    }
    
    var gameScoreTeam1: Int {
        player1Points + player2Points
    }
    
    var gameScoreTeam2: Int {
        player3Points + player4Points
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
    
    var winningPointValue: Int {
        var winningPointStr = "0"
        let fullScore = gameFinalScore
        var components = fullScore.components(separatedBy: " - ")
        if components.count > 0 {
            winningPointStr = components.removeFirst()
        } else {
            print("Error determining winningPointValuein Game object.")
        }
        return Int(winningPointStr)!
    }
    
    // Add Example Data
    static let exampleGame = Game()
    
    // Change Equatable test to only test on id since it is unique. Makes code faster
    static func ==(lhs: Game, rhs: Game) -> Bool {
        lhs.id == rhs.id
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }

}
