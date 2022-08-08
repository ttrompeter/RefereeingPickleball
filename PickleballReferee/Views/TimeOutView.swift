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
    @State private var isServingTeamButtonSelected = false
    @State private var isReceivingTeamButtonSelected = false
    @State private var isButtonTapped = false
    @State private var presentReceivingTeamNoTimeOutsAvailableAlert = false
    @State private var presentServingTeamNoTimeOutsAvailableAlert = false
    
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
                            if match.isTeam1Serving {
                                Text("     Serving team you have ") + Text("\(3 - match.games[match.currentGameNumber - 1].timeOutsTeam1)  timeouts remaining")
                                    .font(.title3)
                                    .foregroundColor(Constants.CRIMSON)
                                Text("     Receiving team you have ") + Text("\(3 - match.games[match.currentGameNumber - 1].timeOutsTeam2)  timeouts remaining")
                                    .font(.title3)
                                    .foregroundColor(Constants.CRIMSON)
                            } else {
                                Text("     Receiving team you have ") + Text("\(3 - match.games[match.currentGameNumber - 1].timeOutsTeam2)  timeouts remaining")
                                    .font(.title3)
                                    .foregroundColor(Constants.CRIMSON)
                                Text("     Serving team you have ") + Text("\(3 - match.games[match.currentGameNumber - 1].timeOutsTeam1)  timeouts remaining")
                                    .font(.title3)
                                    .foregroundColor(Constants.CRIMSON)
                            }
                            Text("\u{2022}") + Text(" Check readiness of line judges  (if applicable)")
                            Text("\u{2022}") + Text(" Announce: Time in")
                            Text("\u{2022}") + Text(" Announce score:  ") + Text("\(match.scoreDisplay)")
                                                                                .font(.title3)
                                                                                .foregroundColor(Constants.CRIMSON)
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
                            if validateTimeOut(team: 1) {
                                timeOutTaken(teamTakingTimeOut: 1)
                                isServingTeamButtonSelected = true
                                isButtonTapped = true
                            } else {
                                presentServingTeamNoTimeOutsAvailableAlert = true
                            }
                            
                        } label: {
                            Text("Serving Team")
                        }
                        .buttonStyle(TimeoutsButtonStyle())
                        .disabled(isButtonTapped)
                        .alert("Receiving Team has no Time Outs available.", isPresented: $presentServingTeamNoTimeOutsAvailableAlert, actions: {})
                        if match.isTeam1Serving {
                            Text("\(match.namePlayer1Team1) | \(match.namePlayer2Team1)")
                                .font(.body).italic()
                                .foregroundColor(Constants.MINT_LEAF)
                        } else {
                            Text("\(match.namePlayer1Team2) | \(match.namePlayer2Team2)")
                                .font(.body).italic()
                                .foregroundColor(Constants.MINT_LEAF)
                        }
                        
                        Spacer()
                        Button {
                            if validateTimeOut(team: 2) {
                                timeOutTaken(teamTakingTimeOut: 2)
                                isReceivingTeamButtonSelected = true
                                isButtonTapped = true
                            } else {
                                presentReceivingTeamNoTimeOutsAvailableAlert = true
                            }
                        } label: {
                            Text("Receiving Team")
                        }
                        .buttonStyle(TimeoutsButtonStyle())
                        .disabled(isButtonTapped)
                        .alert("Receiving Team has no Time Outs available.", isPresented: $presentReceivingTeamNoTimeOutsAvailableAlert, actions: {})
                        if match.isTeam1Serving {
                            Text("\(match.namePlayer1Team2) | \(match.namePlayer2Team2)")
                                .font(.body).italic()
                                .foregroundColor(Constants.MINT_LEAF)
                        } else {
                            Text("\(match.namePlayer1Team1) | \(match.namePlayer2Team1)")
                                .font(.body).italic()
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
                .buttonStyle(SheetButtonStyle())
            }
            .padding(.bottom, 5)
        }
    }
    
    
    func validateTimeOut(team: Int) -> Bool {
        
        if team == 1 {
            // Time Out by Serving Team
            if match.isTeam1Serving {
                if match.games[match.currentGameNumber - 1].timeOutsTeam1 > 2 {
                    // No timeouts avaiable
                    return false
                }
                
            } else {
                if match.games[match.currentGameNumber - 1].timeOutsTeam2 > 2 {
                    // No timeouts avaiable
                    return false
                }
            }
        } else {  // team == 2
            // Time Out by Receiving Team
            if match.isTeam1Serving {
                if match.games[match.currentGameNumber - 1].timeOutsTeam2 > 2 {
                    // No timeouts avaiable
                    return false
                }
            } else {
                if match.games[match.currentGameNumber - 1].timeOutsTeam1 > 2 {
                    // No timeouts avaiable
                    return false
                }
            }
        }
        return true
    }
    
    
    func timeOutTaken (teamTakingTimeOut: Int) {
        
        if teamTakingTimeOut == 1 {
            // Time Out by Serving Team
            if match.isTeam1Serving {
                $match.games[match.currentGameNumber - 1].timeOutsTeam1.wrappedValue += 1
                setTimeoutImage(team: 1)
                $match.isTimeOutTaken.wrappedValue = true
                $match.teamTakingTimeout.wrappedValue = 1
            } else {
                $match.games[match.currentGameNumber - 1].timeOutsTeam2.wrappedValue += 1
                setTimeoutImage(team: 2)
                $match.isTimeOutTaken.wrappedValue = true
                $match.teamTakingTimeout.wrappedValue = 2
            }
            
        } else {  // teamTakingTimeout == 2
            // Time Out by Receiving Team
            if match.isTeam1Serving {
                $match.games[match.currentGameNumber - 1].timeOutsTeam2.wrappedValue += 1
                setTimeoutImage(team: 1)
                $match.isTimeOutTaken.wrappedValue = true
                $match.teamTakingTimeout.wrappedValue = 2
            } else {
                $match.games[match.currentGameNumber - 1].timeOutsTeam1.wrappedValue += 1
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
        print("timeOutsTeam2: \(match.games[match.currentGameNumber - 1].timeOutsTeam2)")
        
        if team == 1 {
            print("In if team 1 setTimeoutImage()")
            switch match.games[match.currentGameNumber - 1].timeOutsTeam1 {
            case 1:
                if match.currentGameNumber == 1 {
                    print("In if team 1 Game 1 before setTimeoutImage()")
                    $match.games[0].timeOut1Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                  // match.games[match.currentGameNumber - 1].timeOut1Game2ImageTm1
                    print("In if team 1 Game 1 after setTimeoutImage()\n")
                } else if match.currentGameNumber == 2 {
                    print("In if team 1 Game 2 before setTimeoutImage()")
                    $match.games[1].timeOut1Game2ImageTm1.wrappedValue = "squareleftfwdslash"   // This is in Game
                    $match.matchLocation.wrappedValue = "From Timeouts"                         // This is in Match
                    $match.games[1].refereeName.wrappedValue = "From Timeouts"                  // This is in Game
                    $match.games[1].serverNameGame2Team1.wrappedValue = "From Timeouts"         // This is in Game
                    print("In if team 1 Game 2 after setTimeoutImage()\n")
                } else if match.currentGameNumber == 3 {
                    $match.games[2].timeOut1Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 4 {
                    $match.games[3].timeOut1Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 5 {
                    $match.games[4].timeOut1Game5ImageTm1.wrappedValue = "squarerightfwdslash"
                }
            case 2:
                if match.currentGameNumber == 1 {
                    $match.games[0].timeOut2Game1ImageTm1.wrappedValue = "squarerightfwdslash"
                } else if match.currentGameNumber == 2 {
                    $match.games[1].timeOut2Game2ImageTm1.wrappedValue = "squarerightfwdslash"
                } else if match.currentGameNumber == 3 {
                    $match.games[2].timeOut2Game3ImageTm1.wrappedValue = "squarerightfwdslash"
                } else if match.currentGameNumber == 4 {
                    $match.games[3].timeOut2Game4ImageTm1.wrappedValue = "squarerightfwdslash"
                } else if match.currentGameNumber == 5 {
                    $match.games[4].timeOut2Game5ImageTm1.wrappedValue = "squarerightfwdslash"
                }
            case 3:
                if match.currentGameNumber == 1 {
                    $match.games[0].timeOut3Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 2 {
                    $match.games[1].timeOut3Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 3 {
                    $match.games[2].timeOut3Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 4 {
                    $match.games[3].timeOut3Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                } else if match.currentGameNumber == 5 {
                    $match.games[4].timeOut3Game5ImageTm1.wrappedValue = "squarerightfwdslash"
                }
            default:
                print("Error setting image in switch statement of setTimeoutImage()")
            }
            
        } else if team == 2 {
            print("In if team 2 setTimeoutImage()\n")
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


//                        .padding()
//                        .frame(width: 180, height: 40)
//                        .background(isServingTeamButtonSelected ? Constants.MINT_LEAF : Constants.SILVER)
//                        .font(.body)
//                        .foregroundColor(isServingTeamButtonSelected ? Constants.WHITE : Constants.DARK_SLATE)
//                        .clipShape(Capsule())
