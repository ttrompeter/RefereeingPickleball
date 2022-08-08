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
    
    var body: some View {
        
        VStack (spacing: 20) {
            Button {
                showingTimeOut.toggle()
            } label: {
                Text("Timeout")
            }
            .buttonStyle(OptionsButtonStyle())
            .sheet(isPresented: $showingTimeOut) { TimeOutView(match: match) }
            
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
            .sheet(isPresented: $showingEdit) { EditView() }
            
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
