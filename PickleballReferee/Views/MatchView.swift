//
//  MatchView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import RealmSwift
import SwiftUI

struct MatchView: View {
    
    @ObservedRealmObject var match: Match
    @State private var presentMatchSetupAlert = false
    @State private var presentFirstServerAlert = false
    @State private var showingGameFirstServer = false
    
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
    
    var gameStartingServerDescription: String {
        switch match.games[match.currentGameNumber - 1].selectedGameStartingServer {
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
    
    var body: some View {
        
        VStack {
            Section {
                Text("Pickleball Match Scorsheet")
                    .foregroundColor(Constants.DARK_SLATE)
                    .font(.largeTitle)
            }
            .padding(.bottom, 10)
            
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
                            }
                        }
                        
                        if match.games[match.currentGameNumber - 1].selectedGameStartingServer > 0 {
                            HStack {
                                Text("Starting Server: ")
                                    .foregroundColor(Constants.DARK_SLATE)
                               
                                Picker(selection: $match.games[match.currentGameNumber - 1].selectedGameStartingServer,
                                       label: Text("Starting Server"),
                                       content:  {
                                    Text("Select Starting Server").tag(0)
                                        .foregroundColor(Constants.CRIMSON)
                                    Text(match.namePlayer1Team1).tag(1)
                                    Text(match.namePlayer1Team2).tag(3)
                                })
                                .pickerStyle(MenuPickerStyle())
                                .fixedSize()
                            }
                            
                        } else {
                            HStack {
                                Text("Starting Server: ")
                                    .foregroundColor(Constants.CRIMSON)
                                Picker(selection: $match.games[match.currentGameNumber - 1].selectedGameStartingServer,
                                       label: Text("Starting Server"),
                                       content:  {
                                    Text("Select Starting Server").tag(0)
                                        .foregroundColor(Constants.CRIMSON)
                                    Text(match.namePlayer1Team1).tag(1)
                                    Text(match.namePlayer1Team2).tag(3)
                                })
                                .pickerStyle(MenuPickerStyle())
                                .fixedSize()
//                                .onReceive([self.match.games[match.currentGameNumber - 1].selectedGameStartingServer].publisher.first()) { value in
//                                    self.setGameStartingServer(valueParam: value)
//                                }
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
                                Text(match.games[match.currentGameNumber - 1].courtNumber)
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
                            //match.save()

                        } label: {
                            Text("Point")
                                .foregroundColor(Constants.DARK_SLATE)
                        }
                        .buttonStyle(PointSideoutButton())
                        .disabled(!match.isMatchSetup)
                        
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
                            Text("Complete\nMatch Setup")
                                .padding(5)
                                .font(.body)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                    } else if match.isMatchSetup {
                        if !(match.games[match.currentGameNumber - 1].selectedGameStartingServer > 0) {
                            VStack {
                                Text("Must Set Game Starting Server")
                                    .font(.headline)
                                    .foregroundColor(Constants.CRIMSON.opacity(0.6))
                                Text("\(match.games[match.currentGameNumber - 1].selectedGameStartingServer)")
                            }
                        }
                        
                    }
                    if match.games[match.currentGameNumber - 1].selectedGameStartingServer > 0 {
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
                    VStack {
                        
                        // 2nd Server / Side Out Button
                        Button {
                            
                            if match.isSecondServer {
                                // Side Out Button label is showing and second server is serving
                                // Button pushed when Side Out label showing
                                // Set isSecondServer value to false
                                match.isSecondServer = false
                                match.whoIsServingText = "1st Server"
                                //match.serverNumber.wrappedValue = 1
                                
                                // Team Service game is over so change value for isTeam1Serving
                                match.isTeam1Serving.toggle()
                                // Set server to the next server
                                setWhoIsServing()
                            } else {
                                // 2nd Server Button label is showing and 1st server is serving
                                // Button is pushed when 2nd Server label is showing
                                match.isSecondServer = true
                                match.whoIsServingText = "2nd Server"
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
                        .disabled(!match.isMatchSetup)
                        
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
    
    func setGameStartingServer(valueParam: Int) {
        print("")
        print("Starting setGameStartingServer()")
        print("selectedGameStartingServer value Before: \(match.games[match.currentGameNumber - 1].selectedGameStartingServer)")
        $match.games[match.currentGameNumber - 1].selectedGameStartingServer.wrappedValue = valueParam
        print("selectedGameStartingServer value Afer: \(match.games[match.currentGameNumber - 1].selectedGameStartingServer)")
        print("")
    }
    
    func setWhoIsServing() {
        
        switch match.servingPlayerNumber {
        case 1:
            if match.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam2) % 2) == 0 {
                    match.servingPlayerNumber = 3
                    print("Player1Team1 was serving, server is set to Player1Team2")
                } else {
                    match.servingPlayerNumber = 4
                    print("Player1Team1 was serving, server is set to Player2Team2")
                }
            } else {
                match.servingPlayerNumber = 2
                print("Player1Team1 was serving, server is set to Player2Team1")
            }
        case 2:
            if match.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam2) % 2) == 0 {
                    match.servingPlayerNumber = 3
                    print("Player2Team1 was serving, server is set to Player1Team1")
                } else {
                    match.servingPlayerNumber = 4
                    print("Player2Team1 was serving, server is set to Player2Team1")
                }
            } else {
                match.servingPlayerNumber = 1
                print("Player2Team1 was serving, server is set to Player1Team1")
            }
        case 3:
            if match.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam1) % 2) == 0 {
                    match.servingPlayerNumber = 1
                    print("Player1Team2 was serving, server is set to Player1Team1")
                } else {
                    match.servingPlayerNumber = 2
                    print("Player1Team2 was serving, server is set to Player2Team1")
                }
            } else {
                match.servingPlayerNumber = 4
                print("Player1Team2 was serving, server is set to Player2Team2")
            }
        case 4:
            if match.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam2) % 2) == 0 {
                    match.servingPlayerNumber = 1
                    print("Player2Team2 was serving, server is set to Player1Team1")
                } else {
                    match.servingPlayerNumber = 2
                    print("Player2Team2 was serving, server is set to Player2Team1")
                }
            } else {
                match.servingPlayerNumber = 3
                print("Player2Team2 was serving, server is set to Player1Team2")
            }
        default:
            print("Error in function setWhoIsServing()")
        }
    }
        
    
    func pointScored() {
        
        //print("gameScoreTeam1 in pointScored(): \(model.gameScoreTeam1)")
        //print("gameScoreTeam2 in pointScored(): \(model.gameScoreTeam2)")
        
        if match.servingPlayerNumber == 1 {
            // Player1Team1 is serving
            if match.isSecondServer {
                // Backslash
                $match.games[match.currentGameNumber - 1].player1Team1Points.wrappedValue += 1
                //match.games[match.currentGameNumber - 1].gameScoreImages!.point1Game1ImageTm1 = "squareleftbackslash"
                match.games[match.currentGameNumber - 1].gameScoreImages!.point1Game1ImageTm1 = "squareleftbackslash"
            } else {
                // Forwardslash
                $match.games[match.currentGameNumber - 1].player1Team1Points.wrappedValue += 1
                match.games[match.currentGameNumber - 1].gameScoreImages!.point1Game1ImageTm1 = "squareleftfwdslash"
            }
        } else if match.servingPlayerNumber == 2  {
            // Player2Team1 is serving
        } else if match.servingPlayerNumber == 3  {
            // Player1Team2 is serving
        } else if match.servingPlayerNumber == 4  {
            // Player2Team2 is serving
        }
        
        
        
        
        
        
        if match.isTeam1Serving {
            // Point scored for Team 1
            if match.isSecondServer {
                // Second server scored the point
                /*
                 model.match.games![model.gameNumber - 1].player2Team1Points += 1
                 print("model.player2Team1Points: \(model.player2Team1Points)")
                 model.gameScoreTeam1 += 1
                 print("model.gameScoreTeam1: \(model.gameScoreTeam1)")
                 switch model.gameScoreTeam1 {
                 case 1:
                 model.point1Game1ImageTm1 = "squareleftbackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point1Game1ImageTm1 = "squareleftbackslash"
                 case 2:
                 model.point2Game1ImageTm1 = "squareleftbackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point2Game1ImageTm1 = "squareleftbackslash"
                 case 3:
                 model.point3Game1ImageTm1 = "squareleftbackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point3Game1ImageTm1 = "squareleftbackslash"
                 case 4:
                 model.point4Game1ImageTm1 = "squareleftbackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point4Game1ImageTm1 = "squareleftbackslash"
                 case 5:
                 model.point5Game1ImageTm1 = "squareleftbackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point5Game1ImageTm1 = "squareleftbackslash"
                 case 6:
                 model.point6Game1ImageTm1 = "squareleftbackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point6Game1ImageTm1 = "squareleftbackslash"
                 case 7:
                 model.point7Game1ImageTm1 = "squareleftbackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point7Game1ImageTm1 = "squareleftbackslash"
                 case 8:
                 model.point8Game1ImageTm1 = "squareleftbackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point8Game1ImageTm1 = "squareleftbackslash"
                 case 9:
                 model.point9Game1ImageTm1 = "squareleftbackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point9Game1ImageTm1 = "squareleftbackslash"
                 case 10:
                 model.point10Game1ImageTm1 = "squareleftbackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point10Game1ImageTm1 = "squareleftbackslash"
                 case 11:
                 model.point11Game1ImageTm1 = "squareleftbackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point11Game1ImageTm1 = "squareleftbackslash"
                 case 12:
                 model.point12Game1ImageTm1 = "squareleftbackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point12Game1ImageTm1 = "squareleftbackslash"
                 case 13:
                 model.point13Game1ImageTm1 = "squareleftbackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point13Game1ImageTm1 = "squareleftbackslash"
                 case 14:
                 model.point14Game1ImageTm1 = "squareleftbackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point14Game1ImageTm1 = "squareleftbackslash"
                 case 15:
                 model.point15Game1ImageTm1 = "squareleftbackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point15Game1ImageTm1 = "squareleftbackslash"
                 case 16:
                 model.point16Game1ImageTm1 = "squareleftbackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point16Game1ImageTm1 = "squareleftbackslash"
                 case 17:
                 model.point17Game1ImageTm1 = "squareleftbackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point17Game1ImageTm1 = "squareleftbackslash"
                 case 18:
                 model.point18Game1ImageTm1 = "squareleftbackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point18Game1ImageTm1 = "squareleftbackslash"
                 case 19:
                 model.point19Game1ImageTm1 = "squareleftbackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point19Game1ImageTm1 = "squareleftbackslash"
                 case 20:
                 model.point20Game1ImageTm1 = "squareleftbackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point20Game1ImageTm1 = "squareleftbackslash"
                 case 21:
                 model.point21Game1ImageTm1 = "squarebackslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point21Game1ImageTm1 = "squarebackslash"
                 default:
                 model.point1Game1ImageTm1 = "square"
                 print("Error setting image in switch statement")
                 }
                 */
            } else {
                // First server scored the point
                /*
                 model.match.games![model.gameNumber - 1].player1Team1Points += 1
                 print("model.player1Team1Points: \(model.player1Team1Points)")
                 model.gameScoreTeam1 += 1
                 print("model.gameScoreTeam1: \(model.gameScoreTeam1)")
                 switch model.gameScoreTeam1 {
                 case 1:
                 model.point1Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point1Game1ImageTm1 = "squareleftfwdslash"
                 case 2:
                 model.point2Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point2Game1ImageTm1 = "squareleftfwdslash"
                 case 3:
                 model.point3Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point3Game1ImageTm1 = "squareleftfwdslash"
                 case 4:
                 model.point4Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point4Game1ImageTm1 = "squareleftfwdslash"
                 case 5:
                 model.point5Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point5Game1ImageTm1 = "squareleftfwdslash"
                 case 6:
                 model.point6Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point6Game1ImageTm1 = "squareleftfwdslash"
                 case 7:
                 model.point7Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point7Game1ImageTm1 = "squareleftfwdslash"
                 case 8:
                 model.point8Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point8Game1ImageTm1 = "squareleftfwdslash"
                 case 9:
                 model.point9Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point9Game1ImageTm1 = "squareleftfwdslash"
                 case 10:
                 model.point10Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point10Game1ImageTm1 = "squareleftfwdslash"
                 case 11:
                 model.point11Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point11Game1ImageTm1 = "squareleftfwdslash"
                 case 12:
                 model.point12Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point12Game1ImageTm1 = "squareleftfwdslash"
                 case 13:
                 model.point13Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point13Game1ImageTm1 = "squareleftfwdslash"
                 case 14:
                 model.point14Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point14Game1ImageTm1 = "squareleftfwdslash"
                 case 15:
                 model.point15Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point15Game1ImageTm1 = "squareleftfwdslash"
                 case 16:
                 model.point16Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point16Game1ImageTm1 = "squareleftfwdslash"
                 case 17:
                 model.point17Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point17Game1ImageTm1 = "squareleftfwdslash"
                 case 18:
                 model.point18Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point18Game1ImageTm1 = "squareleftfwdslash"
                 case 19:
                 model.point19Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point19Game1ImageTm1 = "squareleftfwdslash"
                 case 20:
                 model.point20Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point20Game1ImageTm1 = "squareleftfwdslash"
                 case 21:
                 model.point21Game1ImageTm1 = "squareleftfwdslash"
                 model.match.games![model.gameNumber - 1].gameScoreImages!.point21Game1ImageTm1 = "squarefwdslash"
                 default:
                 model.point1Game1ImageTm1 = "square"
                 print("Error setting image in switch statement")
                 }
                 */
            }
        } else if !match.isTeam1Serving {
            /*
             // Point scored for Team 2
             if model.isSecondServer {
             // Second server scored the point
             model.match.games![model.gameNumber - 1].player2Team2Points += 1
             print("model.player2Team2Points: \(model.player2Team2Points)")
             model.gameScoreTeam2 += 1
             print("model.gameScoreTeam2: \(model.gameScoreTeam2)")
             switch model.gameScoreTeam2 {
             case 1:
             model.point1Game1ImageTm2 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point1Game1ImageTm2 = "squareleftbackslash"
             case 2:
             model.point2Game1ImageTm2 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point2Game1ImageTm2 = "squareleftbackslash"
             case 3:
             model.point3Game1ImageTm2 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point3Game1ImageTm2 = "squareleftbackslash"
             case 4:
             model.point4Game1ImageTm2 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point4Game1ImageTm2 = "squareleftbackslash"
             case 5:
             model.point5Game1ImageTm2 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point5Game1ImageTm2 = "squareleftbackslash"
             case 6:
             model.point6Game1ImageTm2 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point6Game1ImageTm2 = "squareleftbackslash"
             case 7:
             model.point7Game1ImageTm2 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point7Game1ImageTm2 = "squareleftbackslash"
             case 8:
             model.point8Game1ImageTm2 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point8Game1ImageTm2 = "squareleftbackslash"
             case 9:
             model.point9Game1ImageTm2 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point9Game1ImageTm2 = "squareleftbackslash"
             case 10:
             model.point10Game1ImageTm2 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point10Game1ImageTm2 = "squareleftbackslash"
             case 11:
             model.point11Game1ImageTm2 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point11Game1ImageTm2 = "squareleftbackslash"
             case 12:
             model.point12Game1ImageTm2 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point12Game1ImageTm2 = "squareleftbackslash"
             case 13:
             model.point13Game1ImageTm2 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point13Game1ImageTm2 = "squareleftbackslash"
             case 14:
             model.point14Game1ImageTm2 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point14Game1ImageTm2 = "squareleftbackslash"
             case 15:
             model.point15Game1ImageTm2 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point15Game1ImageTm2 = "squareleftbackslash"
             case 16:
             model.point16Game1ImageTm2 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point16Game1ImageTm2 = "squareleftbackslash"
             case 17:
             model.point17Game1ImageTm2 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point17Game1ImageTm2 = "squareleftbackslash"
             case 18:
             model.point18Game1ImageTm2 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point18Game1ImageTm2 = "squareleftbackslash"
             case 19:
             model.point19Game1ImageTm2 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point19Game1ImageTm2 = "squareleftbackslash"
             case 20:
             model.point20Game1ImageTm2 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point20Game1ImageTm2 = "squareleftbackslash"
             case 21:
             model.point21Game1ImageTm2 = "squarebackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point21Game1ImageTm2 = "squarebackslash"
             default:
             model.point1Game1ImageTm2 = "square"
             print("Error setting image in switch statement")
             }
             */
        } else {
            /*
             // First server scored the point
             model.match.games![model.gameNumber - 1].player1Team2Points += 1
             print("model.player1Team2Points: \(model.player1Team2Points)")
             model.gameScoreTeam2 += 1
             print("model.gameScoreTeam2: \(model.gameScoreTeam2)")
             switch model.gameScoreTeam2 {
             case 1:
             model.point1Game1ImageTm2 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point1Game1ImageTm2 = "squareleftfwdslash"
             case 2:
             model.point2Game1ImageTm2 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point2Game1ImageTm2 = "squareleftfwdslash"
             case 3:
             model.point3Game1ImageTm2 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point3Game1ImageTm2 = "squareleftfwdslash"
             case 4:
             model.point4Game1ImageTm2 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point4Game1ImageTm2 = "squareleftfwdslash"
             case 5:
             model.point5Game1ImageTm2 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point5Game1ImageTm2 = "squareleftfwdslash"
             case 6:
             model.point6Game1ImageTm2 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point6Game1ImageTm2 = "squareleftfwdslash"
             case 7:
             model.point7Game1ImageTm2 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point7Game1ImageTm2 = "squareleftfwdslash"
             case 8:
             model.point8Game1ImageTm2 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point8Game1ImageTm2 = "squareleftfwdslash"
             case 9:
             model.point9Game1ImageTm2 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point9Game1ImageTm2 = "squareleftfwdslash"
             case 10:
             model.point10Game1ImageTm2 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point10Game1ImageTm2 = "squareleftfwdslash"
             case 11:
             model.point11Game1ImageTm2 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point11Game1ImageTm2 = "squareleftfwdslash"
             case 12:
             model.point12Game1ImageTm2 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point12Game1ImageTm2 = "squareleftfwdslash"
             case 13:
             model.point13Game1ImageTm2 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point13Game1ImageTm2 = "squareleftfwdslash"
             case 14:
             model.point14Game1ImageTm2 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point14Game1ImageTm2 = "squareleftfwdslash"
             case 15:
             model.point15Game1ImageTm2 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point15Game1ImageTm2 = "squareleftfwdslash"
             case 16:
             model.point16Game1ImageTm2 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point16Game1ImageTm2 = "squareleftfwdslash"
             case 17:
             model.point17Game1ImageTm2 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point17Game1ImageTm2 = "squareleftfwdslash"
             case 18:
             model.point18Game1ImageTm2 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point18Game1ImageTm2 = "squareleftfwdslash"
             case 19:
             model.point19Game1ImageTm2 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point19Game1ImageTm2 = "squareleftfwdslash"
             case 20:
             model.point20Game1ImageTm2 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point20Game1ImageTm2 = "squareleftfwdslash"
             case 21:
             model.point21Game1ImageTm2 = "squarefwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point21Game1ImageTm2 = "squarefwdslash"
             default:
             model.point1Game1ImageTm2 = "square"
             print("Error setting image in switch statement")
             }
             }
             */
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
