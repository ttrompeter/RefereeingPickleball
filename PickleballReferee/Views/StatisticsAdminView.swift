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
        
        VStack {
            
            Text("Match Statistics ")
                .bold()
                .font(.largeTitle)
                .foregroundColor(Constants.DARK_SLATE)
            
            MatchStatisticsView(match: match)
            MatchStatisticsIIView(match: match)
            
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
    
    func formatElapsedTimeMinutes(value: Double) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0

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
