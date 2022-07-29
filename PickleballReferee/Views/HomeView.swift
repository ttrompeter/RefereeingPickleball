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
    let realmPath: () = print("Realm database files path: \(Realm.Configuration.defaultConfiguration.fileURL!)")
    
    // Find path another way
    // po Realm.Configuration.defaultConfiguration.fileURL
    // **********************************************************************************************
    

    var body: some View {
        
        VStack (alignment: .leading) {
            
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
            
        }
        .onAppear {
            addGames()
            print("\nGames in Match count: \(match.games.count)")
            print("game3 gameNumber: \(match.games[2].gameNumber)\n")
        }
        
    }
    
    func addGames() {
        // TODO: - Should be a better way to set up the default of a match to have 5 games
        let game1 = Game()
        game1.gameNumber = 1
        $match.games.append(game1)
        let game2 = Game()
        game2.gameNumber = 2
        $match.games.append(game2)
        let game3 = Game()
        game3.gameNumber = 3
        $match.games.append(game3)
        let game4 = Game()
        game4.gameNumber = 4
        $match.games.append(game4)
        let game5 = Game()
        game5.gameNumber = 5
        $match.games.append(game1)
        
        
//        do {
//            try? realm.write {
//                realm.add(match)
//            }
//        } catch {
//            print("Error saving games to match: \(error.localizedDescription)")
//        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(match: Match())
    }
}
