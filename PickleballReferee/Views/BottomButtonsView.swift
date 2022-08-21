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
    
    @State var matchTimer: Timer.TimerPublisher = Timer.publish(every: 30, tolerance: 0.5, on: .main, in: .common)
    
    var body: some View {
        
        VStack (spacing: 20) {
            
            if !match.games[match.currentGameNumber - 1].isServerSideSet {
                Button {
                    //$match.games[match.currentGameNumber - 1].isServerSideSet.wrappedValue = true
                    showingSetServer.toggle()
                } label: {
                    Text("Server Setup")
                }
                .buttonStyle(StartMatchButtonStyle())
                .sheet(isPresented: $showingSetServer) { SelectGameStartingServerView(match: match) }
            } else if !match.isMatchStarted {
                Button {
                    $match.isMatchStarted.wrappedValue = true
                    
                    //matchTimer = Timer.publish(every: 1, on: .main, in: .common)
                    _ = matchTimer.connect()
                } label: {
                    Text("Start Match")
                }
                .buttonStyle(StartMatchButtonStyle())
            } else if !match.isMatchCompleted {
                Button {
                    $match.isMatchCompleted.wrappedValue = true
                    matchTimer.connect().cancel()
                    $match.matchElapsedTime.wrappedValue = elapsedMatchTime
                    print("matchElapsedTime: \(elapsedMatchTime / 60) minutes , \(elapsedMatchTime.truncatingRemainder(dividingBy: 60)) seconds")
                } label: {
                    Text("End Match")
                }
                .buttonStyle(EndMatchButtonStyle())
            } else {
                Button {
                    $match.isMatchStarted.wrappedValue = false
                    $match.isMatchCompleted.wrappedValue = false
                } label: {
                    Text("New Match")
                }
                .buttonStyle(StartMatchButtonStyle())
            }
            
            Button {
                showingHelp.toggle()
            } label: {
                Text("Help")
            }
            .buttonStyle(OptionsButtonStyle())
            .sheet(isPresented: $showingHelp) { HelpView() }
            
            Button {
                showingStopwatch.toggle()
            } label: {
                Text("Stopwatch")
            }
            .buttonStyle(OptionsButtonStyle())
            .sheet(isPresented: $showingStopwatch) { StopwatchView() }
            
            Button {
                showingRules.toggle()
            }label: {
                Text("USAPA Rules")
            }
            .buttonStyle(OptionsButtonStyle())
            .sheet(isPresented: $showingRules) { RulesView() }
            
            Button {
                showingAdmin.toggle()
            } label: {
                Text("Admin")
            }
            .buttonStyle(OptionsButtonStyle())
            .sheet(isPresented: $showingAdmin) { AdminView(match: match) }
            
        }
        .padding(10)
        .background(Constants.CLOUDS)
        .onReceive(matchTimer) { time in
            $elapsedMatchTime.wrappedValue += 30.0
        }
    }
}

struct BottomButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtonsView(match: Match())
    }
}
