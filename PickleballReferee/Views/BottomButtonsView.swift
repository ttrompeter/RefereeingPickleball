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
    
    @ObservedRealmObject var match: Match
    
    @State private var showingHelp = false
    @State private var showingStopwatch = false
    @State private var showingRules = false
    @State private var showingAdmin = false
    @State private var showingSetServer = false
    @State private var elapsedMatchTime = 0.0
    @State private var presentStopMatchAlert = false
    @State private var presentServerSideSetAlert = false
    
    @State var matchTimer: Timer.TimerPublisher = Timer.publish(every: 30, tolerance: 0.5, on: .main, in: .common)
    
    var body: some View {
        
        VStack (spacing: 20) {
            
//            if !match.games[match.currentGameNumber - 1].isServerSideSet {
//                Button {
//                    //$match.games[match.currentGameNumber - 1].isServerSideSet.wrappedValue = true
//                    //showingSetServer.toggle()
//                    presentServerSideSetAlert.toggle()
//                } label: {
//                    Text("Orientation")
//                }
//                .buttonStyle(StartMatchButtonStyle())
// //DO NOT USE THIS                .sheet(isPresented: $showingSetServer) { SelectGameStartingServerView(match: match) }
//            } else
            if !match.isMatchStarted {
                Button {
                    $match.isMatchStarted.wrappedValue = true
                    // Start the match timer
                    _ = matchTimer.connect()
                } label: {
                    Text("Start Match")
                }
                .buttonStyle(StartMatchButtonStyle())
                .disabled(!match.isMatchStartingServerSet)
            } else if !match.isMatchCompleted {
                Button {
                    //$presentStopMatchAlert.wrappedValue = true
                    presentStopMatchAlert.toggle()
                } label: {
                    Text("Stop Match")
                }
                .buttonStyle(EndMatchButtonStyle())
                .alert("Stop Match Now", isPresented: $presentStopMatchAlert) {
                    Button("End Game") { endGame() }
                    Button("End Match") { endMatch() }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("Are you sure you want to stop now? Ending Game or Match CAN'T BE UNDONE!")
                }
            } else {
                Button {
                    $match.isMatchStarted.wrappedValue = false
                    $match.isMatchCompleted.wrappedValue = false
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
            
            Button {
                showingStopwatch.toggle()
            } label: {
                Text("Stopwatch")
            }
            .buttonStyle(FunctionsButtonStyle())
            .sheet(isPresented: $showingStopwatch) { StopwatchView() }
            
            Button {
                showingRules.toggle()
            }label: {
                Text("USAPA Rules")
            }
            .buttonStyle(FunctionsButtonStyle())
            .sheet(isPresented: $showingRules) { RulesView() }
            
            Button {
                showingAdmin.toggle()
            } label: {
                Text("Admin")
            }
            .buttonStyle(FunctionsButtonStyle())
            .sheet(isPresented: $showingAdmin) { AdminView(match: match) }
            
        }
        .padding(10)
        .background(Constants.CLOUDS)
        .onReceive(matchTimer) { time in
            $elapsedMatchTime.wrappedValue += 30.0
        }
    }
    
    func endGame() {
        print("Starting endGame() in BottomButtonsView")
        //$match.isMatchStarted.wrappedValue = false
    }
    
    func endMatch() {
        print("Starting endMatch() in BottomButtonsView")
        matchTimer.connect().cancel()
        $match.matchElapsedTime.wrappedValue = elapsedMatchTime
        print("matchElapsedTime in endMatch() of BottomButtonsView: \(elapsedMatchTime / 60) minutes , \(elapsedMatchTime.truncatingRemainder(dividingBy: 60)) seconds")
        $match.isMatchStarted.wrappedValue = false
    }
}

struct BottomButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtonsView(match: Match())
    }
}
