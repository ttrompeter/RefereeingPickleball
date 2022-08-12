//
//  BottomButtonsView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import RealmSwift
import SwiftUI

struct BottomButtonsView: View {
    
    @ObservedRealmObject var match: Match
    
    @State private var showingHelp = false
    @State private var showingStopwatch = false
    @State private var showingRules = false
    @State private var showingAdmin = false
    
    var body: some View {
        
        VStack (spacing: 20) {
            
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
    }
}

struct BottomButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtonsView(match: Match())
    }
}
