//
//  TopButtonsView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//
import RealmSwift
import SwiftUI

struct TopButtonsView: View {
    
    @ObservedRealmObject var match: Match
    
    @State private var showingMatchSetup = false
    @State private var showingPreMatchBriefing = false
    @State private var showingTimeOut = false
    @State private var showingReference = false
    @State private var showingStopwatch = false
    
    var body: some View {
        
        VStack (spacing: 20) {
            Button {
                showingMatchSetup.toggle()
            } label: {
                Text("Match Setup")
            }
            .buttonStyle(OptionsButton())
            .sheet(isPresented: $showingMatchSetup) { MatchSetupView(match:match) }
            
            Button {
                showingPreMatchBriefing.toggle()
            } label: {
                Text("Briefing")
            }
            .buttonStyle(OptionsButton())
            .sheet(isPresented: $showingPreMatchBriefing) { PreMatchBriefingView() }
            
            Button {
                showingTimeOut.toggle()
            } label: {
                Text("Timeout")
            }
            .buttonStyle(OptionsButton())
            .sheet(isPresented: $showingTimeOut) { TimeOutView() }
            
            Button {
                showingReference.toggle()
            }label: {
                Text("Reference")
            }
            .buttonStyle(OptionsButton())
            .sheet(isPresented: $showingReference) { ReferenceView() }
            
            Button {
                showingStopwatch.toggle()
            } label: {
                Text("Stopwatch")
            }
            .buttonStyle(OptionsButton())
            .sheet(isPresented: $showingStopwatch) { StopwatchView() }
            
        }
        .padding(10)
        .background(Constants.CLOUDS)
    }
    
}

struct TopButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        TopButtonsView(match: Match())
    }
}
