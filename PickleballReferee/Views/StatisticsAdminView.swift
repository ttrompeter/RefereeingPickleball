//
//  StatisticsView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import RealmSwift
import SwiftUI

struct StatisticAdminView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedRealmObject var match: Match
    @State var screenshotMaker: ScreenshotMaker?

    private var totalMatchTimeoutsTeam1: String {
        
        let totalTimeouts = match.games[0].timeOutsTeam1 + match.games[1].timeOutsTeam1 + match.games[2].timeOutsTeam1 + match.games[3].timeOutsTeam1 + match.games[4].timeOutsTeam1
        
        return String(totalTimeouts)
    }
    
    private var totalMatchTimeoutsTeam2: String {
        
        let totalTimeouts = match.games[0].timeOutsTeam2 + match.games[1].timeOutsTeam2 + match.games[2].timeOutsTeam2 + match.games[3].timeOutsTeam2 + match.games[4].timeOutsTeam2
        
        return String(totalTimeouts)
    }
    
    private var totalMatchSideoutsTeam1: String {
        
        let totalSideouts = match.games[0].sideOutsTeam1 + match.games[1].sideOutsTeam1 + match.games[2].sideOutsTeam1 + match.games[3].sideOutsTeam1 + match.games[4].sideOutsTeam1
        
        return String(totalSideouts)
    }
    
    private var totalMatchSideoutsTeam2: String {
        
        let totalSideouts = match.games[0].sideOutsTeam2 + match.games[1].sideOutsTeam2 + match.games[2].sideOutsTeam2 + match.games[3].sideOutsTeam2 + match.games[4].sideOutsTeam2
        
        return String(totalSideouts)
    }
    
    
    
    var body: some View {
        
        VStack (spacing: 30) {
            
            Text("Match Statistics ")
                .bold()
                .font(.largeTitle)
            
            ZStack {
                Rectangle()
                    .frame(width: CGFloat(660), height: CGFloat(540))
                    .foregroundColor(Constants.CLOUDS)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                VStack (alignment: .leading) {
                    
                    VStack (alignment: .leading) {
                        HStack (alignment: .top) {
                            
                            VStack (alignment: .leading){
                                HStack (alignment: .top) {
                                    VStack (alignment: .leading) {
                                        Text("Match Final Score: ")
                                        Divider()
                                        Text("Winning Team: ")
                                        Text("X")
                                            .foregroundColor(Constants.LIGHT_GRAY)
                                        Divider()
                                        Text("Losing Team: ")
                                        Text("X")
                                            .foregroundColor(Constants.LIGHT_GRAY)
                                    }
                                    VStack {
                                        Text("Total Points")
                                        Divider()
                                        Text("\(match.matchTotalPointsWinningTeam)")
                                        Text("X")
                                            .foregroundColor(Constants.LIGHT_GRAY)
                                        Divider()
                                        Text("\(match.matchTotalPointsLosingTeam)")
                                        Text("")
                                    }
                                    VStack {
                                        Text(match.matchFormatDescription)
                                        Divider()
                                        Text("Jack Smith")
                                        Text("6 Points")
                                        Divider()
                                        Text("Margo Sullivan")
                                        Text("4 Points")
                                    }
                                    VStack {
                                        Text("To 11 Points")
                                        Divider()
                                        Text("Ellen Stephenson")
                                        Text("5 Points")
                                        Divider()
                                        Text("David Danemann")
                                        Text("2 Points")
                                    }
                                }
                                .padding(5)
                                .font(.footnote)
                                .background(Constants.LIGHT_GRAY)
                                .cornerRadius(8)
                                
                                HStack (alignment: .top) {
                                    VStack (alignment: .leading) {
                                        Text("Score By Game: ")
                                        Divider()
                                        Text("Team 1: ")
                                        Text("X")
                                            .foregroundColor(Constants.LIGHT_GRAY)
                                        Divider()
                                        Text("Team 2: ")
                                        Text("X")
                                            .foregroundColor(Constants.LIGHT_GRAY)
                                    }
                                    VStack {
                                        Text("Game 1")
                                        Divider()
                                        Text("\(match.player1FirstName) (\(match.games[0].player1Team1Points))")
                                        Text("\(match.player2FirstName) (\(match.games[0].player2Team1Points))")
                                        Divider()
                                        Text("\(match.player3FirstName) (\(match.games[0].player1Team2Points))")
                                        Text("\(match.player4FirstName) (\(match.games[0].player2Team2Points))")
                                    }
                                    VStack {
                                        Text("Game 2")
                                        Divider()
                                        Text("\(match.player1FirstName) (\(match.games[1].player1Team1Points))")
                                        Text("\(match.player2FirstName) (\(match.games[1].player2Team1Points))")
                                        Divider()
                                        Text("\(match.player3FirstName) (\(match.games[1].player1Team2Points))")
                                        Text("\(match.player4FirstName) (\(match.games[1].player2Team2Points))")
                                    }
                                    VStack {
                                        Text("Game 3")
                                        Divider()
                                        Text("\(match.player1FirstName) (\(match.games[2].player1Team1Points))")
                                        Text("\(match.player2FirstName) (\(match.games[2].player2Team1Points))")
                                        Divider()
                                        Text("\(match.player3FirstName) (\(match.games[2].player1Team2Points))")
                                        Text("\(match.player4FirstName) (\(match.games[2].player2Team2Points))")
                                    }
                                    if match.selectedGameFormat == 3 {
                                        VStack {
                                            Text("Game 4")
                                            Divider()
                                            Text("\(match.player1FirstName) (\(match.games[3].player1Team1Points))")
                                            Text("\(match.player2FirstName) (\(match.games[3].player2Team1Points))")
                                            Divider()
                                            Text("\(match.player3FirstName) (\(match.games[3].player1Team2Points))")
                                            Text("\(match.player4FirstName) (\(match.games[3].player2Team2Points))")
                                        }
                                        VStack {
                                            Text("Game 5")
                                            Divider()
                                            Text("\(match.player1FirstName) (\(match.games[4].player1Team1Points))")
                                            Text("\(match.player2FirstName) (\(match.games[4].player2Team1Points))")
                                            Divider()
                                            Text("\(match.player3FirstName) (\(match.games[4].player1Team2Points))")
                                            Text("\(match.player4FirstName) (\(match.games[4].player2Team2Points))")
                                        }
                                    }
                                }
                                .padding(5)
                                .font(.caption)
                                .background(Constants.LIGHT_GRAY)
                                .cornerRadius(8)
                                
                                HStack (alignment: .top) {
                                    VStack (alignment: .leading) {
                                        Text("Side Outs: ")
                                        Divider()
                                        Text("Team 1: ")
                                        Divider()
                                        Text("Team 2: ")
                                    }
                                    VStack {
                                        Text("Match")
                                        Divider()
                                        Text(totalMatchSideoutsTeam1)
                                        Divider()
                                        Text(totalMatchSideoutsTeam2)
                                    }
                                    VStack {
                                        Text("Game 1")
                                        Divider()
                                        Text("\(match.games[0].sideOutsTeam1)")
                                        Divider()
                                        Text("\(match.games[0].sideOutsTeam2)")
                                    }
                                    VStack {
                                        Text("Game 2")
                                        Divider()
                                        Text("\(match.games[1].sideOutsTeam1)")
                                        Divider()
                                        Text("\(match.games[1].sideOutsTeam2)")
                                    }
                                    VStack {
                                        Text("Game 3")
                                        Divider()
                                        Text("\(match.games[2].sideOutsTeam1)")
                                        Divider()
                                        Text("\(match.games[2].sideOutsTeam2)")
                                    }
                                    if match.selectedGameFormat == 3 {
                                        VStack {
                                            Text("Game 4")
                                            Divider()
                                            Text("\(match.games[3].sideOutsTeam1)")
                                            Divider()
                                            Text("\(match.games[3].sideOutsTeam2)")
                                        }
                                        VStack {
                                            Text("Game 5")
                                            Divider()
                                            Text("\(match.games[4].sideOutsTeam1)")
                                            Divider()
                                            Text("\(match.games[4].sideOutsTeam2)")
                                        }
                                    }
                                    
                                }
                                .padding(5)
                                .font(.caption)
                                .background(Constants.LIGHT_GRAY)
                                .cornerRadius(8)
                                
                                HStack (alignment: .top) {
                                    VStack (alignment: .leading) {
                                        Text("Timeouts: ")
                                        Divider()
                                        Text("Team 1: ")
                                        Divider()
                                        Text("Team 2: ")
                                    }
                                    VStack {
                                        Text("Match")
                                        Divider()
                                        Text(totalMatchTimeoutsTeam1)
                                        Divider()
                                        Text(totalMatchTimeoutsTeam2)
                                    }
                                    VStack {
                                        Text("Game 1")
                                        Divider()
                                        Text("\(match.games[0].timeOutsTeam1)")
                                        Divider()
                                        Text("\(match.games[0].timeOutsTeam2)")
                                    }
                                    VStack {
                                        Text("Game 2")
                                        Divider()
                                        Text("\(match.games[1].timeOutsTeam1)")
                                        Divider()
                                        Text("\(match.games[1].timeOutsTeam1)")
                                    }
                                    VStack {
                                        Text("Game 3")
                                        Divider()
                                        Text("\(match.games[2].timeOutsTeam1)")
                                        Divider()
                                        Text("\(match.games[2].timeOutsTeam1)")
                                    }
                                    if match.selectedGameFormat == 3 {
                                        VStack {
                                            Text("Game 4")
                                            Divider()
                                            Text("\(match.games[3].timeOutsTeam1)")
                                            Divider()
                                            Text("\(match.games[3].timeOutsTeam1)")
                                        }
                                        VStack {
                                            Text("Game 5")
                                            Divider()
                                            Text("\(match.games[4].timeOutsTeam1)")
                                            Divider()
                                            Text("\(match.games[4].timeOutsTeam1)")
                                        }
                                    }
                                    
                                }
                                .padding(5)
                                .font(.caption)
                                .background(Constants.LIGHT_GRAY)
                                .cornerRadius(8)
                                
                                HStack (alignment: .top) {
                                    VStack (alignment: .leading) {
                                        Text("Elapsed Time")
                                        Divider()
                                        Text("")
                                    }
                                    VStack {
                                        Text("Match")
                                        Divider()
                                        Text("\(formatElapsedTime(value: (match.matchElapsedTime / 60))) minutes")
                                    }
                                    VStack {
                                        Text("Game 1")
                                        Divider()
                                        Text("\(formatElapsedTime(value: (match.games[0].gameElapsedTime / 60))) minutes")
                                    }
                                    VStack {
                                        Text("Game 2")
                                        Divider()
                                        Text("\(formatElapsedTime(value: (match.games[1].gameElapsedTime / 60))) minutes")
                                    }
                                    VStack {
                                        Text("Game 3")
                                        Divider()
                                        Text("\(formatElapsedTime(value: (match.games[2].gameElapsedTime / 60))) minutes")
                                    }
                                    if match.selectedGameFormat == 3 {
                                        Text("Game 4")
                                        Divider()
                                        VStack {
                                            Text("\(formatElapsedTime(value: (match.games[3].gameElapsedTime / 60))) minutes")
                                        }
                                        VStack {
                                            Text("Game 5")
                                            Divider()
                                            Text("\(formatElapsedTime(value: (match.games[4].gameElapsedTime / 60))) minutes")
                                        }
                                    }
                                }
                                .padding(5)
                                .font(.caption)
                                .background(Constants.LIGHT_GRAY)
                                .cornerRadius(8)
                                
                            }
                            .padding(10)
                        }
                    }
                }
                .padding(.horizontal, 40)
            }
            
            
            VStack {
                HStack {
                    Button("Snapshot") {
                        if let screenshotMaker = screenshotMaker {
                            screenshotMaker.screenshot()?.saveToDocuments()
                        }
                    }
                    .buttonStyle(SheetButtonStyle())
                    
                    Button("Close") {
                        dismiss()
                    }
                    .buttonStyle(SheetButtonStyle())
                }
                
            }
            
        }  // Top VStack
        .screenshotView { screenshotMaker in
            self.screenshotMaker = screenshotMaker
        }
    }
    
    func formatElapsedTime(value: Double) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2

        let number = NSNumber(value: value)
        let formattedValue = formatter.string(from: number)!
        return formattedValue
    }
}

struct StatisticsAdminView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticAdminView(match: Match())
    }
}
