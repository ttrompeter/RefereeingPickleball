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
    @Persisted var gameNumber = 1
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
    @Persisted var courtNumber = "99"
    @Persisted var selectedFirstServeTeam = ""
    @Persisted var timeOutsTeam1 = 0
    @Persisted var timeOutsTeam2 = 0
    @Persisted var servingTeam = 1
    @Persisted var serverNumber = 2
    @Persisted var whoIsServingText = "2nd Server"
    @Persisted var isGameCompleted = false
    @Persisted var isGameStartingServer = true

    //@Persisted var gameScoreImages: GameScoreImagesRealm?

    var games = LinkingObjects(fromType: Match.self, property: "games")

    var gameScoreTeam1: Int {
        player1Team1Points + player2Team1Points
    }

    var gameScoreTeam2: Int {
        player1Team2Points + player2Team2Points
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
