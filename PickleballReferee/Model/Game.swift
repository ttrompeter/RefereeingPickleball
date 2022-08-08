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
    @Persisted var isGameWinner = false
    @Persisted var gameWinner = ""
    @Persisted var gameWinnerTeam = 0
    @Persisted var isGameCompleted = false
    @Persisted var gameFinalScore = ""
    @Persisted var gameStartingServerName = "Adam Rockafeller" // Should be Undetermined
    @Persisted var gameStartingServerNumber = 0
    @Persisted var serverNameGame1Team1 = "Tm1Game1"
    @Persisted var serverNameGame2Team1 = "Tm1Game2"
    @Persisted var serverNameGame3Team1 = "Tm1Game3"
    @Persisted var serverNameGame4Team1 = ""
    @Persisted var serverNameGame5Team1 = ""
    @Persisted var serverNameGame1Team2 = "Tm2Game1"
    @Persisted var serverNameGame2Team2 = "Tm2Game2"
    @Persisted var serverNameGame3Team2 = "Tm2Game3"
    @Persisted var serverNameGame4Team2 = ""
    @Persisted var serverNameGame5Team2 = ""
    
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
    static let exampleGame = Game()
    
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
    
    // Images for game 2 Team 1 points boxes - default values
    @Persisted var point1Game2ImageTm1 = "squaremiddleleft"
    @Persisted var point2Game2ImageTm1 = "squaremiddleleft"
    @Persisted var point3Game2ImageTm1 = "squaremiddleleft"
    @Persisted var point4Game2ImageTm1 = "squaremiddleleft"
    @Persisted var point5Game2ImageTm1 = "squaremiddleleft"
    @Persisted var point6Game2ImageTm1 = "squaremiddleleft"
    @Persisted var point7Game2ImageTm1 = "squaremiddleleft"
    @Persisted var point8Game2ImageTm1 = "squaremiddleleft"
    @Persisted var point9Game2ImageTm1 = "squaremiddleleft"
    @Persisted var point10Game2ImageTm1 = "squaremiddleleft"
    @Persisted var point11Game2ImageTm1 = "squaremiddleleft"
    @Persisted var point12Game2ImageTm1 = "squaremiddleleft"
    @Persisted var point13Game2ImageTm1 = "squaremiddleleft"
    @Persisted var point14Game2ImageTm1 = "squaremiddleleft"
    @Persisted var point15Game2ImageTm1 = "squaremiddleleft"
    @Persisted var point16Game2ImageTm1 = "squaremiddleleft"
    @Persisted var point17Game2ImageTm1 = "squaremiddleleft"
    @Persisted var point18Game2ImageTm1 = "squaremiddleleft"
    @Persisted var point19Game2ImageTm1 = "squaremiddleleft"
    @Persisted var point20Game2ImageTm1 = "squaremiddleleft"
    @Persisted var point21Game2ImageTm1 = "squaremiddleright"
    
    // Images for game 3 Team 1 points boxes - default values
    @Persisted var point1Game3ImageTm1 = "squareleft"
    @Persisted var point2Game3ImageTm1 = "squareleft"
    @Persisted var point3Game3ImageTm1 = "squareleft"
    @Persisted var point4Game3ImageTm1 = "squareleft"
    @Persisted var point5Game3ImageTm1 = "squareleft"
    @Persisted var point6Game3ImageTm1 = "squareleft"
    @Persisted var point7Game3ImageTm1 = "squareleft"
    @Persisted var point8Game3ImageTm1 = "squareleft"
    @Persisted var point9Game3ImageTm1 = "squareleft"
    @Persisted var point10Game3ImageTm1 = "squareleft"
    @Persisted var point11Game3ImageTm1 = "squareleft"
    @Persisted var point12Game3ImageTm1 = "squareleft"
    @Persisted var point13Game3ImageTm1 = "squareleft"
    @Persisted var point14Game3ImageTm1 = "squareleft"
    @Persisted var point15Game3ImageTm1 = "squareleft"
    @Persisted var point16Game3ImageTm1 = "squareleft"
    @Persisted var point17Game3ImageTm1 = "squareleft"
    @Persisted var point18Game3ImageTm1 = "squareleft"
    @Persisted var point19Game3ImageTm1 = "squareleft"
    @Persisted var point20Game3ImageTm1 = "squareleft"
    @Persisted var point21Game3ImageTm1 = "square"
    
    // Images for game 4 Team 1 points boxes - default values
    @Persisted var point1Game4ImageTm1 = "squareleft"
    @Persisted var point2Game4ImageTm1 = "squareleft"
    @Persisted var point3Game4ImageTm1 = "squareleft"
    @Persisted var point4Game4ImageTm1 = "squareleft"
    @Persisted var point5Game4ImageTm1 = "squareleft"
    @Persisted var point6Game4ImageTm1 = "squareleft"
    @Persisted var point7Game4ImageTm1 = "squareleft"
    @Persisted var point8Game4ImageTm1 = "squareleft"
    @Persisted var point9Game4ImageTm1 = "squareleft"
    @Persisted var point10Game4ImageTm1 = "squareleft"
    @Persisted var point11Game4ImageTm1 = "squareleft"
    @Persisted var point12Game4ImageTm1 = "squareleft"
    @Persisted var point13Game4ImageTm1 = "squareleft"
    @Persisted var point14Game4ImageTm1 = "squareleft"
    @Persisted var point15Game4ImageTm1 = "squareleft"
    @Persisted var point16Game4ImageTm1 = "squareleft"
    @Persisted var point17Game4ImageTm1 = "squareleft"
    @Persisted var point18Game4ImageTm1 = "squareleft"
    @Persisted var point19Game4ImageTm1 = "squareleft"
    @Persisted var point20Game4ImageTm1 = "squareleft"
    @Persisted var point21Game4ImageTm1 = "square"
    
    // Images for game 5 Team 1 points boxes - default values
    @Persisted var point1Game5ImageTm1 = "squareleft"
    @Persisted var point2Game5ImageTm1 = "squareleft"
    @Persisted var point3Game5ImageTm1 = "squareleft"
    @Persisted var point4Game5ImageTm1 = "squareleft"
    @Persisted var point5Game5ImageTm1 = "squareleft"
    @Persisted var point6Game5ImageTm1 = "squareleft"
    @Persisted var point7Game5ImageTm1 = "squareleft"
    @Persisted var point8Game5ImageTm1 = "squareleft"
    @Persisted var point9Game5ImageTm1 = "squareleft"
    @Persisted var point10Game5ImageTm1 = "squareleft"
    @Persisted var point11Game5ImageTm1 = "squareleft"
    @Persisted var point12Game5ImageTm1 = "squareleft"
    @Persisted var point13Game5ImageTm1 = "squareleft"
    @Persisted var point14Game5ImageTm1 = "squareleft"
    @Persisted var point15Game5ImageTm1 = "squareleft"
    @Persisted var point16Game5ImageTm1 = "squareleft"
    @Persisted var point17Game5ImageTm1 = "squareleft"
    @Persisted var point18Game5ImageTm1 = "squareleft"
    @Persisted var point19Game5ImageTm1 = "squareleft"
    @Persisted var point20Game5ImageTm1 = "squareleft"
    @Persisted var point21Game5ImageTm1 = "square"
    
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
    
    // Images for game 2 Team 2 points boxes - default values
    @Persisted var point1Game2ImageTm2 = "squaremiddleleft"
    @Persisted var point2Game2ImageTm2 = "squaremiddleleft"
    @Persisted var point3Game2ImageTm2 = "squaremiddleleft"
    @Persisted var point4Game2ImageTm2 = "squaremiddleleft"
    @Persisted var point5Game2ImageTm2 = "squaremiddleleft"
    @Persisted var point6Game2ImageTm2 = "squaremiddleleft"
    @Persisted var point7Game2ImageTm2 = "squaremiddleleft"
    @Persisted var point8Game2ImageTm2 = "squaremiddleleft"
    @Persisted var point9Game2ImageTm2 = "squaremiddleleft"
    @Persisted var point10Game2ImageTm2 = "squaremiddleleft"
    @Persisted var point11Game2ImageTm2 = "squaremiddleleft"
    @Persisted var point12Game2ImageTm2 = "squaremiddleleft"
    @Persisted var point13Game2ImageTm2 = "squaremiddleleft"
    @Persisted var point14Game2ImageTm2 = "squaremiddleleft"
    @Persisted var point15Game2ImageTm2 = "squaremiddleleft"
    @Persisted var point16Game2ImageTm2 = "squaremiddleleft"
    @Persisted var point17Game2ImageTm2 = "squaremiddleleft"
    @Persisted var point18Game2ImageTm2 = "squaremiddleleft"
    @Persisted var point19Game2ImageTm2 = "squaremiddleleft"
    @Persisted var point20Game2ImageTm2 = "squaremiddleleft"
    @Persisted var point21Game2ImageTm2 = "squaremiddleright"
    
    // Images for game 3 Team 2 points boxes - default values
    @Persisted var point1Game3ImageTm2 = "squareleft"
    @Persisted var point2Game3ImageTm2 = "squareleft"
    @Persisted var point3Game3ImageTm2 = "squareleft"
    @Persisted var point4Game3ImageTm2 = "squareleft"
    @Persisted var point5Game3ImageTm2 = "squareleft"
    @Persisted var point6Game3ImageTm2 = "squareleft"
    @Persisted var point7Game3ImageTm2 = "squareleft"
    @Persisted var point8Game3ImageTm2 = "squareleft"
    @Persisted var point9Game3ImageTm2 = "squareleft"
    @Persisted var point10Game3ImageTm2 = "squareleft"
    @Persisted var point11Game3ImageTm2 = "squareleft"
    @Persisted var point12Game3ImageTm2 = "squareleft"
    @Persisted var point13Game3ImageTm2 = "squareleft"
    @Persisted var point14Game3ImageTm2 = "squareleft"
    @Persisted var point15Game3ImageTm2 = "squareleft"
    @Persisted var point16Game3ImageTm2 = "squareleft"
    @Persisted var point17Game3ImageTm2 = "squareleft"
    @Persisted var point18Game3ImageTm2 = "squareleft"
    @Persisted var point19Game3ImageTm2 = "squareleft"
    @Persisted var point20Game3ImageTm2 = "squareleft"
    @Persisted var point21Game3ImageTm2 = "square"
    
    // Images for game 4 Team 2 points boxes - default values
    @Persisted var point1Game4ImageTm2 = "squareleft"
    @Persisted var point2Game4ImageTm2 = "squareleft"
    @Persisted var point3Game4ImageTm2 = "squareleft"
    @Persisted var point4Game4ImageTm2 = "squareleft"
    @Persisted var point5Game4ImageTm2 = "squareleft"
    @Persisted var point6Game4ImageTm2 = "squareleft"
    @Persisted var point7Game4ImageTm2 = "squareleft"
    @Persisted var point8Game4ImageTm2 = "squareleft"
    @Persisted var point9Game4ImageTm2 = "squareleft"
    @Persisted var point10Game4ImageTm2 = "squareleft"
    @Persisted var point11Game4ImageTm2 = "squareleft"
    @Persisted var point12Game4ImageTm2 = "squareleft"
    @Persisted var point13Game4ImageTm2 = "squareleft"
    @Persisted var point14Game4ImageTm2 = "squareleft"
    @Persisted var point15Game4ImageTm2 = "squareleft"
    @Persisted var point16Game4ImageTm2 = "squareleft"
    @Persisted var point17Game4ImageTm2 = "squareleft"
    @Persisted var point18Game4ImageTm2 = "squareleft"
    @Persisted var point19Game4ImageTm2 = "squareleft"
    @Persisted var point20Game4ImageTm2 = "squareleft"
    @Persisted var point21Game4ImageTm2 = "square"
    
    // Images for game 5 Team 2 points boxes - default values
    @Persisted var point1Game5ImageTm2 = "squareleft"
    @Persisted var point2Game5ImageTm2 = "squareleft"
    @Persisted var point3Game5ImageTm2 = "squareleft"
    @Persisted var point4Game5ImageTm2 = "squareleft"
    @Persisted var point5Game5ImageTm2 = "squareleft"
    @Persisted var point6Game5ImageTm2 = "squareleft"
    @Persisted var point7Game5ImageTm2 = "squareleft"
    @Persisted var point8Game5ImageTm2 = "squareleft"
    @Persisted var point9Game5ImageTm2 = "squareleft"
    @Persisted var point10Game5ImageTm2 = "squareleft"
    @Persisted var point11Game5ImageTm2 = "squareleft"
    @Persisted var point12Game5ImageTm2 = "squareleft"
    @Persisted var point13Game5ImageTm2 = "squareleft"
    @Persisted var point14Game5ImageTm2 = "squareleft"
    @Persisted var point15Game5ImageTm2 = "squareleft"
    @Persisted var point16Game5ImageTm2 = "squareleft"
    @Persisted var point17Game5ImageTm2 = "squareleft"
    @Persisted var point18Game5ImageTm2 = "squareleft"
    @Persisted var point19Game5ImageTm2 = "squareleft"
    @Persisted var point20Game5ImageTm2 = "squareleft"
    @Persisted var point21Game5ImageTm2 = "square"
    
    
    // Images for timeout boxes - default values
    var timeOut1Game1ImageTm1 = "squareleft"
    var timeOut2Game1ImageTm1 = "squareleft"
    var timeOut3Game1ImageTm1 = "square"
    var timeOut1Game2ImageTm1 = "squaremiddleleft"
    var timeOut2Game2ImageTm1 = "squaremiddleleft"
    var timeOut3Game2ImageTm1 = "squaremiddleright"
    var timeOut1Game3ImageTm1 = "squareleft"
    var timeOut2Game3ImageTm1 = "squareleft"
    var timeOut3Game3ImageTm1 = "square"
    var timeOut1Game4ImageTm1 = "squareleft"
    var timeOut2Game4ImageTm1 = "squareleft"
    var timeOut3Game4ImageTm1 = "square"
    var timeOut1Game5ImageTm1 = "squareleft"
    var timeOut2Game5ImageTm1 = "squareleft"
    var timeOut3Game5ImageTm1 = "square"
    
    var timeOut1Game1ImageTm2 = "squareleft"
    var timeOut2Game1ImageTm2 = "squareleft"
    var timeOut3Game1ImageTm2 = "square"
    var timeOut1Game2ImageTm2 = "squaremiddleleft"
    var timeOut2Game2ImageTm2 = "squaremiddleleft"
    var timeOut3Game2ImageTm2 = "squaremiddleright"
    var timeOut1Game3ImageTm2 = "squareleft"
    var timeOut2Game3ImageTm2 = "squareleft"
    var timeOut3Game3ImageTm2 = "square"
    var timeOut1Game4ImageTm2 = "squareleft"
    var timeOut2Game4ImageTm2 = "squareleft"
    var timeOut3Game4ImageTm2 = "square"
    var timeOut1Game5ImageTm2 = "squareleft"
    var timeOut2Game5ImageTm2 = "squareleft"
    var timeOut3Game5ImageTm2 = "square"
    
}
