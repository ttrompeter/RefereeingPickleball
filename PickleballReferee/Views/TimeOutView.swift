//
//  TimeOutView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import RealmSwift
import SwiftUI

struct TimeOutView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedRealmObject var match: Match
    @State private var remainingTimeoutsReceivingTm = -1
    @State private var remainingTimeoutsServingTm = -1
    @State private var isServingTeamButtonSelected = false
    @State private var isReceivingTeamButtonSelected = false
    @State private var isButtonTapped = false
    
    var body: some View {
        
        VStack (spacing: 10) {
            
            Text("Time Out")
                .bold()
                .font(.largeTitle)
                .padding(.top, 5)
            
            HStack (alignment: .top) {
                ZStack {
                    Rectangle()
                        .frame(width: CGFloat(620), height: CGFloat(420))
                        .foregroundColor(Constants.CLOUDS)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    VStack (alignment: .leading, spacing: 2) {
                        
                        Group {
                            Text("Timeout Procedure")
                                .font(.headline)
                            Text("\u{2022}") + Text(" Time out has been called by the [Receiving / Serving] Team")
                            Text("\u{2022}") + Text(" Start Stopwatch")
                            Text("\u{2022}") + Text(" Move to side of court of team that called the timeout")
                            Text("\u{2022}") + Text(" The score is  \(match.scoreDisplay)")
                            Text("\u{2022}") + Text(" Warning: You have one minute")
                            Text("\u{2022}") + Text(" Move to center court")
                            //Text("\u{2022}") + Text(" Record time out in the appropriate box on scoresheet")
                        }
                        Group {
                            Text("\u{2022}") + Text(" At 15 seconds remaining, announce:")
                            Text("\u{2022}") + Text(" Warning: 15 Seconds")
                            Text("\u{2022}") + Text(" Move back to your referee position")
                            Text("\u{2022}") + Text(" Announce:")
                            Text("     Receiving team you have  \(remainingTimeoutsReceivingTm)  timeout remaining")
                            Text("     Serving team you have  \(remainingTimeoutsServingTm)  timeout remaining")
                            Text("\u{2022}") + Text(" Check readiness of line judges  (if applicable)")
                            Text("\u{2022}") + Text(" Announce: Time in")
                            Text("\u{2022}") + Text(" Announce score:  \(match.scoreDisplay)")
                        }
                    }
                }
            }
            
            VStack {
                HStack (alignment: .center) {
                    
                    Stopwatch(isShowHour: false)
                    
                    VStack {
                        Spacer()
                        Text("Select Team Taking Time Out")
                        Button {
                            timeOutTaken(teamTakingTimeOut: 1)
                            isServingTeamButtonSelected = true
                            isButtonTapped = true
                        } label: {
                            Text("Serving Team")
                        }
                        .padding()
                        .frame(width: 180, height: 40)
                        .background(isServingTeamButtonSelected ? Constants.MINT_LEAF : Constants.SILVER)
                        .font(.body)
                        .foregroundColor(isServingTeamButtonSelected ? Constants.WHITE : Constants.DARK_SLATE)
                        .clipShape(Capsule())
                        .disabled(isButtonTapped)
                        if match.isTeam1Serving {
                            Text("\(match.namePlayer1Team1) | \(match.namePlayer2Team1)")
                                .font(.caption).italic()
                                .foregroundColor(Constants.MINT_LEAF)
                        } else {
                            Text("\(match.namePlayer1Team2) | \(match.namePlayer2Team2)")
                                .font(.caption).italic()
                                .foregroundColor(Constants.MINT_LEAF)
                        }
                        
                        Spacer()
                        Button {
                            timeOutTaken(teamTakingTimeOut: 2)
                            isReceivingTeamButtonSelected = true
                            isButtonTapped = true
                        } label: {
                            Text("Receiving Team")
                        }
                        .padding()
                        .frame(width: 180, height: 40)
                        .background(isReceivingTeamButtonSelected ? Constants.MINT_LEAF : Constants.SILVER)
                        .font(.body)
                        .foregroundColor(isReceivingTeamButtonSelected ? Constants.WHITE : Constants.DARK_SLATE)
                        .clipShape(Capsule())
                        .disabled(isButtonTapped)
                        if match.isTeam1Serving {
                            Text("\(match.namePlayer1Team2) | \(match.namePlayer2Team2)")
                                .font(.caption).italic()
                                .foregroundColor(Constants.MINT_LEAF)
                        } else {
                            Text("\(match.namePlayer1Team1) | \(match.namePlayer2Team1)")
                                .font(.caption).italic()
                                .foregroundColor(Constants.MINT_LEAF)
                        }
                        Spacer()
                    }
                    .padding(10)
                    .background(Constants.CLOUDS)
                }
            }
            
            
            VStack {
                Button("Close") {
                    dismiss()
                }
                .buttonStyle(SheetButton())
            }
            .padding(.bottom, 5)
            
        }
        
    }
    
    func timeOutTaken (teamTakingTimeOut: Int) {
        
        if teamTakingTimeOut == 1 {
            // Time Out by Serving Team
            if match.isTeam1Serving {
                $match.games[match.currentGameNumber - 1].timeOutsTeam1.wrappedValue += 1
                $remainingTimeoutsServingTm.wrappedValue = (3 - match.games[match.currentGameNumber - 1].timeOutsTeam1)
                $remainingTimeoutsReceivingTm.wrappedValue = (3 - match.games[match.currentGameNumber - 1].timeOutsTeam2)
                setTimeoutImage(team: 1)
                $match.isTimeOutTaken.wrappedValue = true
                $match.teamTakingTimeout.wrappedValue = 1
            } else {
                $match.games[match.currentGameNumber - 1].timeOutsTeam2.wrappedValue += 1
                $remainingTimeoutsServingTm.wrappedValue = (3 - match.games[match.currentGameNumber - 1].timeOutsTeam2)
                $remainingTimeoutsReceivingTm.wrappedValue = (3 - match.games[match.currentGameNumber - 1].timeOutsTeam1)
                setTimeoutImage(team: 2)
                $match.isTimeOutTaken.wrappedValue = true
                $match.teamTakingTimeout.wrappedValue = 2
            }
            
        } else {  // teamTakingTimeout == 2
            // Time Out by Receiving Team
            if match.isTeam1Serving {
                $match.games[match.currentGameNumber - 1].timeOutsTeam2.wrappedValue += 1
                $remainingTimeoutsServingTm.wrappedValue = (3 - match.games[match.currentGameNumber - 1].timeOutsTeam1)
                $remainingTimeoutsReceivingTm.wrappedValue = (3 - match.games[match.currentGameNumber - 1].timeOutsTeam2)
                setTimeoutImage(team: 1)
                $match.isTimeOutTaken.wrappedValue = true
                $match.teamTakingTimeout.wrappedValue = 2
            } else {
                $match.games[match.currentGameNumber - 1].timeOutsTeam1.wrappedValue += 1
                $remainingTimeoutsReceivingTm.wrappedValue = (3 - match.games[match.currentGameNumber - 1].timeOutsTeam1)
                $remainingTimeoutsServingTm.wrappedValue = (3 - match.games[match.currentGameNumber - 1].timeOutsTeam2)
                setTimeoutImage(team: 2)
                $match.isTimeOutTaken.wrappedValue = true
                $match.teamTakingTimeout.wrappedValue = 1
            }
        }
    }
    
    func setTimeoutImage(team: Int) {
        
        print("\nStarting setTimeoutImage()")
        print("team parameter: \(team)")
        print("timeOutsTeam1: \(match.games[match.currentGameNumber - 1].timeOutsTeam1)")
        print("timeOutsTeam2: \(match.games[match.currentGameNumber - 1].timeOutsTeam2)\n")
        
        if team == 1 {
            switch match.games[match.currentGameNumber - 1].timeOutsTeam1 {
            case 0:
                if match.currentGameNumber == 1 {
                    $match.games[0].timeOut1Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 2 {
                    $match.games[1].timeOut1Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 3 {
                    $match.games[2].timeOut1Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 4 {
                    $match.games[3].timeOut1Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 5 {
                    $match.games[4].timeOut1Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                }
            case 1:
                if match.currentGameNumber == 1 {
                    $match.games[0].timeOut2Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 2 {
                    $match.games[1].timeOut2Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 3 {
                    $match.games[2].timeOut2Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 4 {
                    $match.games[3].timeOut2Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 5 {
                    $match.games[4].timeOut2Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                }
            case 2:
                if match.currentGameNumber == 1 {
                    $match.games[0].timeOut3Game1ImageTm1.wrappedValue = "squarerightfwdslash"
                } else if match.currentGameNumber == 2 {
                    $match.games[1].timeOut3Game2ImageTm1.wrappedValue = "squarerightfwdslash"
                } else if match.currentGameNumber == 3 {
                    $match.games[2].timeOut3Game3ImageTm1.wrappedValue = "squarerightfwdslash"
                } else if match.currentGameNumber == 4 {
                    $match.games[3].timeOut3Game4ImageTm1.wrappedValue = "squarerightfwdslash"
                } else if match.currentGameNumber == 5 {
                    $match.games[4].timeOut3Game5ImageTm1.wrappedValue = "squarerightfwdslash"
                }
            default:
                print("Error setting image in switch statement of setTimeoutImage()")
            }
            
        } else if team == 2 {
            switch match.games[match.currentGameNumber - 1].timeOutsTeam2 {
            case 0:
                if match.currentGameNumber == 1 {
                    $match.games[0].timeOut1Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 2 {
                    $match.games[1].timeOut1Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 3 {
                    $match.games[2].timeOut1Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 4 {
                    $match.games[3].timeOut1Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 5 {
                    $match.games[4].timeOut1Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                }
            case 1:
                if match.currentGameNumber == 1 {
                    $match.games[0].timeOut2Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 2 {
                    $match.games[1].timeOut2Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 3 {
                    $match.games[2].timeOut2Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 4 {
                    $match.games[3].timeOut2Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 5 {
                    $match.games[4].timeOut2Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                }
            case 2:
                if match.currentGameNumber == 1 {
                    $match.games[0].timeOut3Game1ImageTm2.wrappedValue = "squarerightfwdslash"
                } else if match.currentGameNumber == 2 {
                    $match.games[1].timeOut3Game2ImageTm2.wrappedValue = "squarerightfwdslash"
                } else if match.currentGameNumber == 3 {
                    $match.games[2].timeOut3Game3ImageTm2.wrappedValue = "squarerightfwdslash"
                } else if match.currentGameNumber == 4 {
                    $match.games[3].timeOut3Game4ImageTm2.wrappedValue = "squarerightfwdslash"
                } else if match.currentGameNumber == 5 {
                    $match.games[4].timeOut3Game5ImageTm2.wrappedValue = "squarerightfwdslash"
                }
            default:
                print("Error setting image in switch statement of setTimeoutImage()")
            }
        }
        
        
    }
    
}

//struct TimeOutView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimeOutView()
//    }
//}
