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
                if match.isMatchSetup {
                    print("Match is already set up")
                } else {
                    print("Match is NOT already set up")
                }
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
        game1.refereeName = "Ellen Delangouria"
        game1.traineeName = "Billie Wantanabe"
        game1.gameWinner = "Billy Bob Jones"
        $match.games.append(game1)
        let game2 = Game()
        game2.gameNumber = 2
        game2.refereeName = "Roger Malkowitz"
        game2.traineeName = "Amanda Johansson"
        game2.gameWinner = "Beverly Rasmussen"
        $match.games.append(game2)
        let game3 = Game()
        game3.gameNumber = 3
        game3.refereeName = "Stephanie Puskin"
        game3.traineeName = "Collin Hutchinson"
        game3.gameWinner = "Roger Butler"
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


//            NavigationView {
//                    NavigationLink {
//                        //HomeView(match: matches[0])
//                    } label: {
//                        Button {
//                            //HomeView(match: matches[0])
//                        } label: {
//                            Text("Start Match")
//                                .font(.largeTitle)
//                                .foregroundColor(.green)
//                        }
//                        .buttonStyle(PointSideoutButton())
//                    }
//            }


//            Text("\nTap the \(Image(systemName: "arrow.right")) button below to start Match     ")
//                .font(.title)
//                .foregroundColor(.indigo)
//
//            Image(systemName: "arrow.right")
//                .resizable()
//                .frame(width: 60, height: 60)
//                .foregroundColor(.red)
