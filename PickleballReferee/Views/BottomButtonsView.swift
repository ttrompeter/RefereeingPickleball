//
//  BottomButtonsView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import Combine
import RealmSwift
import SwiftUI

struct BottomButtonsView: View {
    
    @EnvironmentObject var scoresheetManager: ScoresheetManager
    @EnvironmentObject var realmManager: RealmManager
    @ObservedRealmObject var match: Match
    
    @State private var presentServerSideSetAlert = false
    @State private var presentStopMatchAlert = false
    @State private var screenshotMaker: ScreenshotMaker?
    @State private var showingAdmin = false
    @State private var showingHelp = false
    @State private var showingRules = false
    @State private var showingSetServer = false
   
    
    var body: some View {
        
        VStack (spacing: 20) {
            VStack {
                
            }
            if !scoresheetManager.isMatchStarted {
                Button {
                    $scoresheetManager.isMatchStarted.wrappedValue = true
                    $match.matchStartDateValue.wrappedValue = Date.now
                    // If playing game 1 then set the gameStartDateValue so game duration can be "timed"
                    // Timing for other games is started in setUpNewGame
                    if match.currentGameArrayIndex == 0 {
                        $match.games[0].gameStartDateValue.wrappedValue = Date.now
                    }
                    scoresheetManager.isGameStarted = true
                    scoresheetManager.isMatchStarted = true
                } label: {
                    Text("Start Match")
                }
                .buttonStyle(FunctionsButtonStyleGreen())
                .disabled(!scoresheetManager.isMatchStartingServerSet || !scoresheetManager.isGameStartReady || match.isCompleted)
            } else if !match.isCompleted {
                Button {
                    presentStopMatchAlert.toggle()
                } label: {
                    Text("Stop")
                }
                .buttonStyle(EndMatchButtonStyle())
                .alert("Stop Match Now?", isPresented: $presentStopMatchAlert) {
                    Button("End Game") { endGame() }
                    Button("End Match") { endMatch() }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("Are you sure you want to stop now? Ending Game or Match CAN'T BE UNDONE!")
                }
            } else {
                Button {
                    
                } label: {
                    Text("Start Match2")
                }
                .buttonStyle(FunctionsButtonStyleGreen())
                .disabled(match.isCompleted)
            }
            
//            else if match.isCompleted {
//                Button {
//
//                } label: {
//                    Text("New Match")
//                }
//                .buttonStyle(FunctionsButtonStyleGreen())
//            }
            
//                Button {
//                    if let screenshotMaker = screenshotMaker {
//                        screenshotMaker.screenshot()?.saveScoresheetToDocuments()
//                    }
//                } label: {
//                    Text("Screenshot")
//                }
//                .buttonStyle(FunctionsButtonStyleGreen())
            
            Button {
                showingHelp.toggle()
            } label: {
                Text("Help")
            }
            .buttonStyle(FunctionsButtonStyle())
            .sheet(isPresented: $showingHelp) { HelpView() }
            
            Button {
                showingAdmin.toggle()
            } label: {
                Text("Admin")
            }
            .buttonStyle(FunctionsButtonStyle())
            .sheet(isPresented: $showingAdmin) { AdminView(match: match) }
            
            Button {
                showingRules.toggle()
            }label: {
                Text("USAPA Rules")
            }
            .buttonStyle(FunctionsButtonStyle())
            .sheet(isPresented: $showingRules) { RulesView() }

            StopwatchMinSec()
        }
        .padding(10)
        .background(Constants.CLOUDS)
        .screenshotView { screenshotMaker in self.screenshotMaker = screenshotMaker }
    }
    
    func endGame() {
        print("Starting endGame() in BottomButtonsView")
        
    }

    func endMatch() {
        print("Starting endMatch() in BottomButtonsView")
        $scoresheetManager.isMatchStarted.wrappedValue = false
    }
}

struct BottomButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtonsView(match: Match())
    }
}
