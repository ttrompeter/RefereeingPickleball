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
                                        Text("11 Points")
                                        Text("X")
                                            .foregroundColor(Constants.LIGHT_GRAY)
                                        Divider()
                                        Text("6 Points")
                                        Text("")
                                    }
                                    VStack {
                                        Text("2 of 3 Games")
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
                                        Text("Jack (6)")
                                        Text("Ellen (5)")
                                        Divider()
                                        Text("David (2)")
                                        Text("Margo (4)")
                                    }
                                    VStack {
                                        Text("Game 2")
                                        Divider()
                                        Text("Jack (6)")
                                        Text("Ellen (5)")
                                        Divider()
                                        Text("David (2)")
                                        Text("Margo (4)")
                                    }
                                    VStack {
                                        Text("Game 3")
                                        Divider()
                                        Text("Jack (6)")
                                        Text("Ellen (5)")
                                        Divider()
                                        Text("David (2)")
                                        Text("Margo (4)")
                                    }
                                    if match.selectedGameFormat == 3 {
                                        VStack {
                                            Text("Game 4")
                                            Divider()
                                            Text("Jack (6)")
                                            Text("Ellen (5)")
                                            Divider()
                                            Text("David (2)")
                                            Text("Margo (4)")
                                        }
                                        VStack {
                                            Text("Game 5")
                                            Divider()
                                            Text("Jack (6)")
                                            Text("Ellen (5)")
                                            Divider()
                                            Text("David (2)")
                                            Text("Margo (4)")
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
                                        Text("12")
                                        Divider()
                                        Text("18")
                                    }
                                    VStack {
                                        Text("Game 1")
                                        Divider()
                                        Text("4")
                                        Divider()
                                        Text("7")
                                    }
                                    VStack {
                                        Text("Game 2")
                                        Divider()
                                        Text("3")
                                        Divider()
                                        Text("8")
                                    }
                                    VStack {
                                        Text("Game 3")
                                        Divider()
                                        Text("7")
                                        Divider()
                                        Text("4")
                                    }
                                    if match.selectedGameFormat == 3 {
                                        VStack {
                                            Text("Game 4")
                                            Divider()
                                            Text("7")
                                            Divider()
                                            Text("9")
                                        }
                                        VStack {
                                            Text("Game 5")
                                            Divider()
                                            Text("3")
                                            Divider()
                                            Text("6")
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
                                        Text("2")
                                        Divider()
                                        Text("3")
                                    }
                                    VStack {
                                        Text("Game 1")
                                        Divider()
                                        Text("0")
                                        Divider()
                                        Text("1")
                                    }
                                    VStack {
                                        Text("Game 2")
                                        Divider()
                                        Text("0")
                                        Divider()
                                        Text("0")
                                    }
                                    VStack {
                                        Text("Game 3")
                                        Divider()
                                        Text("2")
                                        Divider()
                                        Text("1")
                                    }
                                    if match.selectedGameFormat == 3 {
                                        VStack {
                                            Text("Game 4")
                                            Divider()
                                            Text("0")
                                            Divider()
                                            Text("0")
                                        }
                                        VStack {
                                            Text("Game 5")
                                            Divider()
                                            Text("0")
                                            Divider()
                                            Text("0")
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
