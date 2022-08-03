//
//  HomeView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//
import RealmSwift
import SwiftUI

struct HomeView: View {
    
    @Environment(\.realm) var realm
    @ObservedRealmObject var match: Match
    
    
    // **********************************************************************************************
    // This section gets path to realm database for use by Realm Studio
    // Display the path to the Realm database files in the console
    //let realmPath: () = print("Realm database files path: \(Realm.Configuration.defaultConfiguration.fileURL!)")
    
    // Find path another way
    // po Realm.Configuration.defaultConfiguration.fileURL
    // **********************************************************************************************
    
    
    var body: some View {
        
        VStack (alignment: .leading) {
            //                if match.isMatchSetup {
            
            if match.isTeam1Serving {
                HStack {
                    MatchView(match: match)
                    NavigationButtonsView(match: match)
                    VStack {
                        // Far right column for spacing
                        Text("     ")
                    }
                }
            } else if !match.isTeam1Serving {
                HStack {
                    VStack {
                        // Far left column for spacing
                        Text("     ")
                    }
                    NavigationButtonsView(match: match)
                    MatchView(match: match)
                }
            }
            
            
            //                } else {
            //                    MatchSetupView(match: match)
            //                }
        }
        
        
        
        
        
        //    func saveMatch() {
        //        do {
        //            print("Starting do block")
        //            try realm.write {
        //                realm.add(match)
        //            }
        //            print("End of do block")
        //        } catch {
        //            print("Error saving games to match: \(error.localizedDescription)")
        //        }
        //    }
        
        //    func addGames() {
        //
        //        print("Starting addGames")
        //        // TODO: - Should be a better way to set up the default of a match to have 5 games
        //        let game1 = Game()
        //        game1.gameNumber = 1
        //        game1.gameScoreImages = GameScoreImages()
        //        //$match.games.append(game1)
        //        let game2 = Game()
        //        game2.gameNumber = 2
        //        game2.gameScoreImages = GameScoreImages()
        //        //$match.games.append(game2)
        //        let game3 = Game()
        //        game3.gameNumber = 3
        //        game3.gameScoreImages = GameScoreImages()
        //        //$match.games.append(game3)
        //        let game4 = Game()
        //        game4.gameNumber = 4
        //        game4.gameScoreImages = GameScoreImages()
        //        //$match.games.append(game4)
        //        let game5 = Game()
        //        game5.gameScoreImages = GameScoreImages()
        //        game5.gameNumber = 5
        //        //$match.games.append(game1)
        //        //print("Cout of games: \(match.games.count)")
        //        //print("Game 1 in match: \(match.games[0])")
        //
        ////        do {
        ////            print("Starting do block")
        ////            try realm.write {
        ////                realm.add(match)
        ////            }
        ////            print("End of do block")
        ////        } catch {
        ////            print("Error saving games to match: \(error.localizedDescription)")
        ////        }
        //
        //        print("End of addGames")
        //    }
        
        
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(match: Match())
//    }
//}
