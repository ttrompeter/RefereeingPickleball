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
    
    @State private var screenshotMaker: ScreenshotMaker?
    @State private var alertItem: AlertItem?
    @State private var presentMatchSetupAlert = false
    @State private var presentMatchSetupButtonAlert = false
    @State private var presentStartingServerSetupAlert = false
    @State private var presentServerSideSetAlert = false
    @State private var presentFirstServerAlert = false
    @State private var presentGameWinnerAlert = false
    @State private var showingGameStartingServer = false
    @State private var isGameTimerRunning = false
    @State private var elapsedGameTime = 0.0
    @State private var team1MatchStartingServerName = ""
    @State private var team2MatchStartingServerName = ""
    
    let gameTimer = Timer.publish(every: 30, tolerance: 0.5, on: .main, in: .common)
    // let gameTimer = Timer.publish(every: 60, tolerance: 0.5, on: .main, in: .common).autoconnect()
    // timer.upstream.connect().cancel() // stop timer
    
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
                Text("Pickleball Match Scorsheet")
                    //.fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(Constants.DARK_SLATE)
                    .font(.largeTitle)
            }
            .padding(.top, 40)
            
            // Heading and Setup Section
            Section  {
                HStack (alignment: .top, spacing: 40) {
                    Spacer()
                    VStack (alignment: .leading) {
                        
                        HStack {
                            VStack (alignment: .leading) {
                                Text("Event:")
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text("Date:")
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text("Location:")
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text("Game Format:")
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text("Game Number: ")
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text("Notes: ")
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text("Match 1st Server: ")
                                    //.foregroundColor(Constants.DARK_SLATE)
                            }
                            .foregroundColor(Constants.DARK_SLATE)
                            
                            VStack (alignment: .leading) {
                                Text(match.eventTitle)
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text(match.matchDate, format: .dateTime.month().day().year())
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text(match.matchLocation)
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text(match.gameFormatDescription)
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text("\(match.currentGameNumber)")
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text(match.matchNotes)
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text(match.matchStartingServerName)
                                    //.foregroundColor(Constants.DARK_SLATE)
                            }
                            .foregroundColor(Constants.DARK_SLATE)
                        }
                    }
                    Spacer()
                    VStack (alignment: .leading) {
                        
                        HStack (alignment: .top) {
                            VStack (alignment: .leading) {
                                Text("Match: ")
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text("Court: ")
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text("Referee: ")
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text("Match Format: ")
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text("Match Style: ")
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text("Scoring Format: ")
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text("Game 1st Server: ")
                            }
                            .foregroundColor(Constants.DARK_SLATE)
                            
                            VStack (alignment: .leading) {
                                Text(match.matchNumber)
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text(match.courtNumber)
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text(match.games[match.currentGameNumber - 1].refereeName)
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text(match.matchFormatDescription)
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text(match.matchStyleDescription)
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text(match.matchScoringFormatDescription)
                                    //.foregroundColor(Constants.DARK_SLATE)
                                Text(match.games[match.currentGameNumber - 1].gameStartingServerName)
                            }
                            .foregroundColor(Constants.DARK_SLATE)
                        }
                    }
                    Spacer()
                }
            }
            .padding(.top, 5)
            
            // Team & Scoring Information Section Top of screen
            Section {
                if match.isTeam1Serving {
                    TeamListingTeam1(match: match)
                    ScoringSectionTeam1View(match: match)
                } else {
                    TeamListingTeam2(match: match)
                    ScoringSectionTeam2View(match: match)
                }
            }
            
            // MARK: - Scoring Section
            
            // Scoring Section
            Section {
                HStack (alignment: .top, spacing: 60) {
                    // Point Button
                    VStack {
                        Button {
                            pointScored()
                            updateScore()
                        } label: {
                            Text("Point")
                        }
                        .buttonStyle(PointsSideoutButtonStyle())
                        .disabled(!match.isMatchStarted)
                        
                        // TODO: - Fix this for handling game over - done in isGameWinner
                        .alert("Game Over", isPresented: $presentGameWinnerAlert) {
                            Button("OK", role: .cancel) {
                                //$match.games[match.currentGameNumber - 1].isGameCompleted.wrappedValue = true
                                print("isGameCompleted after set in alert: \(match.games[match.currentGameNumber - 1].isGameCompleted)")
                                if !match.isMatchCompleted {
                                    //$match.currentGameNumber.wrappedValue += 1
                                    print("currentGameNumber after set in alert: \(match.currentGameNumber)")
                                }
                            }
                        } message: {
                            Text("Game Winner is\n \(match.games[match.currentGameNumber - 1].gameWinner)")
                        }
                        
                        
// ======================================================================================================================

//                        Alerts regardng game and match winners
                        
                        
                        //                        .alert("", isPresented: $presentGameWinnerAlert, actions: {
                        //                            self.alertItem = AlertItem(title: Text("Game Over"), message: Text("Winner is Team 1"), dismissButton: .default(Text("OK"), action: {
                        //
                        //                                if match.isMatchCompleted {
                        //                                    /// trigger second alert
                        //                                    DispatchQueue.main.async {
                        //                                        self.alertItem = AlertItem(title: Text("Match Over"), message: Text("Winner is Team 1"), dismissButton: .default(Text("OK"), action: self.closeMatch))
                        //                                    }
                        //                                }
                        //
                        //                            //}), secondaryButton: .cancel()  )
                        //                            }
                        //                        })
// ======================================================================================================================
                        
                        
                        
                        // Shows Game 1 of 3 games etc
                        Text(currentMatchStatusDisplay)
                            .font(.headline)
                            .foregroundColor(Constants.DARK_SLATE.opacity(0.6))
                        
                        
// ======================================================================================================================
                        // TODO: - This is temporary until get working - allowing two alerts for game over and match over
                        Button(action: {
                            
                            //self.alertItem = AlertItem(title: Text("Game Over"), message: Text("Winner is Team 1"), primaryButton: .default(Text("OK"), action: {
                            self.alertItem = AlertItem(title: Text("Game Over"), message: Text("Winner is Team 1"), dismissButton: .default(Text("OK"), action: {
                                
                                if match.isMatchCompleted {
                                    /// trigger second alert
                                    DispatchQueue.main.async {
                                        self.alertItem = AlertItem(title: Text("Match Over"), message: Text("Winner is Team 1"), dismissButton: .default(Text("OK"), action: self.closeMatch))
                                    }
                                }
                                
                                //}), secondaryButton: .cancel()  )
                            }))
                        }, label: {
                            Text("SHOW ALERT")
                                .font(.body)
                                .foregroundColor(Constants.MINT_LEAF)
                        }).alert(item: $alertItem) { alertItem in
                            
                            //guard let primaryButton = alertItem.primaryButton, let secondaryButton = alertItem.secondaryButton else {
                            //                                    guard let dismissButton = alertItem.dismissButton else {
                            //                                        return Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
                            //                                    }
                            print("Got here")
                            //return Alert(title: alertItem.title, message: alertItem.message, primaryButton: primaryButton, secondaryButton: secondaryButton)
                            return Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
                        }
                    }
// ======================================================================================================================
                    
                    // Match Setup Warning
                    if !match.isMatchSetup {
                        
                        ZStack {
                            Rectangle()
                                .frame(width: CGFloat(150), height: CGFloat(70))
                                .foregroundColor(Constants.BRIGHT_YARROW)
                                .cornerRadius(10)
                                .shadow(radius: 5)

                            Button {
                                presentMatchSetupAlert.toggle()
                            } label: {
                                Text("Must Complete\nMatch Setup")
                                    .font(.subheadline)
                                    .foregroundColor(Constants.POMAGRANATE)
                            }
                            .alert("Complete Match Setup", isPresented: $presentMatchSetupAlert) {
                                Button("OK", role: .cancel) {  }
                            } message: {
                                Text("Tap Match Setup Button and Enter Match Information.")
                            }
                        }
                    } else if match.isMatchSetup {
                        if !match.isMatchStartingServerSet {
                            ZStack {
                                Rectangle()
                                    .frame(width: CGFloat(150), height: CGFloat(70))
                                    .foregroundColor(Constants.BRIGHT_YARROW)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)

                                Button {
                                    if match.games[0].selectedFirstServerTeam1 == 1 {
                                        team1MatchStartingServerName = match.namePlayer1Team1
                                    } else if match.games[0].selectedFirstServerTeam1 == 2 {
                                        team1MatchStartingServerName = match.namePlayer2Team1
                                    }
                                    if match.games[0].selectedFirstServerTeam2 == 3 {
                                        team2MatchStartingServerName = match.namePlayer1Team2
                                    } else if match.games[0].selectedFirstServerTeam2 == 4 {
                                        team2MatchStartingServerName = match.namePlayer2Team2
                                    }
                                    presentStartingServerSetupAlert = true
                                } label: {
                                    Text("Must Set\nStarting Server")
                                        .font(.subheadline)
                                        .foregroundColor(Constants.POMAGRANATE)
                                }
                                // MARK: - Select Starting Server
                                .alert("Select the starting server", isPresented: $presentStartingServerSetupAlert) {
                                    Button(team1MatchStartingServerName) {
                                        if match.games[0].selectedFirstServerTeam1 == 1 {
                                            $match.servingPlayerNumber.wrappedValue = 1
                                            $match.matchStartingServerName.wrappedValue = match.namePlayer1Team1
                                            $match.games[0].gameStartingServerPlayerNumber.wrappedValue = 1
                                            $match.isMatchStartingServerSet.wrappedValue = true
                                        } else {
                                            $match.servingPlayerNumber.wrappedValue = 2
                                            $match.matchStartingServerName.wrappedValue = match.namePlayer2Team1
                                            $match.games[0].gameStartingServerPlayerNumber.wrappedValue = 2
                                            $match.isMatchStartingServerSet.wrappedValue = true
                                        }
                                    }
                                    Button(team2MatchStartingServerName) {
                                        if match.games[0].selectedFirstServerTeam2 == 3 {
                                            $match.servingPlayerNumber.wrappedValue = 3
                                            $match.matchStartingServerName.wrappedValue = match.namePlayer1Team2
                                            $match.games[0].gameStartingServerPlayerNumber.wrappedValue = 3
                                            $match.isMatchStartingServerSet.wrappedValue = true
                                        } else {
                                            $match.servingPlayerNumber.wrappedValue = 4
                                            $match.matchStartingServerName.wrappedValue = match.namePlayer2Team2
                                            $match.games[0].gameStartingServerPlayerNumber.wrappedValue = 4
                                            $match.isMatchStartingServerSet.wrappedValue = true
                                        }
                                    }
                                }
                            }
                        } else if !match.games[match.currentGameNumber - 1].isServerSideSet {
                            
                            ZStack {
                                Rectangle()
                                    .frame(width: CGFloat(150), height: CGFloat(70))
                                    .foregroundColor(Constants.BRIGHT_YARROW)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)

                                Button {
                                    presentStartingServerSetupAlert.toggle()
                                } label: {
                                    Text("Check Orientation\nof Scoresheet")
                                        .font(.subheadline)
                                        .foregroundColor(Constants.POMAGRANATE)
                                }
                                .alert("Reorient Scoresheet", isPresented: $presentStartingServerSetupAlert) {
                                    Button("Orientation is Correct", role: .cancel) {
                                        $match.games[match.currentGameNumber - 1].isServerSideSet.wrappedValue = true
                                        
                                    }
                                    Button("Change Serving Team") {
                                        $match.isTeam1Serving.wrappedValue.toggle()
                                    }
                                    Button("Change Arrow's Side") {
                                        $match.isServingLeftSide.wrappedValue.toggle()
                                    }
                                    Button("Change Both") {
                                        $match.isTeam1Serving.wrappedValue.toggle()
                                        $match.isServingLeftSide.wrappedValue.toggle()
                                    }
                                } message: {
                                    Text("Chsnge orientation of scoresheet if neeeded both for serving team and arrow direction.")
                                }
                            }
                            
                        } else {
                            // MARK: - Score Display
                            VStack (spacing: 5) {
                                HStack {
                                    Text("Score: ")
                                        .font(.title)
                                        .foregroundColor(Constants.DARK_SLATE)
                                    
                                    Text(match.scoreDisplay)
                                        .font(.largeTitle)
                                        .foregroundColor(Constants.CRIMSON)
                                }
                                .padding(10)
                                .background(Constants.CLOUDS)
                                
                                Button {
                                    if let screenshotMaker = screenshotMaker {
                                        screenshotMaker.screenshot()?.saveToDocuments()
                                    }
                                } label: {
                                    Text("Take Screenshot")
                                        .font(.headline)
                                        .foregroundColor(Constants.MINT_LEAF)
                                }
                                .disabled(!match.isMatchStarted)
                            }
                        }
                    }
                    
                    VStack {
                        
                        // 2nd Server / Side Out Button
                        Button {
                            
                            if match.isSecondServer {
                                sideOut()
                                
                            } else {
                                // 2nd Server Button label is showing and 1st server is serving
                                // Button is pushed when 2nd Server label is showing
                                // Set server to the next server
                                setWhoIsServing()
                                $match.isSecondServer.wrappedValue.toggle()
                                $match.whoIsServingText.wrappedValue = "2nd Server"
                                updateScore()
                            }
                            
                        } label: {
                            if match.isSecondServer {
                                // Change button label to Side Out
                                // It is Second Server
                                Text("Side Out")
                                
                            } else {
                                // It is First Server
                                Text("2nd Server")
                            }
                        }
                        .buttonStyle(PointsSideoutButtonStyle())
                        .disabled(!match.isMatchStarted)
                        
                        // Shows 2d Server is serving etc
                        Text("\(match.whoIsServingText) is Serving")
                            .font(.headline)
                            .foregroundColor(Constants.DARK_SLATE.opacity(0.6))
                    }
                }
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
                }
            }
            
            // Team & Scoring Information Section Bottom of screen
            Section {
                if match.isTeam1Serving {
                    ScoringSectionTeam2View(match: match)
                    TeamListingTeam2(match: match)
                        //.rotationEffect(.degrees(180))
                } else {
                    ScoringSectionTeam1View(match: match)
                    TeamListingTeam1(match: match)
                        //.rotationEffect(.degrees(180))
                }
            }
            .rotationEffect(.degrees(180))
            
            // Empty text field for spacing
            Text(" ")
                .padding()
                // This is monitoring the timer
                .onReceive(gameTimer) { time in
                        // print("The time is now \(time)")
                    }
            
        }  // Top VStack
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .screenshotView { screenshotMaker in self.screenshotMaker = screenshotMaker }
        .onReceive(gameTimer) { time in
            print("time in onReceive: \(time), elapsedGameTime: \(elapsedGameTime)")
            $elapsedGameTime.wrappedValue += 30.0
        }
        
    }
    
}

