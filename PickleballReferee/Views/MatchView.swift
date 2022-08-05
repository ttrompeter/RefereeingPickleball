//
//  MatchView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import RealmSwift
import SwiftUI

struct MatchView: View {
    
    @Environment(\.realm) var realm
    @Environment(\.dismiss) var dismiss
    @ObservedRealmObject var match: Match
    @State private var presentMatchSetupAlert = false
    @State private var presentMatchSetupButtonAlert = false
    @State private var presentStartingServerSetupAlert = false
    @State private var presentFirstServerAlert = false
    @State private var showingGameStartingServer = false
    
    var currentScoreDisplay: String {
        let servingTeamPoints = match.isTeam1Serving == true ? match.games[match.currentGameNumber - 1].gameScoreTeam1 : match.games[match.currentGameNumber - 1].gameScoreTeam2
        let receivingTeamPoints = match.isTeam1Serving == false ? match.games[match.currentGameNumber - 1].gameScoreTeam2 : match.games[match.currentGameNumber - 1].gameScoreTeam1
        let servingPlayer = match.isSecondServer == true ? "2" : "1"
        let currentScoreString = String(servingTeamPoints) + " - " + String(receivingTeamPoints) + " - \(servingPlayer)"
        return currentScoreString
    }
    
    var currentMatchStatusDisplay: String {
        switch match.selectedMatchFormat {
        case 1:
            return "Game \(match.currentGameNumber) of 1 games"
        case 2:
            return "Game \(match.currentGameNumber) of 3 games"
        case 3:
            return "Game \(match.currentGameNumber) of 5 games"
        default:
            print("Error selecting matchFormatDescription.")
            return "Unknown Match Format"
        }
    }

    
    var body: some View {
        
        VStack {
            Section {
                Text("Pickleball Match Scorsheet\n")
                    .foregroundColor(Constants.DARK_SLATE)
                    .font(.largeTitle)
            }
            .padding(.top, 50)
            
            // Heading and Setup Section
            Section  {
                
                HStack (alignment: .top, spacing: 40) {
                    Spacer()
                    VStack (alignment: .leading) {
                        
                        HStack {
                            VStack (alignment: .leading) {
                                Text("Event:")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Date:")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Location:")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Game Format:")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Game Number: ")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Starting Server: ")
                                    .foregroundColor(Constants.DARK_SLATE)
                            }
                            
                            VStack (alignment: .leading) {
                                Text(match.eventTitle)
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text(match.matchDate, format: .dateTime.month().day().year())
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text(match.matchLocation)
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text(match.gameFormatDescription)
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("\(match.currentGameNumber)")
                                    .foregroundColor(Constants.DARK_SLATE)
                                // TODO: - Fix this so only updates once when starting server is first set
                                Text(match.gameStartingServerName)
                                    .foregroundColor(Constants.DARK_SLATE)
                            }
                        }
                    }
                    Spacer()
                    VStack (alignment: .leading) {
                        
                        HStack (alignment: .top) {
                            VStack (alignment: .leading) {
                                Text("Match: ")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Court: ")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Referee: ")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Match Format: ")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Match Style: ")
                                    .foregroundColor(Constants.DARK_SLATE)
                                
                            }
                            
                            VStack (alignment: .leading) {
                                Text(match.matchNumber)
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text(match.courtNumber)
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text(match.games[match.currentGameNumber - 1].refereeName)
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text(match.matchFormatDescription)
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text(match.matchStyleDescription)
                                    .foregroundColor(Constants.DARK_SLATE)
                            }
                        }
                    }
                    Spacer()
                }
            }
            
            // Team Information Section
            Section {
                if match.isTeam1Serving {
                    TeamListingTeam1(match: match)
                } else {
                    TeamListingTeam2(match: match)
                }
            }
            
            //Scoring for Team 1 Section
            Section {
                if match.isTeam1Serving {
                    //("Team 1 Scoring Section")
                    ScoringSectionTeam1View(match: match)
                } else {
                    //Text("Team 2 Scoring Section")
                    ScoringSectionTeam2View(match: match)
                }
            }
            
            
            // Scoring Section
            Section {
                HStack (alignment: .top, spacing: 80) {
                    // Point Button
                    VStack {
                        Button {
                            pointScored()
                        } label: {
                            Text("Point")
                                .foregroundColor(Constants.DARK_SLATE)
                        }
                        .buttonStyle(PointSideoutButton())
                        .disabled(!match.isMatchSetup || !(match.servingPlayerNumber > 0))
                        
                        Text(currentMatchStatusDisplay)
                            .font(.headline)
                            .foregroundColor(Constants.DARK_SLATE.opacity(0.6))
                    }
                    
                    // Match Setup Warning
                    if !match.isMatchSetup {
                        ZStack {
                            Rectangle()
                                .frame(width: CGFloat(120), height: CGFloat(80))
                                .foregroundColor(Constants.CRIMSON)
                                .cornerRadius(10)
                                .shadow(radius: 5)

                            Button {
                                presentMatchSetupButtonAlert.toggle()
                            } label: {
                                Text("Complete\nMatch Setup")
                                    .foregroundColor(.white)
                            }
                            //.buttonStyle(OptionsButton())
                            .sheet(isPresented: $presentMatchSetupButtonAlert) { MatchSetupView(match:match) }
                        }
                    } else if match.isMatchSetup {
                        if (match.servingPlayerNumber == 0) {
                            ZStack {
                                Rectangle()
                                    .frame(width: CGFloat(120), height: CGFloat(80))
                                    .foregroundColor(Constants.BRIGHT_YARROW)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                
                                Button("Must Set\nStarting Server") {
                                    presentStartingServerSetupAlert = true
                                }
                                .alert("Select the starting server", isPresented: $presentStartingServerSetupAlert) {
                                    Button(match.namePlayer1Team1) {
                                        $match.servingPlayerNumber.wrappedValue = 1
                                        $match.gameStartingServerName.wrappedValue = setStartingServerName()
                                        presentStartingServerSetupAlert.toggle()
                                    }
                                    Button(match.namePlayer1Team2) {
                                        $match.servingPlayerNumber.wrappedValue = 3
                                        $match.gameStartingServerName.wrappedValue = setStartingServerName()
                                        $match.isTeam1Serving.wrappedValue = false
                                        presentStartingServerSetupAlert.toggle()
                                    }
                                }
                            }
                        } else {
                            VStack (spacing: 10) {
                                HStack {
                                    Text("Score: ")
                                        .font(.title)
                                        .foregroundColor(Constants.DARK_SLATE)
                                    Text(currentScoreDisplay)
                                        .font(.largeTitle)
                                        .foregroundColor(Constants.CRIMSON)
                                }
                                .padding(20)
                            }
                            .background(Constants.CLOUDS)
                        }
                    }
                    
                    VStack {
                        
                        // 2nd Server / Side Out Button
                        Button {
                            
                            if match.isSecondServer {
                                // Side Out Button label is showing and second server is serving
                                // Button pushed when Side Out label showing
                                // Set isSecondServer value to false
                                $match.isSecondServer.wrappedValue = false
                                $match.whoIsServingText.wrappedValue = "1st Server"
                                //match.serverNumber.wrappedValue = 1
                                
                                // Team Service game is over so change value for isTeam1Serving
                                $match.isTeam1Serving.wrappedValue.toggle()
                                // Set server to the next server
                                setWhoIsServing()
                            } else {
                                // 2nd Server Button label is showing and 1st server is serving
                                // Button is pushed when 2nd Server label is showing
                                $match.isSecondServer.wrappedValue = true
                                $match.whoIsServingText.wrappedValue = "2nd Server"
                                // Set server to the next server
                                setWhoIsServing()
                            }
                            
                        } label: {
                            if match.isSecondServer {
                                // Change button label to Side Out
                                // It is Second Server
                                Text("Side Out")
                                    .foregroundColor(Constants.DARK_SLATE)
                                
                            } else {
                                // It is First Server
                                Text("2nd Server")
                                    .foregroundColor(Constants.DARK_SLATE)
                            }
                        }
                        .buttonStyle(PointSideoutButton())
                        .disabled(!match.isMatchSetup  || !(match.servingPlayerNumber > 0))
                        
                        Text("\(match.whoIsServingText) is Serving")
                            .font(.headline)
                            .foregroundColor(Constants.DARK_SLATE.opacity(0.6))
                    }
                }
                .padding(10)
            }
            
            
            // Initials & Score Recording Section
            Section {
                VStack {
                    //Spacer()
                    HStack {
                        
                        HStack {
                            HStack {
                                Text("Winnng Team Score: ")
                                Text("\(match.games[match.currentGameNumber - 1].finalScoreWinningTeam)")
                                    .font(.caption2).italic()
                            }
                            HStack {
                                Text("Initials: ")
                                Text("_______")
                                //TextField("____", text: $match.initialsWinningTeam)
                            }
                        }
                        // Spacing between teams
                        Text("          ||          ")
                        HStack {
                            HStack {
                                Text("Losing Team Score: ")
                                Text("\(match.games[match.currentGameNumber - 1].finalScoreLosingTeam)")
                                    .font(.caption2).italic()
                            }
                            HStack {
                                Text("Initials: ")
                                Text("_______")
                                //TextField("____", text: $model.initialsLosingTeam)
                            }
                        }
                        .rotationEffect(.degrees(180))
                    }
                    .font(.subheadline.italic())
                    .foregroundColor(Constants.SLATE_GRAY)
                    .padding()
                    .background(Constants.CLOUDS.opacity(0.6))
                    .padding(.bottom, 10)
                    //Spacer()
                }
            }
            
            // Scoring For Team 2 Section
            Section {
                if match.isTeam1Serving {
                    ScoringSectionTeam2View(match: match)
                        .rotationEffect(.degrees(180))
                } else {
                    ScoringSectionTeam1View(match: match)
                        .rotationEffect(.degrees(180))
                }
            }
            
            // Team 2 Information
            Section {
                if match.isTeam1Serving {
                    TeamListingTeam2(match: match)
                } else {
                    TeamListingTeam1(match: match)
                }
            }
            .rotationEffect(.degrees(180))
            
            // Empty text field for spacing
            Text(" ")
                .padding()
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        //        .onAppear {
        //            if !match.isMatchSetup {
        //                presentMatchSetupAlert.toggle()
        //            }
        ////            else {
        ////                presentFirstServerAlert.toggle()
        ////            }
        //        }
        .alert("Please set up Match before trying to start Match. The application will not run unless the Match has been set up first.", isPresented: $presentMatchSetupAlert, actions: {})
        //        .alert("Select server starting Game", isPresented: $presentFirstServerAlert) {
        //            Button(match.namePlayer1Team1) { match.games[match.currentGameNumber - 1].gameStartingServer = 1 }
        //            Button(match.namePlayer2Team1) { match.games[match.currentGameNumber - 1].gameStartingServer = 2 }
        //            Button(match.namePlayer1Team2) { match.games[match.currentGameNumber - 1].gameStartingServer = 3 }
        //            Button(match.namePlayer2Team2) { match.games[match.currentGameNumber - 1].gameStartingServer = 4 }
        //        }
        
    }
    
    
    // MARK: - Funtions
    
    func setStartingServerName() -> String{
        print("Starting setStartingServerName()")
        switch match.servingPlayerNumber {
        case 0:
            return "Undetermined"
        case 1:
            return match.namePlayer1Team1
        case 3:
            return match.namePlayer1Team2
        default:
            print("Error in setting gameStartingServerDescription")
            return "Error"
        }
    }
    
    
    func setWhoIsServing() {
        
        switch match.servingPlayerNumber {
        case 1:
            if match.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam2) % 2) == 0 {
                    $match.servingPlayerNumber.wrappedValue = 3
                    print("Player1Team1 was serving, server is set to Player1Team2")
                } else {
                    $match.servingPlayerNumber.wrappedValue = 4
                    print("Player1Team1 was serving, server is set to Player2Team2")
                }
            } else {
                $match.servingPlayerNumber.wrappedValue = 2
                print("Player1Team1 was serving, server is set to Player2Team1")
            }
        case 2:
            if match.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam2) % 2) == 0 {
                    $match.servingPlayerNumber.wrappedValue = 3
                    print("Player2Team1 was serving, server is set to Player1Team2")
                } else {
                    $match.servingPlayerNumber.wrappedValue = 4
                    print("Player2Team1 was serving, server is set to Player2Team2")
                }
            } else {
                $match.servingPlayerNumber.wrappedValue = 1
                print("Player2Team1 was serving, server is set to Player1Team1")
            }
        case 3:
            if match.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam1) % 2) == 0 {
                    $match.servingPlayerNumber.wrappedValue = 1
                    print("Player1Team2 was serving, server is set to Player1Team1")
                } else {
                    $match.servingPlayerNumber.wrappedValue = 2
                    print("Player1Team2 was serving, server is set to Player2Team1")
                }
            } else {
                $match.servingPlayerNumber.wrappedValue = 4
                print("Player1Team2 was serving, server is set to Player2Team2")
            }
        case 4:
            if match.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam2) % 2) == 0 {
                    $match.servingPlayerNumber.wrappedValue = 1
                    print("Player2Team2 was serving, server is set to Player1Team1")
                } else {
                    $match.servingPlayerNumber.wrappedValue = 2
                    print("Player2Team2 was serving, server is set to Player2Team1")
                }
            } else {
                $match.servingPlayerNumber.wrappedValue = 3
                print("Player2Team2 was serving, server is set to Player1Team2")
            }
        default:
            print("Error in function setWhoIsServing()")
        }
    }
    
    
}

