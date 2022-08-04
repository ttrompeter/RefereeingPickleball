//
//  SelectGameFirstServerView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/3/22.
//

import RealmSwift
import SwiftUI

struct SelectGameStartingServerView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedRealmObject var match: Match
    
    var body: some View {
        
        VStack (spacing: 30) {
            
            Text("Set First Server For This Game: Game \(match.currentGameNumber)")
                .bold()
                .font(.largeTitle)
            
            ZStack {
                Rectangle()
                    .frame(width: CGFloat(660), height: CGFloat(410))
                    .foregroundColor(Constants.CLOUDS)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                Form {
                VStack {
                    
                    HStack {
                        Text("Match Location: ")
                            .foregroundColor(Constants.DARK_SLATE)
                        TextField("Match Location", text: $match.matchLocation)
                    }
                    HStack {
                        Text("Game Starting Server: ")
                        Picker(selection: $match.games[match.currentGameNumber - 1].selectedGameFirstServer,
                        //Picker(selection: $match.selectedGameFirstServer,
                               label: Text("Starting Server"),
                               content:  {
                            Text("Select Starting Server").tag(0)
                            Text(match.namePlayer1Team1).tag(1)
                            Text(match.namePlayer1Team2).tag(3)
                        })
                        .pickerStyle(MenuPickerStyle())
                        //.fixedSize()
                    }
                    
                    HStack {
                        Text("Match Format:")

                        Picker(selection: $match.selectedMatchFormat,
                               label: Text("Match Format"),
                               content:  {
                            Text("Best 2 out of 3 Games")
                                .tag(2)
                                .foregroundColor(Constants.DARK_SLATE)
                            Text("Best 3 out of 5 Games")
                                .tag(3)
                                .foregroundColor(Constants.DARK_SLATE)
                            Text("Single Game")
                                .tag(1)
                                .foregroundColor(Constants.DARK_SLATE)
                        })
                        .pickerStyle(MenuPickerStyle())

                    }
                    
                    HStack {
                        Text("Game First Server:")

                        Picker(selection: $match.selectedGameStartingServer,
                               label: Text("Server"),
                               content:  {
                            Text("Select Starting Server").tag(0)
                            Text(match.namePlayer1Team1).tag(1)
                            Text(match.namePlayer1Team2).tag(3)
                        })
                        .pickerStyle(MenuPickerStyle())

                    }
                    
                }
                }
            }
            
            VStack {
                HStack (spacing: 40) {
                    Button("Cancel") {
                        // Reset to default or existing values
                        dismiss()
                    }
                    .buttonStyle(SheetButton())
                    
                    Button("Save") {
                        print("")
                        print("Inside Save Button of SelectGameFirstServerView")
                        print("Saving SelectGameFirstServer")
                        print("Starting Server in Game is: \(match.games[match.currentGameNumber - 1].selectedGameFirstServer)")
                        print("Starting Server in Match is: \(match.selectedGameStartingServer)")
                        print("")
                        
                        dismiss()
                    }
                    .buttonStyle(SheetButton())
                    .disabled(match.namePlayer1Team1.isEmpty  || match.namePlayer2Team1.isEmpty || match.namePlayer1Team2.isEmpty || match.namePlayer2Team2.isEmpty)
                }
            }
            
        }  // Top VStack
        
    }
}

struct SelectGameStartingServerView_Previews: PreviewProvider {
    static var previews: some View {
        SelectGameStartingServerView(match: Match())
    }
}
