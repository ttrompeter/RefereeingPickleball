//
//  WelcomeView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/1/22.
//

import RealmSwift
import SwiftUI

struct WelcomeView: View {
    
    @Environment(\.realm) var realm
    @ObservedRealmObject var match: Match
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: CGFloat(880), height: CGFloat(440))
                        .foregroundColor(Constants.CLOUDS)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    VStack {
                        
                        Text("Welcome to the Pinochle Referee App\n")
                            .font(.largeTitle)
                            .foregroundColor(.indigo)
                        Text("This appliction allows you to easily referee pickleball games without doing calcuations or managing a physical scoresheet. The application calcuates the score and marks points by player and team and helps manage timeouts. It also includes a stopwatch function. It provides easy access to reminder instructions for the pre-match briefing with the players and for timeouts. There is also easy reference to important documents and instructions.\n")
                            .font(.body)
                            .foregroundColor(.indigo)
                        
                        
                        NavigationLink (destination: HomeView(match: match)) {
                            Text("\nStart Match")
                                .font(.largeTitle)
                                .foregroundColor(.red)
                        }
                        
                        
//                        if match.isMatchSetup {
//                            NavigationLink (destination: HomeView(match: match)) {
//                                Text("\nStart Match")
//                                    .font(.largeTitle)
//                                    .foregroundColor(.red)
//                            }
//                        } else {
//                            NavigationLink (destination: MatchSetupView(match: match)) {
//                                Text("\nStart Match")
//                                    .font(.largeTitle)
//                                    .foregroundColor(.red)
//                            }
//                        }
                        
                    }
                    .frame(width: 700)
                }
            }
            .padding()
            .onAppear {
                addGames()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
        } // End NavigationView
        .navigationViewStyle(.stack)
        .statusBar(hidden: true)
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
        $match.games.append(game5)
        
        saveMatch()
    }
    
    func saveMatch() {
        do {
            try realm.write {
                realm.add(match)
            }
        } catch {
            print("Error saving games to match: \(error.localizedDescription)")
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(match: Match())
    }
}


