//
//  DataLoadView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/30/22.
//

import RealmSwift
import SwiftUI

struct DataLoadView: View {
    
    @Environment(\.realm) var realm
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var scoresheetManager: ScoresheetManager
    
    @State private var isIncompleteMatch = false
    @State private var isShowWelcomeOpenMatch = false
    @State private var isShowWelcomeNewMatch = false
    @State private var openMatch = Match()
    @State private var newMatch = Match()
    
    let EventNamesArray = ["Solana Beach Summer Games", "Jamul Pickleball Jamboree", "Monterey Seniors Tournament", "Pickleball In Pasadena", "San Jose Regionals", "Mountain View Invitational", "San Francisco By The Bay Open Championship", "Vancouver Friendly Round Robin", "Victorville Regional Fun Games", "Yuma Winter Festival GAmes", "Las Vegas Seniors Open Championship", "Portland Western Open Games", "Salt Lake City Tournament", "Reno City Championship", "Huntington Beach Regional Tournament"]
    
    var body: some View {
        
        NavigationView {
            VStack {
                ProgressView()
                Text("Gaday. This is taking longer than we thought ...")
                    .font(.headline)
                    .foregroundColor(Constants.MINT_LEAF)
                if isIncompleteMatch {
                    // Use the existing Match that is not completed
                    NavigationLink(destination: WelcomeView(match: openMatch).environmentObject(scoresheetManager), isActive: $isShowWelcomeOpenMatch) { }
                } else {
                    // Use the newMatch that was created
                    NavigationLink(destination: WelcomeView(match: newMatch).environmentObject(scoresheetManager), isActive: $isShowWelcomeNewMatch) { }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                if let aMatch = realm.objects(Match.self).where({$0.isCompleted == false}).first {
                    // TODO: - Need to set status values to where they were when app closed during game
                    
                    
                    
                    $openMatch.wrappedValue = aMatch
                    isIncompleteMatch.toggle()
                    isShowWelcomeOpenMatch.toggle()
                } else {
                    //let newEventName = EventNamesArray[Int.random(in: 1..<EventNamesArray.count)]
                    newMatch.eventTitle = EventNamesArray[Int.random(in: 1..<EventNamesArray.count)]
                    let game1 = Game()
                    game1.gameNumber = 1
                    $newMatch.games.append(game1)
                    let game2 = Game()
                    game2.gameNumber = 2
                    $newMatch.games.append(game2)
                    let game3 = Game()
                    game3.gameNumber = 3
                    $newMatch.games.append(game3)
                    let game4 = Game()
                    game4.gameNumber = 4
                    $newMatch.games.append(game4)
                    let game5 = Game()
                    game5.gameNumber = 5
                    $newMatch.games.append(game5)
                    do {
                        try realm.write {
                            realm.add(newMatch)
                        }
                    } catch {
                        print("Error saving new match in DataLoadView: \(error.localizedDescription)")
                    }
                    print("     > > > > Saving newMatch in DataLoadView")
                    realmManager.saveMatch(newMatch)
                    isShowWelcomeNewMatch.toggle()
                }
            }
        }  // End NavigationView
        .navigationViewStyle(.stack)
        .statusBar(hidden: true)
    }
}

struct DataLoadView_Previews: PreviewProvider {
    static var previews: some View {
        DataLoadView()
    }
}

