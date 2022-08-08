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
    @State private var presentFirstServerAlert = false
    @State private var presentGameWinnerAlert = false
    @State private var showingGameStartingServer = false
    

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
                                Text(match.matchStartingServerName)
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
                    ScoringSectionTeam1View(match: match)
                } else {
                    ScoringSectionTeam2View(match: match)
                }
            }
            
    // MARK: - Scoring Section
            
            // Scoring Section
            Section {
                HStack (alignment: .top, spacing: 80) {
                    // Point Button
                    VStack {
                        Button {
                            pointScored()
                            updateScore()
                        } label: {
                            Text("Point")
                                .foregroundColor(Constants.DARK_SLATE)
                        }
                        .buttonStyle(PointsSideoutButtonStyle())
                        .disabled(!match.isMatchSetup || !(match.servingPlayerNumber > 0))
                        .alert("Game Over", isPresented: $presentGameWinnerAlert) {
                            Button("OK", role: .cancel) {
                                $match.games[match.currentGameNumber - 1].isGameCompleted.wrappedValue = true
                                print("isGameCompleted after set in alert: \(match.games[match.currentGameNumber - 1].isGameCompleted)")
                                if !match.isMatchCompleted {
                                    $match.currentGameNumber.wrappedValue += 1
                                    print("currentGameNumber after set in alert: \(match.currentGameNumber)")
                                }

                            }
                        } message: {
                            Text("Game Winner is\n \(match.games[match.currentGameNumber - 1].gameWinner)")
                        }
                        
                        
                        
                        
                        
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
                        
                        
                        
                        
                        
                        Text(currentMatchStatusDisplay)
                            .font(.headline)
                            .foregroundColor(Constants.DARK_SLATE.opacity(0.6))
                        
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
                                        $match.matchStartingServerName.wrappedValue = setStartingServerName()
                                        $match.matchStartingServerNumber.wrappedValue = 1
                                        presentStartingServerSetupAlert.toggle()
                                    }
                                    Button(match.namePlayer1Team2) {
                                        $match.servingPlayerNumber.wrappedValue = 3
                                        $match.matchStartingServerName.wrappedValue = setStartingServerName()
                                        $match.matchStartingServerNumber.wrappedValue = 2
                                        $match.isTeam1Serving.wrappedValue = false
                                        presentStartingServerSetupAlert.toggle()
                                    }
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
                                //.disabled(match.isMatchCompleted)
                            }
                        }
                    }
                    
                    VStack {
                        
                        // 2nd Server / Side Out Button
                        Button {
                            
                            if match.isSecondServer {
                                // Side Out Button label is showing and second server is serving
                                // Button pushed when Side Out label showing
                                // Set server to the next server
                                setWhoIsServing()
                                // Set isSecondServer value to false
                                //$match.isSecondServer.wrappedValue = false
                                $match.isSecondServer.wrappedValue.toggle()
                                $match.whoIsServingText.wrappedValue = "1st Server"
                                
                                // Team Service game is over so change value for isTeam1Serving
                                $match.isTeam1Serving.wrappedValue.toggle()
                                updateScore()
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
                                    .foregroundColor(Constants.DARK_SLATE)
                                
                            } else {
                                // It is First Server
                                Text("2nd Server")
                                    .foregroundColor(Constants.DARK_SLATE)
                            }
                        }
                        .buttonStyle(PointsSideoutButtonStyle())
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
        .screenshotView { screenshotMaker in self.screenshotMaker = screenshotMaker }
        .alert("Please set up Match before trying to start Match. The application will not run unless the Match has been set up first.", isPresented: $presentMatchSetupAlert, actions: {})
        
    }
    
    
    // MARK: - Match Funtions
    
    func setStartingServerName() -> String{
        //print("Starting setStartingServerName()")
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
            //print("\nStarting case 1 of setWhoIsServing()")
            //print("gameScoreTeam2 in case 1: \(match.games[match.currentGameNumber - 1].gameScoreTeam2)")
            //print("isSecondServer in case 1: \(match.isSecondServer)")
            if match.isSecondServer {
                //print("In if match.isSecondServer of case 1")
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam2) % 2) == 0 {
                    $match.servingPlayerNumber.wrappedValue = 3
                    //print("Player1Team1 was serving, server is set to Player1Team2")
                } else {
                    $match.servingPlayerNumber.wrappedValue = 4
                    //print("Player1Team1 was serving, server is set to Player2Team2")
                }
            } else {
                //print("In else of if match.isSecondServer of case 1")
                $match.servingPlayerNumber.wrappedValue = 2
                //print("Player1Team1 was serving, server is set to Player2Team1")
            }
        case 2:
            //print("\nStarting case 2 of setWhoIsServing()")
            //print("gameScoreTeam2 in case 2: \(match.games[match.currentGameNumber - 1].gameScoreTeam2)")
            if match.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam2) % 2) == 0 {
                    $match.servingPlayerNumber.wrappedValue = 3
                    //print("Player2Team1 was serving, server is set to Player1Team2")
                } else {
                    $match.servingPlayerNumber.wrappedValue = 4
                    //print("Player2Team1 was serving, server is set to Player2Team2")
                }
            } else {
                $match.servingPlayerNumber.wrappedValue = 1
                //print("Player2Team1 was serving, server is set to Player1Team1")
            }
        case 3:
            //print("\nStarting case 3 of setWhoIsServing()")
            //print("gameScoreTeam1: \(match.games[match.currentGameNumber - 1].gameScoreTeam1)")
            if match.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam1) % 2) == 0 {
                    $match.servingPlayerNumber.wrappedValue = 1
                    //print("Player1Team2 was serving, server is set to Player1Team1")
                } else {
                    $match.servingPlayerNumber.wrappedValue = 2
                    //print("Player1Team2 was serving, server is set to Player2Team1")
                }
            } else {
                $match.servingPlayerNumber.wrappedValue = 4
                //print("Player1Team2 was serving, server is set to Player2Team2")
            }
        case 4:
            //print("\nStarting case 4 of setWhoIsServing()")
            //print("gameScoreTeam1: \(match.games[match.currentGameNumber - 1].gameScoreTeam1)")
            if match.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam2) % 2) == 0 {
                    $match.servingPlayerNumber.wrappedValue = 1
                    //print("Player2Team2 was serving, server is set to Player1Team1")
                } else {
                    $match.servingPlayerNumber.wrappedValue = 2
                    //print("Player2Team2 was serving, server is set to Player2Team1")
                }
            } else {
                $match.servingPlayerNumber.wrappedValue = 3
                //print("Player2Team2 was serving, server is set to Player1Team2")
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




// MARK: - Extension for Saving Images, Updating score, Checking Game Winner and Checking Match Winner

extension MatchView {

// MARK: - Extension Match & Game Functions
    
    func updateScore() {
        
        let tm1Score = (match.games[match.currentGameNumber - 1].player1Team1Points) + (match.games[match.currentGameNumber - 1].player2Team1Points)
        let tm2Score = (match.games[match.currentGameNumber - 1].player1Team2Points) + (match.games[match.currentGameNumber - 1].player2Team2Points)
        let server = match.isSecondServer == true ? "2" : "1"
        
        //print("\nIn updateScore() - tm1Score: \(tm1Score) tm2Score: \(tm2Score) server: \(server)")
        
        if match.isTeam1Serving {
            //print("Team 1 is serving")
            $match.scoreDisplay.wrappedValue = "\(tm1Score) - \(tm2Score) - \(server)"
        } else {
            //print("Team 2 is serving")
            $match.scoreDisplay.wrappedValue = "\(tm2Score) - \(tm1Score) - \(server)"
        }
        //print("scoreDisplay at end of updateScore(): \(match.scoreDisplay)\n")
        if isGameWinner() {
            if isMatchWinner() {
                print("There is a match winner")
                
            }
            presentGameWinnerAlert = true
            $match.games[match.currentGameNumber - 1].isGameWinner.wrappedValue = true
        }
    }
    
    func isGameWinner() -> Bool {
        
        let tm1Score = (match.games[match.currentGameNumber - 1].player1Team1Points) + (match.games[match.currentGameNumber - 1].player2Team1Points)
        let tm2Score = (match.games[match.currentGameNumber - 1].player1Team2Points) + (match.games[match.currentGameNumber - 1].player2Team2Points)
        
        if match.selectedGameFormat == 7 {
            if (tm1Score > 6) || (tm2Score > 6) {
                let largest = max(tm1Score, tm2Score)
                if  largest == tm1Score {
                    if tm1Score - tm2Score > 1 {
                        $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm1Score) | \(tm2Score)"
                        $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                        return true
                    }
                } else if largest == tm2Score {
                    if tm2Score - tm2Score > 1 {
                        $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm2Score) | \(tm1Score)"
                        $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                        return true
                    }
                }
            }
            return false
        } else if match.selectedGameFormat == 11 {
            if (tm1Score > 10) || (tm2Score > 10) {
                let largest = max(tm1Score, tm2Score)
                if  largest == tm1Score {
                    if tm1Score - tm2Score > 1 {
                        $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm1Score) | \(tm2Score)"
                        $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                        return true
                    }
                } else if largest == tm2Score {
                    if tm2Score - tm1Score > 1 {
                        $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm2Score) | \(tm1Score)"
                        $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                        return true
                    }
                }
            }
            return false
        } else if match.selectedGameFormat == 15 {
            if (tm1Score > 14) || (tm2Score > 14) {
                let largest = max(tm1Score, tm2Score)
                if  largest == tm1Score {
                    if tm1Score - tm2Score > 1 {
                        $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm1Score) | \(tm2Score)"
                        $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                    }
                } else if largest == tm2Score {
                    if tm2Score - tm2Score > 1 {
                        $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm2Score) | \(tm1Score)"
                        $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                        return true
                    }
                }
            }
            return false
        } else if match.selectedGameFormat == 21 {
            if (tm1Score > 20) || (tm2Score > 20) {
                let largest = max(tm1Score, tm2Score)
                if  largest == tm1Score {
                    if tm1Score - tm2Score > 1 {
                        $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm1Score) | \(tm2Score)"
                        $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                        return true
                    }
                } else if largest == tm2Score {
                    if tm2Score - tm2Score > 1 {
                        $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm2Score) | \(tm1Score)"
                        $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                        return true
                    }
                }
            }
            return false
        }
        
        return false
    }
    
    func isMatchWinner() -> Bool {
        
        var gamesWonTeam1 = 0
        var gamesWonTeam2 = 0
        
        if match.selectedMatchFormat == 1 {
            if match.games[match.currentGameNumber - 1].isGameWinner {
                $match.isMatchWinner.wrappedValue = true
                $match.isMatchCompleted.wrappedValue = true
                if match.games[match.currentGameNumber - 1].gameWinnerTeam == 1 {
                    $match.matchWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                } else {
                    $match.matchWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                }
                return true
            }
        } else if match.selectedMatchFormat == 2 {
            
            if match.games[0].isGameWinner {
                if match.games[0].gameWinnerTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            if match.games[1].isGameWinner {
                if match.games[1].gameWinnerTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            if match.games[2].isGameWinner {
                if match.games[2].gameWinnerTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            
            if gamesWonTeam1 == 2 {
                $match.isMatchWinner.wrappedValue = true
                $match.isMatchCompleted.wrappedValue = true
                $match.matchWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                gamesWonTeam1 = 0
                gamesWonTeam2 = 0
                return true
            } else if gamesWonTeam2 == 2 {
                $match.isMatchWinner.wrappedValue = true
                $match.isMatchCompleted.wrappedValue = true
                $match.matchWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                gamesWonTeam1 = 0
                gamesWonTeam2 = 0
                return true
            }
        } else if match.selectedMatchFormat == 3 {
            if match.games[0].isGameWinner {
                if match.games[0].gameWinnerTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            if match.games[1].isGameWinner {
                if match.games[1].gameWinnerTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            if match.games[2].isGameWinner {
                if match.games[2].gameWinnerTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            if match.games[3].isGameWinner {
                if match.games[3].gameWinnerTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            if match.games[4].isGameWinner {
                if match.games[4].gameWinnerTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            if match.games[5].isGameWinner {
                if match.games[5].gameWinnerTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            
            if gamesWonTeam1 == 3 {
                $match.isMatchWinner.wrappedValue = true
                $match.isMatchCompleted.wrappedValue = true
                $match.matchWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                gamesWonTeam1 = 0
                gamesWonTeam2 = 0
                return true
            } else if gamesWonTeam2 == 3 {
                $match.isMatchWinner.wrappedValue = true
                $match.isMatchCompleted.wrappedValue = true
                $match.matchWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                gamesWonTeam1 = 0
                gamesWonTeam2 = 0
                return true
            }
        }
        
        return false
    }
    
    func closeGame() {
        print("closeGame() function")
        
        /*
         Mark current game as completed
         Change current game number to next game number
         Set first server for next game
         Set court orientation for next game - players change sides
         
         
         */
        
        
    }
    
    func closeMatch() {
        print("closeMatch() function")
        
        /*
         
         
         
         */
    }
    
// MARK: - Extension Point Scored
    
    func pointScored() {
        
        //print("gameScoreTeam1 in pointScored(): \(model.gameScoreTeam1)")
        //print("gameScoreTeam2 in pointScored(): \(model.gameScoreTeam2)")
        
        // TODO: - Need to handle game to 21 points if it goes past 21 points
        if match.servingPlayerNumber == 1 {
            $match.games[match.currentGameNumber - 1].player1Team1Points.wrappedValue += 1
            // Player 1 Team 1 is serving as second server on Team 1
            if match.isSecondServer {
                // Second server uses backslash to mark points - "squareleftbackslash"
                //print("    > > > gameScoreTeam1 in pointScored()[1]: \(match.games[match.currentGameNumber - 1].gameScoreTeam1)")
                switch match.games[match.currentGameNumber - 1].gameScoreTeam1 {
                case 1:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point1Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point1Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point1Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point1Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 2:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point2Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point2Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point2Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point2Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point2Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 3:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point3Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point3Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point3Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point3Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point3Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 4:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point4Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point4Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point4Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point4Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point4Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 5:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point5Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point5Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point5Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point5Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point5Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 6:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point6Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point6Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point6Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point6Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point6Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 7:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point7Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point7Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point7Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point7Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point7Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 8:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point8Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point8Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point8Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point8Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point8Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 9:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point9Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point9Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point9Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point9Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point9Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 10:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point10Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point10Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point10Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point10Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point10Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 11:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point11Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point11Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point11Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point11Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point11Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 12:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point12Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point12Game2ImageTm1.wrappedValue = "squareleftbackslash" //point12Game2ImageTm1
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point12Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point12Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 13:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point3Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point13Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point13Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point13Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point13Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 14:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point14Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point14Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point14Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point14Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point14Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 15:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point15Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point15Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point15Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point15Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point15Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 16:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point16Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point16Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point16Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point16Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point16Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 17:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point17Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point17Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point17Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point17Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point17Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 18:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point18Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point18Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point18Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point18Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point18Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 19:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point19Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point19Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point19Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point19Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point19Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 20:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point20Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point20Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point20Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point20Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point20Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 21:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point21Game1ImageTm1.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point21Game2ImageTm1.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point21Game3ImageTm1.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point21Game4ImageTm1.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point21Game5ImageTm1.wrappedValue = "squarerightfwdslash"
                    }
                default:
                    print("Error setting image in switch statement of pointScored()")
                }
            } else {
                // Player 1 Team 1 is serving as first server on Team 1
                // First server uses forwardslash to mark points - "squareleftfwdslash"
                //print("    > > > gameScoreTeam1 in pointScored() [2]: \(match.games[match.currentGameNumber - 1].gameScoreTeam1)")
                switch match.games[match.currentGameNumber - 1].gameScoreTeam1 {
                case 1:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point1Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point1Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point1Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point1Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 2:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point2Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point2Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point2Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point2Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point2Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 3:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point3Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point3Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point3Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point3Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point3Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 4:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point4Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point4Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point4Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point4Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point4Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 5:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point5Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point5Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point5Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point5Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point5Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 6:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point6Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point6Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point6Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point6Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point6Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 7:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point7Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point7Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point7Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point7Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point7Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 8:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point8Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point8Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point8Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point8Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point8Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 9:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point9Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point9Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point9Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point9Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point9Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 10:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point10Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point10Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point10Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point10Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point10Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 11:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point11Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point11Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point11Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point11Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point11Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 12:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point12Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point12Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point12Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point12Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point12Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 13:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point13Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point13Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point13Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point13Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 14:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point14Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point14Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point14Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point14Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point14Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 15:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point15Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point15Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point15Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point15Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point15Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 16:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point16Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point16Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point16Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point16Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point16Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 17:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point17Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point17Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point17Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point17Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point17Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 18:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point18Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point18Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point18Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point18Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point18Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 19:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point19Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point19Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point19Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point19Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point19Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 20:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point20Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point20Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point20Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point20Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point20Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 21:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point21Game1ImageTm1.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point21Game2ImageTm1.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point21Game3ImageTm1.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point21Game4ImageTm1.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point21Game5ImageTm1.wrappedValue = "squarerightfwdslash"
                    }
                default:
                    print("Error setting image in switch statement of pointScored()")
                }
            }
        // End if player 1 serving
        }
        
        else if  match.servingPlayerNumber == 2 {
            $match.games[match.currentGameNumber - 1].player2Team1Points.wrappedValue += 1
            // Player 2 Team 1 is serving as second server on Team 1
            if match.isSecondServer {
                // Second server uses backslash to mark points - "squareleftbackslash"
                
                //print("    > > > gameScoreTeam1 in pointScored()[3]: \(match.games[match.currentGameNumber - 1].gameScoreTeam1)")
                switch match.games[match.currentGameNumber - 1].gameScoreTeam1 {
                case 1:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point1Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point1Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point1Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point1Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 2:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point2Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point2Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point2Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point2Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point2Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 3:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point3Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point3Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point3Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                    else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point3Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                    else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point3Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 4:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point4Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point4Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point4Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point4Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point4Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 5:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point5Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point5Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point5Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point5Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point5Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 6:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point6Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point6Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point6Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point6Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point6Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 7:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point7Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point7Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point7Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point7Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point7Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 8:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point8Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point8Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point8Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point8Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point8Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 9:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point9Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point9Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point9Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                    else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point9Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                    else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point9Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 10:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point10Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point10Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point10Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point10Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point10Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 11:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point11Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point11Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point11Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point11Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point11Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 12:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point12Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point12Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point12Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point12Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point12Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 13:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point13Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point13Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point13Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point13Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point13Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 14:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point14Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point14Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point14Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point14Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point14Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 15:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point15Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point15Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point15Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point15Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point15Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 16:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point16Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point16Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point16Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point16Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point16Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 17:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point17Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point17Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point17Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point17Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point17Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 18:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point18Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point18Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point18Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point18Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point18Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 19:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point19Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point19Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point19Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point19Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point19Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 20:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point20Game1ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point20Game2ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point20Game3ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point20Game4ImageTm1.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point20Game5ImageTm1.wrappedValue = "squareleftbackslash"
                    }
                case 21:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point21Game1ImageTm1.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point21Game2ImageTm1.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point21Game3ImageTm1.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point21Game4ImageTm1.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point21Game5ImageTm1.wrappedValue = "squarerightfwdslash"
                    }
                    
                default:
                    print("Error setting image in switch statement of pointScored()")
                }
            } else {
                // Player 2 Team 1 is serving as first server on Team 1
                // First server uses forwardslash to mark points - "squareleftfwdslash"
                //print("    > > > gameScoreTeam1 in pointScored() [4]: \(match.games[match.currentGameNumber - 1].gameScoreTeam1)")
                switch match.games[match.currentGameNumber - 1].gameScoreTeam1 {
                case 1:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point1Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point1Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point1Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point1Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 2:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point2Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point2Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point2Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point2Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point2Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 3:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point3Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point3Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point3Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point3Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point3Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 4:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point4Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point4Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point4Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point4Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point4Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 5:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point5Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point5Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point5Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point5Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point5Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 6:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point6Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point6Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point6Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point6Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point6Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 7:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point7Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point7Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point7Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point7Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point7Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 8:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point8Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point8Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point8Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point8Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point8Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 9:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point9Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point9Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point9Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point9Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point9Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 10:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point10Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point10Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point10Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point10Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point10Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 11:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point11Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point11Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point11Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point11Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point11Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 12:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point12Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point12Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point12Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point12Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point12Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 13:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point13Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point13Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point13Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point13Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point13Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 14:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point14Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point14Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point14Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point14Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point14Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 15:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point15Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point15Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point15Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point15Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point15Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 16:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point16Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point16Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point16Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point16Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point16Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 17:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point17Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point17Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point17Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point17Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point17Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 18:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point18Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point18Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point18Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point18Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point18Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 19:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point19Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point19Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point19Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point19Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point19Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 20:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point20Game1ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point20Game2ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point20Game3ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point20Game4ImageTm1.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point20Game5ImageTm1.wrappedValue = "squareleftfwdslash"
                    }
                case 21:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point21Game1ImageTm1.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point21Game2ImageTm1.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point21Game3ImageTm1.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point21Game4ImageTm1.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point21Game5ImageTm1.wrappedValue = "squarerightfwdslash"
                    }
                default:
                    print("Error setting image in switch statement of pointScored()")
                }
            }
            
        // End if player 2 serving
        }
        
        
        else if  match.servingPlayerNumber == 3 {
            $match.games[match.currentGameNumber - 1].player1Team2Points.wrappedValue += 1
            // Player 1 Team 2 is serving as second server on Team 2
            if match.isSecondServer {
                // Second server uses backslash to mark points - "squareleftbackslash"
                
                //print("    > > > gameScoreTeam2 in pointScored()[5]: \(match.games[match.currentGameNumber - 1].gameScoreTeam2)")
                switch match.games[match.currentGameNumber - 1].gameScoreTeam2 {
                case 1:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point1Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point1Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point1Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point1Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                    else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 2:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point2Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point2Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point2Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                    else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point2Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point2Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 3:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point3Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point3Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point3Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point3Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point3Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 4:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point4Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point4Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point4Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point4Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point4Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 5:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point5Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point5Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point5Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point5Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point5Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 6:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point6Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point6Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point6Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point6Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point6Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 7:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point7Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point7Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point7Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point7Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point7Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 8:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point8Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point8Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point8Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point8Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point8Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 9:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point9Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point9Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point9Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point9Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point9Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 10:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point10Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point10Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point10Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point10Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point10Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 11:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point11Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point11Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point11Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point11Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point11Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 12:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point12Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point12Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point12Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point12Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point12Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 13:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point13Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point13Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point13Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point13Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 14:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point14Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point14Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point14Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point14Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point14Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 15:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point15Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point15Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point15Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point15Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point15Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 16:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point16Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point16Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point16Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point16Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                    else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point16Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 17:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point17Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point17Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point17Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point17Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                    else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point17Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 18:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point18Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point18Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point18Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point18Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point18Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 19:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point19Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point19Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point19Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point19Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point19Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 20:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point20Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point20Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point20Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point20Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point20Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 21:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point21Game1ImageTm2.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point21Game2ImageTm2.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point21Game3ImageTm2.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point21Game4ImageTm2.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point21Game5ImageTm2.wrappedValue = "squarerightfwdslash"
                    }
                    
                default:
                    print("Error setting image in switch statement of pointScored()")
                }
            } else {
                // Player 1 Team 2 is serving as first server on Team 2
                // First server uses forwardslash to mark points - "squareleftfwdslash"
                //print("    > > > gameScoreTeam2 in pointScored() [6]: \(match.games[match.currentGameNumber - 1].gameScoreTeam2)")
                switch match.games[match.currentGameNumber - 1].gameScoreTeam2 {
                case 1:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point1Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point1Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point1Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point1Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 2:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point2Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point2Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point2Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point2Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point2Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 3:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point3Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point3Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point3Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                    else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point3Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                    else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point3Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 4:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point4Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point4Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point4Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point4Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point4Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 5:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point5Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point5Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point5Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point5Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point5Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 6:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point6Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point6Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point6Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point6Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point6Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 7:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point7Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point7Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point7Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point7Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point7Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 8:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point8Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point8Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point8Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point8Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point8Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 9:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point9Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point9Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point9Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point9Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point9Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 10:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point10Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point10Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point10Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point10Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point10Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 11:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point11Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point11Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point11Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point11Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point11Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 12:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point12Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point12Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point12Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point12Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point12Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 13:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point13Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point13Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point13Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point13Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point13Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 14:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point14Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point14Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point14Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point14Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point14Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 15:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point15Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point15Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point15Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point15Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point15Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 16:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point16Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point16Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point16Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point16Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point16Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 17:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point17Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point17Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point17Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point17Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point17Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 18:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point18Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point18Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point18Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point18Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point18Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 19:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point19Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point19Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point19Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point19Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point19Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 20:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point20Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point20Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point20Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point20Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point20Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 21:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point21Game1ImageTm2.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point21Game2ImageTm2.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point21Game3ImageTm2.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point21Game4ImageTm2.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point21Game5ImageTm2.wrappedValue = "squarerightfwdslash"
                    }
                default:
                    print("Error setting image in switch statement of pointScored()")
                }
            }
            
        // End if player 3 serving
        }
        
        else if  match.servingPlayerNumber == 4 {
            $match.games[match.currentGameNumber - 1].player2Team2Points.wrappedValue += 1
            // Player 2 Team 2 is serving as second server on Team 2
            if match.isSecondServer {
                // Second server uses backslash to mark points - "squareleftbackslash"
                
                //print("    > > > gameScoreTeam2 in pointScored()[7]: \(match.games[match.currentGameNumber - 1].gameScoreTeam2)")
                switch match.games[match.currentGameNumber - 1].gameScoreTeam2 {
                case 1:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point1Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point1Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point1Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point1Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 2:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point2Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point2Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point2Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point2Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point2Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 3:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point3Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point3Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point3Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point3Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point3Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 4:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point4Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point4Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point4Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point4Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point4Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 5:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point5Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point5Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point5Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point5Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point5Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 6:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point6Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point6Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point6Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point6Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point6Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 7:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point7Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point7Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point7Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point7Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point7Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 8:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point8Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point8Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point8Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point8Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point8Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 9:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point9Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point9Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point9Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point9Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point9Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 10:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point10Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point10Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point10Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point10Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point10Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 11:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point11Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point11Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point11Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point11Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point11Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 12:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point12Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point12Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point12Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point12Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point12Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 13:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point13Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point13Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point13Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point13Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point13Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 14:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point14Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point14Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point14Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point14Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point14Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 15:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point15Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point15Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point15Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point15Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point15Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 16:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point16Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point16Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point16Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point16Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point16Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 17:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point17Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point17Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point17Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point17Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point17Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 18:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point18Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point18Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point18Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point18Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point18Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 19:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point19Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point19Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point19Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point19Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point19Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 20:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point20Game1ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point20Game2ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point20Game3ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point20Game4ImageTm2.wrappedValue = "squareleftbackslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point20Game5ImageTm2.wrappedValue = "squareleftbackslash"
                    }
                case 21:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point21Game1ImageTm2.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point21Game2ImageTm2.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point21Game3ImageTm2.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point21Game4ImageTm2.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point21Game5ImageTm2.wrappedValue = "squarerightfwdslash"
                    }
                    
                default:
                    print("Error setting image in switch statement of pointScored()")
                }
            } else {
                // Player 2 Team 2 is serving as first server on Team 2
                // First server uses forwardslash to mark points - "squareleftfwdslash"
                //print("    > > > gameScoreTeam2 in pointScored() [8]: \(match.games[match.currentGameNumber - 1].gameScoreTeam2)")
                switch match.games[match.currentGameNumber - 1].gameScoreTeam2 {
                case 1:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point1Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point1Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point1Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point1Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 2:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point2Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point2Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point2Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                    else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point2Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                    else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point2Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 3:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point3Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point3Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point3Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point3Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point3Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 4:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point4Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point4Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point4Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point4Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point4Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 5:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point5Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point5Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point5Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point5Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point5Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 6:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point6Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point6Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point6Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point6Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point6Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 7:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point7Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point7Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point7Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point7Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point7Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 8:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point8Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point8Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point8Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point8Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point8Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 9:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point9Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point9Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point9Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point9Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point9Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 10:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point10Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point10Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point10Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point10Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point10Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 11:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point11Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point11Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point11Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point11Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point11Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 12:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point12Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point12Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point12Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point12Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point12Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 13:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point13Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point13Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point13Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point13Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point13Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 14:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point14Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point14Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point14Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point14Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point14Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 15:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point15Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point15Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point15Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point15Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point15Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 16:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point16Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point16Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point16Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point16Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point16Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 17:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point17Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point17Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point17Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point17Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point17Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 18:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point18Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point18Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point18Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point18Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point18Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 19:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point19Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point19Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point19Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point19Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point19Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 20:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point20Game1ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point20Game2ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point20Game3ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point20Game4ImageTm2.wrappedValue = "squareleftfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point20Game5ImageTm2.wrappedValue = "squareleftfwdslash"
                    }
                case 21:
                    if match.currentGameNumber == 1 {
                        $match.games[match.currentGameNumber - 1].point21Game1ImageTm2.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 2 {
                        $match.games[match.currentGameNumber - 1].point21Game2ImageTm2.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 3 {
                        $match.games[match.currentGameNumber - 1].point21Game3ImageTm2.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 4 {
                        $match.games[match.currentGameNumber - 1].point21Game4ImageTm2.wrappedValue = "squarerightfwdslash"
                    } else if match.currentGameNumber == 5 {
                        $match.games[match.currentGameNumber - 1].point21Game5ImageTm2.wrappedValue = "squarerightfwdslash"
                    }
                default:
                    print("Error setting image in switch statement of pointScored()")
                }
            }
            
        // End if player 4 serving
        }
        
    }  // End pointScored()
    
    
//    func setTimeoutImage(team: Int) {
//
//        print("\nStarting setTimeoutImage()")
//        print("team parameter: \(team)")
//        print("timeOutsTeam1: \(match.games[match.currentGameNumber - 1].timeOutsTeam1)")
//        print("timeOutsTeam2: \(match.games[match.currentGameNumber - 1].timeOutsTeam2)\n")
//
//        if team == 1 {
//            switch match.games[match.currentGameNumber - 1].timeOutsTeam1 {
//            case 0:
//                if match.currentGameNumber == 1 {
//                    $match.games[0].timeOut1Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                } else if match.currentGameNumber == 2 {
//                    $match.games[1].timeOut1Game2ImageTm1.wrappedValue = "squareleftfwdslash"
//                } else if match.currentGameNumber == 3 {
//                    $match.games[2].timeOut1Game3ImageTm1.wrappedValue = "squareleftfwdslash"
//                } else if match.currentGameNumber == 4 {
//                    $match.games[3].timeOut1Game4ImageTm1.wrappedValue = "squareleftfwdslash"
//                } else if match.currentGameNumber == 5 {
//                    $match.games[4].timeOut1Game5ImageTm1.wrappedValue = "squareleftfwdslash"
//                }
//            case 1:
//                if match.currentGameNumber == 1 {
//                    $match.games[0].timeOut2Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                } else if match.currentGameNumber == 2 {
//                    $match.games[1].timeOut2Game2ImageTm1.wrappedValue = "squareleftfwdslash"
//                } else if match.currentGameNumber == 3 {
//                    $match.games[2].timeOut2Game3ImageTm1.wrappedValue = "squareleftfwdslash"
//                } else if match.currentGameNumber == 4 {
//                    $match.games[3].timeOut2Game4ImageTm1.wrappedValue = "squareleftfwdslash"
//                } else if match.currentGameNumber == 5 {
//                    $match.games[4].timeOut2Game5ImageTm1.wrappedValue = "squareleftfwdslash"
//                }
//            case 2:
//                if match.currentGameNumber == 1 {
//                    $match.games[0].timeOut3Game1ImageTm1.wrappedValue = "squarerightfwdslash"
//                } else if match.currentGameNumber == 2 {
//                    $match.games[1].timeOut3Game2ImageTm1.wrappedValue = "squarerightfwdslash"
//                } else if match.currentGameNumber == 3 {
//                    $match.games[2].timeOut3Game3ImageTm1.wrappedValue = "squarerightfwdslash"
//                } else if match.currentGameNumber == 4 {
//                    $match.games[3].timeOut3Game4ImageTm1.wrappedValue = "squarerightfwdslash"
//                } else if match.currentGameNumber == 5 {
//                    $match.games[4].timeOut3Game5ImageTm1.wrappedValue = "squarerightfwdslash"
//                }
//            default:
//                print("Error setting image in switch statement of setTimeoutImage()")
//            }
//
//        } else if team == 2 {
//            switch match.games[match.currentGameNumber - 1].timeOutsTeam2 {
//            case 0:
//                if match.currentGameNumber == 1 {
//                    $match.games[0].timeOut1Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                } else if match.currentGameNumber == 2 {
//                    $match.games[1].timeOut1Game2ImageTm2.wrappedValue = "squareleftfwdslash"
//                } else if match.currentGameNumber == 3 {
//                    $match.games[2].timeOut1Game3ImageTm2.wrappedValue = "squareleftfwdslash"
//                } else if match.currentGameNumber == 4 {
//                    $match.games[3].timeOut1Game4ImageTm2.wrappedValue = "squareleftfwdslash"
//                } else if match.currentGameNumber == 5 {
//                    $match.games[4].timeOut1Game5ImageTm2.wrappedValue = "squareleftfwdslash"
//                }
//            case 1:
//                if match.currentGameNumber == 1 {
//                    $match.games[0].timeOut2Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                } else if match.currentGameNumber == 2 {
//                    $match.games[1].timeOut2Game2ImageTm2.wrappedValue = "squareleftfwdslash"
//                } else if match.currentGameNumber == 3 {
//                    $match.games[2].timeOut2Game3ImageTm2.wrappedValue = "squareleftfwdslash"
//                } else if match.currentGameNumber == 4 {
//                    $match.games[3].timeOut2Game4ImageTm2.wrappedValue = "squareleftfwdslash"
//                } else if match.currentGameNumber == 5 {
//                    $match.games[4].timeOut2Game5ImageTm2.wrappedValue = "squareleftfwdslash"
//                }
//            case 2:
//                if match.currentGameNumber == 1 {
//                    $match.games[0].timeOut3Game1ImageTm2.wrappedValue = "squarerightfwdslash"
//                } else if match.currentGameNumber == 2 {
//                    $match.games[1].timeOut3Game2ImageTm2.wrappedValue = "squarerightfwdslash"
//                } else if match.currentGameNumber == 3 {
//                    $match.games[2].timeOut3Game3ImageTm2.wrappedValue = "squarerightfwdslash"
//                } else if match.currentGameNumber == 4 {
//                    $match.games[3].timeOut3Game4ImageTm2.wrappedValue = "squarerightfwdslash"
//                } else if match.currentGameNumber == 5 {
//                    $match.games[4].timeOut3Game5ImageTm2.wrappedValue = "squarerightfwdslash"
//                }
//            default:
//                print("Error setting image in switch statement of setTimeoutImage()")
//            }
//        }
//
//
//    }  // End setTimeoutImage()
    
    
}


