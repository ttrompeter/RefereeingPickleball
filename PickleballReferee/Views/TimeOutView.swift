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
    //@ObservedRealmObject var game: Game
    
    var body: some View {
        
        VStack (spacing: 10) {
            
            Text("Time Out")
                .bold()
                .font(.largeTitle)
                .padding(.top, 5)
            
            HStack (alignment: .top) {
                ZStack {
                    Rectangle()
                        .frame(width: CGFloat(660), height: CGFloat(440))
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
                            Text("\u{2022}") + Text(" The score is  ____  /  ___  /  ___")
                            Text("\u{2022}") + Text(" Warning: You have one minute")
                            Text("\u{2022}") + Text(" Move to center court")
                            Text("\u{2022}") + Text(" Record time out in the appropriate box on scoresheet")
                        }
                        Group {
                            Text("\u{2022}") + Text(" At 15 seconds remaining, announce:")
                            Text("\u{2022}") + Text(" Warning: Fifteen Seconds")
                            Text("\u{2022}") + Text(" Move back to your referee position")
                            Text("\u{2022}") + Text(" Announce:")
                            Text("     Receiving team you have  ____  timeout remaining")
                            Text("     Serving team you have  ____  timeout remaining")
                            Text("\u{2022}") + Text(" Check readiness of line judges  (if applicable)")
                            Text("\u{2022}") + Text(" Announce: Time in")
                            Text("\u{2022}") + Text(" Announce score:  ____  /  ____  /  ____ ")
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
                            //print("timeOutsTeam1: \( model.timeOutsTeam1)")
                        } label: {
                            Text("Team 1")
                        }
                        .buttonStyle(OptionsButton())
                        Spacer()
                        Button {
                            timeOutTaken(teamTakingTimeOut: 2)
                            //print("timeOutsTeam2: \( model.timeOutsTeam2)")
                        } label: {
                            Text("Team 2")
                        }
                        .buttonStyle(OptionsButton())
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
        
        //print("timeOutsTeam1 in pointScored(): \(model.timeOutsTeam1)")
        //print("timeOutsTeam2 in pointScored(): \(model.timeOutsTeam2)")
        
        if teamTakingTimeOut == 1 {
            // Time Out by Team 1
            //model.timeOutsTeam1 += 1
            //print("model.timeOutsTeam1: \(model.timeOutsTeam1)")
            
//            switch model.timeOutsTeam1 {
//            case 1:
//                ""
//                //model.timeOut1Game1ImageTm1 = "squareleftfwdslash"
//            case 2:
//                ""
//                //model.timeOut2Game1ImageTm1 = "squareleftfwdslash"
//            case 3:
//                ""
//                //model.timeOut3Game1ImageTm1 = "squareleftfwdslash"
//            default:
//                print("Error setting image for time out.")
//            }
        } else {
            // Time Out by Team 2
            //model.timeOutsTeam2 += 1
            //print("model.timeOutsTeam2: \(model.timeOutsTeam2)")
            
//            switch model.timeOutsTeam2 {
//            case 1:
//                //model.timeOut1Game1ImageTm2 = "squareleftfwdslash"
//            case 2:
//                //model.timeOut2Game1ImageTm2 = "squareleftfwdslash"
//            case 3:
//                //model.timeOut3Game1ImageTm2 = "squareleftfwdslash"
//            default:
//                print("Error setting image for time out.")
//            }
        }
    }
    
}

//struct TimeOutView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimeOutView()
//    }
//}
