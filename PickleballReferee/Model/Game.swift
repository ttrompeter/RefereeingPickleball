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
    @Persisted var timeOutsTeam1 = 0
    @Persisted var timeOutsTeam2 = 0
    @Persisted var isGameCompleted = false
    //@Persisted var selectedGameFirstServer = 0
    
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
    
    
    // Images for game 1 Team 1 points boxes - default values
    @Persisted var point1Game1ImageTm1 = "squareleft"
    @Persisted var point2Game1ImageTm1 = "squareleft"
    @Persisted var point3Game1ImageTm1 = "squareleft"
    @Persisted var point4Game1ImageTm1 = "squareleft"
    @Persisted var point5Game1ImageTm1 = "squareleft"
    @Persisted var point6Game1ImageTm1 = "squareleft"
    @Persisted var point7Game1ImageTm1 = "squareleft"
    @Persisted var point8Game1ImageTm1 = "squareleft"
    @Persisted var point9Game1ImageTm1 = "squareleft"
    @Persisted var point10Game1ImageTm1 = "squareleft"
    @Persisted var point11Game1ImageTm1 = "squareleft"
    @Persisted var point12Game1ImageTm1 = "squareleft"
    @Persisted var point13Game1ImageTm1 = "squareleft"
    @Persisted var point14Game1ImageTm1 = "squareleft"
    @Persisted var point15Game1ImageTm1 = "squareleft"
    @Persisted var point16Game1ImageTm1 = "squareleft"
    @Persisted var point17Game1ImageTm1 = "squareleft"
    @Persisted var point18Game1ImageTm1 = "squareleft"
    @Persisted var point19Game1ImageTm1 = "squareleft"
    @Persisted var point20Game1ImageTm1 = "squareleft"
    @Persisted var point21Game1ImageTm1 = "square"
    
    // Images for game 1 Team 2 points boxes - default values
    @Persisted var point1Game1ImageTm2 = "squareleft"
    @Persisted var point2Game1ImageTm2 = "squareleft"
    @Persisted var point3Game1ImageTm2 = "squareleft"
    @Persisted var point4Game1ImageTm2 = "squareleft"
    @Persisted var point5Game1ImageTm2 = "squareleft"
    @Persisted var point6Game1ImageTm2 = "squareleft"
    @Persisted var point7Game1ImageTm2 = "squareleft"
    @Persisted var point8Game1ImageTm2 = "squareleft"
    @Persisted var point9Game1ImageTm2 = "squareleft"
    @Persisted var point10Game1ImageTm2 = "squareleft"
    @Persisted var point11Game1ImageTm2 = "squareleft"
    @Persisted var point12Game1ImageTm2 = "squareleft"
    @Persisted var point13Game1ImageTm2 = "squareleft"
    @Persisted var point14Game1ImageTm2 = "squareleft"
    @Persisted var point15Game1ImageTm2 = "squareleft"
    @Persisted var point16Game1ImageTm2 = "squareleft"
    @Persisted var point17Game1ImageTm2 = "squareleft"
    @Persisted var point18Game1ImageTm2 = "squareleft"
    @Persisted var point19Game1ImageTm2 = "squareleft"
    @Persisted var point20Game1ImageTm2 = "squareleft"
    @Persisted var point21Game1ImageTm2 = "square"
    
}