//struct MatchView_Previews: PreviewProvider {
//    static var previews: some View {
//        MatchView(match: Match())
//    }
//}

/*
 // Scoresheet Information
 
 End-Change Marks
 AT 6 of the third game for 3 games to 11 points
 At 8 of the third game for 3 games to 15 points
 AT 11 of the third game for 3 games to 21 points
 
 */




// MARK: - Extension for Saving Images

extension MatchView {
    
    func pointScored() {
        
        //print("gameScoreTeam1 in pointScored(): \(model.gameScoreTeam1)")
        //print("gameScoreTeam2 in pointScored(): \(model.gameScoreTeam2)")
        
        if match.servingPlayerNumber == 1 {
            // Player 1 Team 1 is serving as second server on Team 1
            if match.isSecondServer {
                // Second server uses backslash to mark points - "squareleftbackslash"
                
                $match.games[match.currentGameNumber - 1].player1Team1Points.wrappedValue += 1
                switch match.games[match.currentGameNumber - 1].gameScoreTeam1 {
                case 1:
                    $match.games[match.currentGameNumber - 1].point1Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    //$match.games[match.currentGameNumber - 1].gameScoreImages.point1Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    //model.match.games![model.gameNumber - 1].gameScoreImages!.point2Game1ImageTm1 = "squareleftbackslash"
//                case 2:
//                    $match.games[match.currentGameNumber - 1].point2Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 3:
//                    $match.games[match.currentGameNumber - 1].point3Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 4:
//                    $match.games[match.currentGameNumber - 1].point4Game1ImageTm1.wrappedValue = "squareleftbackslash"
                default:
                    print("Error setting image in switch statement of pointScored()")
                }
            } else {
                // Player 1 Team 1 is serving as first server on Team 1
                // First server uses forwardslash to mark points - "squareleftfwdslash"
                $match.games[match.currentGameNumber - 1].player1Team1Points.wrappedValue += 1
                switch match.games[match.currentGameNumber - 1].gameScoreTeam1 {
                case 1:
                    $match.games[match.currentGameNumber - 1].point1Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 2:
//                    $match.games[match.currentGameNumber - 1].point2Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 3:
//                    $match.games[match.currentGameNumber - 1].point3Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 4:
//                    $match.games[match.currentGameNumber - 1].point4Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                default:
                    print("Error setting image in switch statement of pointScored()")
                }
            }
        }
    }
}






