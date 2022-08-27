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
    @ObservedRealmObject var match: Match
    
    @State private var showingHelp = false
    @State private var showingStopwatch = false
    @State private var showingRules = false
    @State private var showingAdmin = false
    @State private var showingSetServer = false
    @State private var presentStopMatchAlert = false
    @State private var presentServerSideSetAlert = false
    
    
    var body: some View {
        
        VStack (spacing: 20) {
            
            if !match.isMatchStarted {
                Button {
                    $match.isMatchStarted.wrappedValue = true
                    $match.matchStartDateValue.wrappedValue = Date.now
//                    $match.setGameStartDateValue.wrappedValue = true
                    // If playing game 1 then set the gameStartDateValue so game can be "timed"
                    if match.currentGameArrayIndex == 0 {
                        $match.games[0].gameStartDateValue.wrappedValue = Date.now
                    }
                } label: {
                    Text("Start Match")
                }
                .buttonStyle(StartMatchButtonStyle())
                .disabled(!match.isMatchStartingServerSet)
            } else if !match.isMatchCompleted {
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
            } else if match.isMatchCompleted {
                Button {
                    print("Tapped New Match button")
                } label: {
                    Text("New Match")
                }
                .buttonStyle(FunctionsButtonStyle())
            }
            
            Button {
                showingHelp.toggle()
            } label: {
                Text("Help")
            }
            .buttonStyle(FunctionsButtonStyle())
            .sheet(isPresented: $showingHelp) { HelpView() }
            
//            Button {
//                showingStopwatch.toggle()
//            } label: {
//                Text("Stopwatch")
//            }
//            .buttonStyle(FunctionsButtonStyle())
//            .sheet(isPresented: $showingStopwatch) { StopwatchView() }
            
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

            StopwatchMS()
        }
        .padding(10)
        .background(Constants.CLOUDS)
    }
    
    func endGame() {
        print("Starting endGame() in BottomButtonsView")
    }

    func endMatch() {
        print("Starting endMatch() in BottomButtonsView")
        $match.isMatchStarted.wrappedValue = false
    }
}

struct BottomButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtonsView(match: Match())
    }
}
