//
//  MatchView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import RealmSwift
import SwiftUI

struct MatchView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.realm) var realm
    @ObservedRealmObject var match: Match
    
    @State private var alertItem: AlertItem?
    @State private var elapsedGameTimeGame1 = 0.0
    @State private var elapsedGameTimeGame2 = 0.0
    @State private var elapsedGameTimeGame3 = 0.0
    @State private var elapsedGameTimeGame4 = 0.0
    @State private var elapsedGameTimeGame5 = 0.0
    @State private var gameTimer1: Timer.TimerPublisher = Timer.publish(every: 5, tolerance: 0.5, on: .main, in: .common)
    @State private var gameTimer2: Timer.TimerPublisher = Timer.publish(every: 5, tolerance: 0.5, on: .main, in: .common)
    @State private var gameTimer3: Timer.TimerPublisher = Timer.publish(every: 5, tolerance: 0.5, on: .main, in: .common)
    @State private var gameTimer4: Timer.TimerPublisher = Timer.publish(every: 30, tolerance: 0.5, on: .main, in: .common)
    @State private var gameTimer5: Timer.TimerPublisher = Timer.publish(every: 30, tolerance: 0.5, on: .main, in: .common)
    @State private var isGameTimerRunning = false
    @State private var isStartNewMatch = false
    @State private var presentFirstServerAlert = false
    @State private var presentGameWinnerAlert = false
    @State private var presentMatchOverAlert = false
    @State private var presentMatchSetupAlert = false
    @State private var presentMatchSetupButtonAlert = false
    @State private var presentStartedNewGameAlert = false
    @State private var presentStartingServerSetupAlert = false
    @State private var presentServerSideSetAlert = false
    @State private var screenshotMaker: ScreenshotMaker?
    @State private var showingMatchOver = false
    @State private var showingGameStartingServer = false
    @State private var team1MatchStartingServerName = ""
    @State private var team2MatchStartingServerName = ""
    
    
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
                                Text("Date:")
                                Text("Location:")
                                Text("Game Format:")
                                Text("Game Number: ")
                                Text("Notes: ")
                                Text("Match 1st Server: ")
                            }
                            .foregroundColor(Constants.DARK_SLATE)
                            
                            VStack (alignment: .leading) {
                                Text(match.eventTitle)
                                Text(match.matchDate, format: .dateTime.month().day().year())
                                Text(match.matchLocation)
                                Text(match.gameFormatDescription)
                                Text("\(match.currentGameNumber)")
                                Text(match.matchNotes)
                                Text(match.matchStartingServerName)
                            }
                            .foregroundColor(Constants.DARK_SLATE)
                        }
                    }
                    Spacer()
                    VStack (alignment: .leading) {
                        
                        HStack (alignment: .top) {
                            VStack (alignment: .leading) {
                                Text("Match: ")
                                Text("Court: ")
                                Text("Referee: ")
                                Text("Match Format: ")
                                Text("Match Style: ")
                                Text("Scoring Format: ")
                                Text("Game 1st Server: ")
                            }
                            .foregroundColor(Constants.DARK_SLATE)
                            
                            VStack (alignment: .leading) {
                                Text(match.matchNumber)
                                Text(match.courtNumber)
                                Text(match.games[match.currentGameNumber - 1].refereeName)
                                Text(match.matchFormatDescription)
                                Text(match.matchStyleDescription)
                                Text(match.matchScoringFormatDescription)
                                Text(match.games[match.currentGameNumber - 1].gameFirstServerName)
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
                            // The game is over, and the game has been closed in closeGame() called by updateScore function where there is a game winner.
                            // Now stop the game timer for the game that ended and set the elapsed time of the game in gameElapsedTime.
                            if match.games[match.currentGameNumber - 1].isGameWinner {
                                print("isGameWinner is true in Point Button action in MatchView. Will present game winner alert")
                                switch match.currentGameNumber {
                                case 1:
                                    gameTimer1.connect().cancel()
                                    print("\n     elapsedGameTimeGame1 before entered in gameElapsedTime: \(elapsedGameTimeGame1)")
                                    $match.games[match.currentGameNumber - 1].gameElapsedTime.wrappedValue = elapsedGameTimeGame1
                                    //$elapsedGameTimeGame1.wrappedValue = 0.0
                                    print("     Stopped gameTimer1 in Point Button if gameWinner in MatchView")
                                    print("     currentGameNumber value: \(match.currentGameNumber)")
                                    print("     gameElapsedTime in Point Button if gameWinner in MatchView: \(match.games[match.currentGameNumber - 1].gameElapsedTime)\n")
                                case 2:
                                    gameTimer2.connect().cancel()
                                    print("\n     elapsedGameTimeGame2 before entered in gameElapsedTime: \(elapsedGameTimeGame2)")
                                    print("     elapsedGameTimeGame1 before entered in gameElapsedTime: \(elapsedGameTimeGame1)")
                                    print("     elapsedGameTimeGame3 before entered in gameElapsedTime: \(elapsedGameTimeGame3)")
                                    $match.games[match.currentGameNumber - 1].gameElapsedTime.wrappedValue = elapsedGameTimeGame2
                                    //$elapsedGameTimeGame2.wrappedValue = 0.0
                                    print("     Stopped gameTimer2 in Point Button if gameWinner in MatchView")
                                    print("     currentGameNumber value: \(match.currentGameNumber)")
                                    print("     gameElapsedTime in Point Button if gameWinner in MatchView: \(match.games[match.currentGameNumber - 1].gameElapsedTime)\n")
                                case 3:
                                    gameTimer3.connect().cancel()
                                    print("\n     elapsedGameTimeGame3 before entered in gameElapsedTime: \(elapsedGameTimeGame3)")
                                    print("     elapsedGameTimeGame1 before entered in gameElapsedTime: \(elapsedGameTimeGame1)")
                                    print("     elapsedGameTimeGame2 before entered in gameElapsedTime: \(elapsedGameTimeGame2)")
                                    $match.games[match.currentGameNumber - 1].gameElapsedTime.wrappedValue = elapsedGameTimeGame3
                                    //$elapsedGameTimeGame3.wrappedValue = 0.0
                                    print("     Stopped gameTimer3 in Point Button if gameWinner in MatchView")
                                    print("     currentGameNumber value: \(match.currentGameNumber)")
                                    print("     gameElapsedTime in Point Button if gameWinner in MatchView: \(match.games[match.currentGameNumber - 1].gameElapsedTime)\n")
                                case 4:
                                    gameTimer4.connect().cancel()
                                    $match.games[match.currentGameNumber - 1].gameElapsedTime.wrappedValue = elapsedGameTimeGame4
                                    //$elapsedGameTimeGame4.wrappedValue = 0.0
                                case 5:
                                    gameTimer5.connect().cancel()
                                    $match.games[match.currentGameNumber - 1].gameElapsedTime.wrappedValue = elapsedGameTimeGame5
                                    //$elapsedGameTimeGame5.wrappedValue = 0.0
                                default:
                                    print("Error stopping game timer ")
                                }
                                // Present the gameWinnerAlert to notify the user that the game is over and to be able to set up the new game.
                                presentGameWinnerAlert.toggle()
                            }
                        } label: {
                            Text("Point")
                        }
                        .buttonStyle(PointsSideoutButtonStyle())
                        .disabled(!match.isMatchStarted || match.isMatchCompleted)
                        .sheet(isPresented: $showingMatchOver) { MatchOverView(match: match) }
                        .alert("Game Over", isPresented: $presentGameWinnerAlert) {
                            Button("OK", role: .cancel) {
                                // At this point the game is over and has been closed by the closeMatch() fucntion called from
                                // updateScore when ifGameWinner is true.
                                // If the match is not over, set up the new game by calling the setUpNewGame() function.
                                // Present the startedNewGameAlert to notify the user that the new game is ready for play.
                                if !isMatchWinner() {
                                    setUpNewGame()
                                    presentStartedNewGameAlert.toggle()
                                } else {
                                    // There is a match winner so the match is over.
                                    print("")
                                    print("The match is over per isMatchWinner() in Game Over alert action in MatchView")
                                    print("")
                                    presentMatchOverAlert.toggle()
                                    closeMatch()
                                    $isStartNewMatch.wrappedValue = true
                                }
                            }
                        } message: {
                            Text("Game Winner is\n \(match.games[match.currentGameNumber - 1].gameWinner)")
                        }
                        .alert("New Game Started", isPresented: $presentStartedNewGameAlert) {
                            Button("OK", role: .cancel) {
                               // Start gameTimer for new game
                               
                                switch match.currentGameNumber {
                                case 1:
                                    _ = gameTimer1.connect()
                                    print("Started gameTimer1 in New Game Started Alert in MatchView")
                                case 2:
                                    _ = gameTimer2.connect()
                                    print("Started gameTimer2 in New Game Started Alert in MatchView")
                                case 3:
                                    _ = gameTimer3.connect()
                                    print("Started gameTimer3 in New Game Started Alert in MatchView")
                                case 4:
                                    _ = gameTimer4.connect()
                                case 5:
                                    _ = gameTimer5.connect()
                                default:
                                    print("Error stopping game timer ")
                                }
                            }
                        } message: {
                            Text("Game # \(match.games[match.currentGameNumber - 1].gameNumber) is ready for play.")
                        }
                        .alert("Match Over", isPresented: $presentMatchOverAlert) {
                            Button("OK", role: .cancel) {
                                // Need to activate isStartNewMatch
                                NavigationLink(destination: HomeView(match: match), isActive: $isStartNewMatch) { }
                            }
                        } message: {
                            Text("Match Winner is\n \(match.matchWinner)")
                        }
                        
                        // Shows Game 1 of 3 games etc below Point button
                        Text(currentMatchStatusDisplay)
                            .font(.headline)
                            .foregroundColor(Constants.DARK_SLATE.opacity(0.6))

                    }
                    
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
                                // MARK: - Select Starting Server for the match
                                .alert("Select the starting server", isPresented: $presentStartingServerSetupAlert) {
                                    Button(team1MatchStartingServerName) {
                                        if match.games[0].selectedFirstServerTeam1 == 1 {
                                            $match.servingPlayerNumber.wrappedValue = 1
                                            $match.matchStartingServerName.wrappedValue = match.namePlayer1Team1
                                            $match.games[0].gameFirstServerName.wrappedValue = match.namePlayer1Team1
                                            $match.games[0].gameFirstServerPlayerNumber.wrappedValue = 1
                                            $match.isMatchStartingServerSet.wrappedValue = true
                                        } else {
                                            $match.servingPlayerNumber.wrappedValue = 2
                                            $match.matchStartingServerName.wrappedValue = match.namePlayer2Team1
                                            $match.games[0].gameFirstServerName.wrappedValue = match.namePlayer2Team1
                                            $match.games[0].gameFirstServerPlayerNumber.wrappedValue = 2
                                            $match.isMatchStartingServerSet.wrappedValue = true
                                        }
                                    }
                                    Button(team2MatchStartingServerName) {
                                        if match.games[0].selectedFirstServerTeam2 == 3 {
                                            $match.servingPlayerNumber.wrappedValue = 3
                                            $match.matchStartingServerName.wrappedValue = match.namePlayer1Team2
                                            $match.games[0].gameFirstServerName.wrappedValue = match.namePlayer1Team2
                                            $match.games[0].gameFirstServerPlayerNumber.wrappedValue = 3
                                            $match.isMatchStartingServerSet.wrappedValue = true
                                        } else {
                                            $match.servingPlayerNumber.wrappedValue = 4
                                            $match.matchStartingServerName.wrappedValue = match.namePlayer2Team2
                                            $match.games[0].gameFirstServerName.wrappedValue = match.namePlayer2Team2
                                            $match.games[0].gameFirstServerPlayerNumber.wrappedValue = 4
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
                                VStack {
                                    HStack {
                                        Text("Score: ")
                                            .font(.title)
                                            .foregroundColor(Constants.DARK_SLATE)
                                        
                                        Text(match.scoreDisplay)
                                            .font(.largeTitle)
                                            .foregroundColor(Constants.CRIMSON)
                                    }
                                    
                                    HStack {
                                        if match.games[0].isGameCompleted {
                                            Text("Game 1: \(match.games[0].gameFinalScore)")
                                        }
                                        if match.games[1].isGameCompleted {
                                            Text("Game 2: \(match.games[1].gameFinalScore)")
                                        }
                                        // this likely will not show in 2 of 3 games match since match ended
                                        if match.games[2].isGameCompleted {
                                            Text("Game 3: \(match.games[2].gameFinalScore)")
                                        }
                                        if match.games[3].isGameCompleted {
                                            Text("Game 4: \(match.games[3].gameFinalScore)")
                                        }
                                        // This will never show since game is over and match ended
                                        if match.games[4].isGameCompleted {
                                            Text("Game 5: \(match.games[4].gameFinalScore)")
                                        }
                                    }
                                    .font(.caption)
                                    .foregroundColor(Constants.MINT_LEAF)
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
                        .disabled(!match.isMatchStarted || match.isMatchCompleted)
                        
                        // Shows 2d Server is serving etc below 2nd Server / Sideout button
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

            
        }  // Top VStack
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .screenshotView { screenshotMaker in self.screenshotMaker = screenshotMaker }
        .onAppear {
            // TODO: - Fix this so game timer for first game starts at the same time as the match starts in BottomButtonsView
            // Start game timer if this is the first game of the match
            if match.startGame1Timer {
                print("Starting gameTimer1 on onAppear of MatchView")
                _ = gameTimer1.connect()
                $match.startGame1Timer.wrappedValue = false
            }
        }
        .onReceive(gameTimer1) { time in
            print("Game Time of gameTimer1 (should update every 5 seconds): \(time), elapsedGameTime for gameRTimer: \(elapsedGameTimeGame1)")
            $elapsedGameTimeGame1.wrappedValue += 5.0
            print("elapsedGameTime gameTimer1 in onReceive of MatchView: \(Int(elapsedGameTimeGame1 / 60)) minutes , \(elapsedGameTimeGame1.truncatingRemainder(dividingBy: 60)) seconds")
        }
        .onReceive(gameTimer2) { time in
            print("Game Time of gameTimer2 (should update every 5 seconds): \(time), elapsedGameTime for gameTimer2: \(elapsedGameTimeGame2)")
            $elapsedGameTimeGame2.wrappedValue += 5.0
            print("elapsedGameTime gameTimer2 in onReceive of MatchView: \(Int(elapsedGameTimeGame2 / 60)) minutes , \(elapsedGameTimeGame2.truncatingRemainder(dividingBy: 60)) seconds")
        }
        .onReceive(gameTimer3) { time in
            print("Game Time of gameTimer3 (should update every 5 seconds): \(time), elapsedGameTime for gameTimer3: \(elapsedGameTimeGame3)")
            $elapsedGameTimeGame3.wrappedValue += 5.0
            print("elapsedGameTime gameTimer3 in onReceive of MatchView: \(Int(elapsedGameTimeGame3 / 60)) minutes , \(elapsedGameTimeGame3.truncatingRemainder(dividingBy: 60)) seconds")
        }
        .onReceive(gameTimer4) { time in
            print("Game Time of gameTimer4 (should update every 5 seconds): \(time), elapsedGameTime for gameTimer4: \(elapsedGameTimeGame4)")
            $elapsedGameTimeGame4.wrappedValue += 30.0
            print("elapsedGameTime gameTimer4 in onReceive of MatchView: \(Int(elapsedGameTimeGame4 / 60)) minutes , \(elapsedGameTimeGame4.truncatingRemainder(dividingBy: 60)) seconds")
        }
        .onReceive(gameTimer5) { time in
            print("Game Time of gameTimer5 (should update every 5 seconds): \(time), elapsedGameTime for gameTimer5: \(elapsedGameTimeGame5)")
            $elapsedGameTimeGame5.wrappedValue += 30.0
            print("elapsedGameTime gameTimer5 in onReceive of MatchView: \(Int(elapsedGameTimeGame5 / 60)) minutes , \(elapsedGameTimeGame5.truncatingRemainder(dividingBy: 60)) seconds")
        }
    }
    
}


//struct MatchView_Previews: PreviewProvider {
//    static var previews: some View {
//        MatchView(match: Match())
//    }
//}




