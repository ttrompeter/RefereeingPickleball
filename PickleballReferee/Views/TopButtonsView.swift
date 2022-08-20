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
    
    @State private var showingTimeOut = false
    @State private var showingMatchSetup = false
    @State private var showingPreMatchBriefing = false
    @State private var showingEdit = false
    @State private var presentCoinTossAlert = false
    
    let randCoinToss = Int.random(in: 1...2)
    
    var body: some View {
        
        VStack (spacing: 20) {
            Button {
                showingTimeOut.toggle()
            } label: {
                Text("Timeout")
            }
            .buttonStyle(OptionsButtonStyle())
            .sheet(isPresented: $showingTimeOut) { TimeOutsView(match: match) }
            
            Button {
                showingPreMatchBriefing.toggle()
            } label: {
                Text("Briefing")
            }
            .buttonStyle(OptionsButtonStyle())
            .sheet(isPresented: $showingPreMatchBriefing) { PreMatchBriefingView() }
            
            Button {
                showingMatchSetup.toggle()
            } label: {
                Text("Match Setup")
            }
            .buttonStyle(OptionsButtonStyle())
            .sheet(isPresented: $showingMatchSetup) { MatchSetupView(match:match) }
            
            Button {
                showingEdit.toggle()
            } label: {
                Text("Edit Match")
            }
            .buttonStyle(OptionsButtonStyle())
            .sheet(isPresented: $showingEdit) { EditView(match: match) }
            
            if !match.isMatchStarted {
                Button {
                    presentCoinTossAlert.toggle()
                } label: {
                    Text("Coin Toss")
                }
                .buttonStyle(OptionsButtonStyle())
                .alert("\(randCoinToss)", isPresented: $presentCoinTossAlert) {
                    Button("OK", role: .cancel) {
                    }
                }
            }
            
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
