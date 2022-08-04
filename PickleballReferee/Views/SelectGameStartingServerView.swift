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
                
                VStack {
                    
                    Text("Game Starting Server: ")
                    Picker(selection: $match.games[match.currentGameNumber - 1].selectedGameStartingServer,
                           label: Text("Starting Server"),
                           content:  {
                        Text("Select Starting Server").tag(0)
                        Text(match.namePlayer1Team1).tag(1)
                        Text(match.namePlayer1Team2).tag(3)
                    })
                    .pickerStyle(MenuPickerStyle())
                    .fixedSize()
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
                        //print("Game Starting Server Set (Before): \(match.games[match.currentGameNumber - 1].isGameStartingServerSet)")
                        //$match.games[match.currentGameNumber - 1].isGameStartingServerSet.wrappedValue = true
                        print("Saving SelectGameFirstServer")
                        print("First Server Set: \(match.games[match.currentGameNumber - 1].selectedGameStartingServer)")
                        //print("Game Starting Server Set (After): \(match.games[match.currentGameNumber - 1].isGameStartingServerSet)")
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