//struct MatchView_Previews: PreviewProvider {
//    static var previews: some View {
//        MatchView(match: Match())
//    }
//}



// ============================================================================================

// MARK: - MatchView Extension - Functions

extension MatchView {
    
    
    
    
    func updateScore() {
        
        let tm1Score = (match.games[match.currentGameNumber - 1].player1Team1Points) + (match.games[match.currentGameNumber - 1].player2Team1Points)
        let tm2Score = (match.games[match.currentGameNumber - 1].player1Team2Points) + (match.games[match.currentGameNumber - 1].player2Team2Points)
        let server = match.isSecondServer == true ? "2" : "1"
        
        
        if match.isTeam1Serving {
            $match.scoreDisplay.wrappedValue = "\(tm1Score) - \(tm2Score) - \(server)"
        } else {
            $match.scoreDisplay.wrappedValue = "\(tm2Score) - \(tm1Score) - \(server)"
        }
        
        
        if isGameWinner() {
            print("There is a game winner")
            // Set final values in current game
            $match.games[match.currentGameNumber - 1].isGameWinner.wrappedValue = true
            $match.games[match.currentGameNumber - 1].isGameCompleted.wrappedValue = true
            gameTimer.connect().cancel()
            print("elapsedGameTime in isGameWinner(): \(elapsedGameTime)")
            $match.games[match.currentGameNumber - 1].gameElapsedTime.wrappedValue = elapsedGameTime
            
            // Set gameStartingServerPlayerNumber for next game
            print("gameStartingServerPlayerNumber of current game: \(match.games[match.currentGameNumber - 1].gameStartingServerPlayerNumber)")
            print("")
            switch match.games[match.currentGameNumber - 1].gameStartingServerPlayerNumber {
            case 1, 2:
                print("In case 1, 2 of isGameWinner()")
                $match.games[match.currentGameNumber].gameStartingServerPlayerNumber.wrappedValue = match.games[match.currentGameNumber - 1].selectedFirstServerTeam2
            case 3, 4:
                print("In case 3, 4 of isGameWinner()")
                $match.games[match.currentGameNumber].gameStartingServerPlayerNumber.wrappedValue = match.games[match.currentGameNumber - 1].selectedFirstServerTeam1
            default:
                print("Error setting first server for next game in isGameWinner().")
            }
            
            // Set gameStartingServerName for next game
            print("match.games[match.currentGameNumber].gameStartingServerPlayerNumber of next game: \(match.games[match.currentGameNumber].gameStartingServerPlayerNumber)")
            switch match.games[match.currentGameNumber].gameStartingServerPlayerNumber {
            case 1 :
                $match.games[match.currentGameNumber].gameStartingServerName.wrappedValue = match.namePlayer1Team1
            case 2 :
                $match.games[match.currentGameNumber].gameStartingServerName.wrappedValue = match.namePlayer2Team1
            case 3 :
                $match.games[match.currentGameNumber].gameStartingServerName.wrappedValue = match.namePlayer1Team2
            case 4 :
                $match.games[match.currentGameNumber].gameStartingServerName.wrappedValue = match.namePlayer2Team2
            default:
                print("Error setting first server name for next game in isGameWinner().")
            }
            
            // Set values for new game
            $match.currentGameNumber.wrappedValue = match.currentGameNumber + 1
            
            // Teams switch sides so switch layout
            print("Before toggle isServingLeftSide")
            $match.isServingLeftSide.wrappedValue.toggle()
            
            // Start timer for new game
            _ = gameTimer.connect()
            
            
            //        /*
            //         -- Set isGameWinner for current game [= false]
            //         -- Set isGameCompleted for current game  [= false]
            //         -- Set gameElapsedTime for current game (stop Timer)  [= 0.0]
            //
            //         -- Set first server for next game
            //         -- Set court orientation for next game - players change sides
            //         -- Change current game number of match to next game number
            //         -- Set gameStartingServerName for next game  [ = "Adam Rockafeller" ]
            //         -- Set gameStartingServerPlayerNumber for next game [ = 0 ]
            //
            //         // Already done IN isGameWinner()
            //         Set gameWinner = ""  IN isGameWinner()
            //         Set gameWinnerTeam  [= 0]   IN isGameWinner()
            //         Set gameFinalScore = "" IN isGameWinner()
            //
            //         // This can be done in MatchSetupView
            //         Set selectedFirstServerTeam1 for next game  [ = 0 ]
            //         Set selectedFirstServerTeam2 for next game  [ = 0 ]
            //         team first server can change if players choose
            //         Update referee if needed
            //         Update asst referee if needed
            //         Update line judges if needed
            //         update trainee if needed
            //         */
            
        
            if isMatchWinner() {
                print("There is a match winner")
                
                
                closeMatch()
            }
            // TODO: - Activate the isGameWinner alert message
//            presentGameWinnerAlert = true
        }
        
        
    }
    
    
}


