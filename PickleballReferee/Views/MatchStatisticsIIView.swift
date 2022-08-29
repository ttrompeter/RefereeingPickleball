//
//  MatchStatisticsII.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/28/22.
//

import RealmSwift
import SwiftUI

struct MatchStatisticsIIView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var scoresheetManager: ScoresheetManager
    @ObservedRealmObject var match: Match
    
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
    private var matchTotalViolationsTeam1: String {
        let totalViolations = match.games[0].warningsTeam1 + match.games[0].penaltiessTeam1 + match.games[1].warningsTeam1 + match.games[1].penaltiessTeam1 + match.games[2].warningsTeam1 + match.games[2].penaltiessTeam1 + match.games[3].warningsTeam1 + match.games[3].penaltiessTeam1 + match.games[4].warningsTeam1 + match.games[4].penaltiessTeam1
        return String(totalViolations)
    }
    private var matchTotalViolationsTeam2: String {
        let totalViolations = match.games[0].warningsTeam2 + match.games[0].penaltiessTeam2 + match.games[1].warningsTeam2 + match.games[1].penaltiessTeam2 + match.games[2].warningsTeam2 + match.games[2].penaltiessTeam2 + match.games[3].warningsTeam2 + match.games[3].penaltiessTeam2 + match.games[4].warningsTeam2 + match.games[4].penaltiessTeam2
        return String(totalViolations)
    }
    
    var body: some View {
        
        VStack (spacing: 30) {
            
                VStack (alignment: .leading) {
                    
                    HStack (alignment: .top) {
                        VStack (alignment: .leading) {
                            Group {
                                Text("Other Results: ")
                                Divider()
                                Text("Sideouts Team 1: ")
                                Text("Sideouts Team 2: ")
                                Divider()
                                Text("Timeouts Team 1: ")
                                Text("Timeouts Team 2: ")
                            }
                            Divider()
                            Text("Violations Team 1: ")
                            Text("Violations Team 2: ")
                            Divider()
                            Text("Elapsed Time: ")
                        }
                        VStack {
                            Group {
                                Text("Match")
                                Divider()
                                Text(totalMatchSideoutsTeam1)
                                Text(totalMatchSideoutsTeam2)
                                Divider()
                                Text(totalMatchTimeoutsTeam1)
                                Text(totalMatchTimeoutsTeam2)
                            }
                            Divider()
                            Text(matchTotalViolationsTeam1)
                            Text(matchTotalViolationsTeam1)
                            Divider()
                            Text("\(formatElapsedTimeMinutes(value: (match.matchDuration))) min")
                        }
                        VStack {
                            Group {
                                Text("Game 1")
                                Divider()
                                Text("\(match.games[0].sideOutsTeam1)")
                                Text("\(match.games[0].sideOutsTeam2)")
                                Divider()
                                Text("\(match.games[0].timeOutsTeam1)")
                                Text("\(match.games[0].timeOutsTeam2)")
                            }
                            Divider()
                            Text("\(match.games[0].penaltiessTeam1 + match.games[0].warningsTeam1)")
                            Text("\(match.games[0].penaltiessTeam2 + match.games[0].warningsTeam2)")
                            Divider()
                            Text("\(formatElapsedTimeMinutes(value: (match.games[0].gameDuration))) min")
                        }
                        VStack {
                            Group {
                                Text("Game 2")
                                Divider()
                                Text("\(match.games[1].sideOutsTeam1)")
                                Text("\(match.games[1].sideOutsTeam2)")
                                Divider()
                                Text("\(match.games[1].timeOutsTeam1)")
                                Text("\(match.games[1].timeOutsTeam2)")
                            }
                            Divider()
                            Text("\(match.games[1].penaltiessTeam1 + match.games[0].warningsTeam1)")
                            Text("\(match.games[1].penaltiessTeam2 + match.games[0].warningsTeam2)")
                            Divider()
                            Text("\(formatElapsedTimeMinutes(value: (match.games[1].gameDuration))) min")
                        }
                        VStack {
                            Group {
                                Text("Game 3")
                                Divider()
                                Text("\(match.games[2].sideOutsTeam1)")
                                Text("\(match.games[2].sideOutsTeam2)")
                                Divider()
                                Text("\(match.games[2].timeOutsTeam1)")
                            }
                            Divider()
                            Text("\(match.games[2].penaltiessTeam1 + match.games[0].warningsTeam1)")
                            Text("\(match.games[2].penaltiessTeam2 + match.games[0].warningsTeam2)")
                            Text("\(match.games[2].timeOutsTeam2)")
                            Divider()
                            Text("\(formatElapsedTimeMinutes(value: (match.games[2].gameDuration))) min")
                        }
                        if match.selectedGameFormat == 3 {
                            VStack {
                                Group {
                                    Text("Game 4")
                                    Divider()
                                    Text("\(match.games[3].sideOutsTeam1)")
                                    Text("\(match.games[3].sideOutsTeam2)")
                                    Divider()
                                    Text("\(match.games[3].timeOutsTeam1)")
                                    Text("\(match.games[3].timeOutsTeam2)")
                                }
                                Divider()
                                Text("\(match.games[3].penaltiessTeam1 + match.games[0].warningsTeam1)")
                                Text("\(match.games[3].penaltiessTeam2 + match.games[0].warningsTeam2)")
                                Divider()
                                Text("\(formatElapsedTimeMinutes(value: (match.games[3].gameDuration))) min")
                            }
                            VStack {
                                Group {
                                    Text("Game 5")
                                    Divider()
                                    Text("\(match.games[4].sideOutsTeam1)")
                                    Text("\(match.games[4].sideOutsTeam2)")
                                    Divider()
                                    Text("\(match.games[4].timeOutsTeam1)")
                                    Text("\(match.games[4].timeOutsTeam2)")
                                }
                                Divider()
                                Text("\(match.games[4].penaltiessTeam1 + match.games[0].warningsTeam1)")
                                Text("\(match.games[4].penaltiessTeam2 + match.games[0].warningsTeam2)")
                                Divider()
                                Text("\(formatElapsedTimeMinutes(value: (match.games[4].gameDuration))) min")
                            }
                        }
                    }
                    .padding(6)
                    .font(.caption)
                    .background(Constants.BACKGROUND_COLOR)
                    .cornerRadius(8)
                }
                .padding(.horizontal, 40)

        }  // Top VStack
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

struct MatchStatisticsII_Previews: PreviewProvider {
    static var previews: some View {
        MatchStatisticsIIView(match: Match())
    }
}
