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
    @EnvironmentObject var scoresheetManager: ScoresheetManager
    @ObservedRealmObject var match: Match
    
    @State private var alertItem: AlertItem?
//    @State private var elapsedGameTimeGame1 = 0.0
//    @State private var elapsedGameTimeGame2 = 0.0
//    @State private var elapsedGameTimeGame3 = 0.0
//    @State private var elapsedGameTimeGame4 = 0.0
//    @State private var elapsedGameTimeGame5 = 0.0
//    @State private var gameTimer1: Timer.TimerPublisher = Timer.publish(every: 30, tolerance: 0.5, on: .main, in: .common)
//    @State private var gameTimer2: Timer.TimerPublisher = Timer.publish(every: 30, tolerance: 0.5, on: .main, in: .common)
//    @State private var gameTimer3: Timer.TimerPublisher = Timer.publish(every: 30, tolerance: 0.5, on: .main, in: .common)
//    @State private var gameTimer4: Timer.TimerPublisher = Timer.publish(every: 30, tolerance: 0.5, on: .main, in: .common)
//    @State private var gameTimer5: Timer.TimerPublisher = Timer.publish(every: 30, tolerance: 0.5, on: .main, in: .common)
//    @State private var isGameTimerRunning = false
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
    
    @State private var timeStartDate = Date.now
    
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
//                                print("isGameWinner is true in Point Button action in MatchView. Will present game winner alert")
//                                $match.games[match.currentGameArrayIndex].isGameWinner.wrappedValue = true
//                                $match.games[match.currentGameArrayIndex].isGameCompleted.wrappedValue = true
//                                $match.games[match.currentGameArrayIndex].gameEndDateValue.wrappedValue = Date.now
//                                $match.games[match.currentGameArrayIndex].gameDuration.wrappedValue = match.games[match.currentGameArrayIndex].gameComputedDuration
//                                print("gameDuration after set at end of game: \($match.games[match.currentGameArrayIndex].gameDuration)")
                                closeGame()
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
                                    $match.isMatchCompleted.wrappedValue = true
                                    $match.matchEndDateValue.wrappedValue = Date.now
                                    $match.matchDuration.wrappedValue = match.matchComputedDuration
                                    closeMatch()
                                    // TODO: - This should not be happening?
                                    $isStartNewMatch.wrappedValue = true
                                    // Take screenshot of scoresheet without user input
                                    if let screenshotMaker = screenshotMaker {
                                        screenshotMaker.screenshot()?.saveToDocuments()
                                    }
                                    presentMatchOverAlert.toggle()
                                }
                            }
                        } message: {
                            Text("Game Winner is\n \(match.games[match.currentGameNumber - 1].gameWinner)")
                        }
                        .alert("New Game Started", isPresented: $presentStartedNewGameAlert) {
                            Button("OK", role: .cancel) {
                            }
                        } message: {
                            Text("Game # \(match.games[match.currentGameNumber - 1].gameNumber) is ready for play.")
                        }
                        .alert("Match Over", isPresented: $presentMatchOverAlert) {
                            Button("OK", role: .cancel) {
                                // Need to activate isStartNewMatch
                                //NavigationLink(destination: HomeView(match: match), isActive: $isStartNewMatch) { }
                            }
                        } message: {
                            Text("Match Winner is\n \(match.matchWinner)")
                        }
                        
                        // Shows Game 1 of 3 games etc below Point button
                        Text(currentMatchStatusDisplay)
                            .font(.headline)
                            .foregroundColor(Constants.DARK_SLATE.opacity(0.6))
                        
                        // TODO: - Delete - this is temporary for development testing
                        if match.isMatchCompleted {
                            Text("Match Duration: \(match.matchDuration)")
                                .font(.caption)
                                .foregroundColor(Constants.DARK_RED)
                        }
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
                                setServingPlayerNumber()
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
                        
                        // TODO: - Delete - this is temporary for development testing
                        if match.games[0].isGameCompleted {
                            Text("Game 1 Duration: \(match.games[0].gameDuration)")
                                .font(.caption)
                                .foregroundColor(Constants.DARK_RED)
                        }
                        if match.games[1].isGameCompleted {
                            Text("Game 2 Duration: \(match.games[1].gameDuration)")
                                .font(.caption)
                                .foregroundColor(Constants.DARK_RED)
                        }
                        if match.games[2].isGameCompleted {
                            Text("Game 3 Duration: \(match.games[2].gameDuration)")
                                .font(.caption)
                                .foregroundColor(Constants.DARK_RED)
                        }
                        
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
                } else {
                    ScoringSectionTeam1View(match: match)
                    TeamListingTeam1(match: match)
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
    }
    
}


//struct MatchView_Previews: PreviewProvider {
//    static var previews: some View {
//        MatchView(match: Match())
//    }
//}




