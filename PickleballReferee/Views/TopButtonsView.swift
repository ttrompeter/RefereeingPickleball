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
    
    @State private var presentCoinTossAlert = false
    @State private var showingEdit = false
    @State private var showingMatchSetup = false
    @State private var showingPreMatchBriefing = false
    @State private var showingTimeOut = false
    @State private var showingViolation = false
   
    let randCoinToss = Int.random(in: 1...2)
    
    var body: some View {
        
        VStack (spacing: 20) {
            Button {
                showingTimeOut.toggle()
            } label: {
                Text("Timeout")
            }
            .buttonStyle(FunctionsButtonStyle())
            .sheet(isPresented: $showingTimeOut) { TimeOutsView(match: match) }
            
            Button {
                showingPreMatchBriefing.toggle()
            } label: {
                Text("Briefing")
            }
            .buttonStyle(FunctionsButtonStyle())
            .sheet(isPresented: $showingPreMatchBriefing) { PreMatchBriefingView() }
            
            
            
            if !match.isMatchSetup {
                Button {
                    showingMatchSetup.toggle()
                } label: {
                    if match.isMatchSetup {
                        Text("Edit Match")
                    } else {
                        Text("Match Setup")
                    }
                }
                .buttonStyle(FunctionsButtonStyleMandatory())
                .sheet(isPresented: $showingMatchSetup) { MatchSetupView(match:match) }
            } else {
                Button {
                    showingMatchSetup.toggle()
                } label: {
                    Text("Match Setup")
                }
                .buttonStyle(FunctionsButtonStyle())
                .sheet(isPresented: $showingMatchSetup) { MatchSetupView(match:match) }.buttonStyle(FunctionsButtonStyle())
            }
            
            
            Button {
                showingEdit.toggle()
            } label: {
                Text("Violation")
            }
            .buttonStyle(FunctionsButtonStyle())
            .disabled(!match.isMatchStarted)
            .sheet(isPresented: $showingEdit) { EditView(match: match) }
            
            if !match.isMatchStarted {
                Button {
                    presentCoinTossAlert.toggle()
                } label: {
                    Text("Coin Toss")
                }
                .buttonStyle(FunctionsButtonStyle())
                .disabled(!match.isMatchSetup)
                .alert("\(randCoinToss)", isPresented: $presentCoinTossAlert) {
                    Button("OK", role: .cancel) {
                    }
                }
            } else {
                Button {
                    showingViolation.toggle()
                } label: {
                    Text("Violation")
                }
                .buttonStyle(FunctionsButtonStyle())
                .sheet(isPresented: $showingViolation) { ViolationView(match: match) }
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
