//
//  BottomButtonsView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import SwiftUI

struct BottomButtonsView: View {
    
    @State private var showingHelp = false
    @State private var showingEdit = false
    @State private var showingStatistics = false
    @State private var showingSettings = false
    @State private var showingMap = false
    
    var body: some View {
        
        VStack (spacing: 20) {
            
            Button {
                showingHelp.toggle()
            } label: {
                Text("Help")
            }
            .buttonStyle(OptionsButton())
            .sheet(isPresented: $showingHelp) { HelpView() }
            
            Button {
                showingEdit.toggle()
            } label: {
                Text("Edit")
            }
            .buttonStyle(OptionsButton())
            .sheet(isPresented: $showingEdit) { EditView() }
            
            Button {
                showingStatistics.toggle()
            } label: {
                Text("Statistics")
            }
            .buttonStyle(OptionsButton())
            .sheet(isPresented: $showingStatistics) { StatisticsView() }
            
            Button {
                showingSettings.toggle()
            } label: {
                Text("Settings")
            }
            .buttonStyle(OptionsButton())
            .sheet(isPresented: $showingSettings) { SettingsView() }
            
            Button {
                showingMap.toggle()
            } label: {
                Text("Map")
            }
            .buttonStyle(OptionsButton())
            .sheet(isPresented: $showingMap) { AdminView() }
            
        }
        .padding(10)
        .background(Constants.CLOUDS)
    }
}

struct BottomButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtonsView()
    }
}
