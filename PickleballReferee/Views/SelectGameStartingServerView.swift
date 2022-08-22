//
//  SelectGameFirstServerView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/3/22.
//

import RealmSwift
import SwiftUI

struct SelectGameStartingServerView: View {
    
    // TODO: - This View is not being used and should be deleted.
    // This functionality is handled in the MatchView with the SelectStartingServer
    @Environment(\.dismiss) var dismiss
    @ObservedRealmObject var match: Match
    @EnvironmentObject var sheetManager: SheetManager
    
    var body: some View {
        
        VStack (spacing: 30) {
            
            Text("Set First Server For This Game")
                .bold()
                .font(.largeTitle)
//            Text("Game \(match.currentGameNumber)")
//                .font(.title)
//            
//            ZStack {
//                Rectangle()
//                    .frame(width: CGFloat(660), height: CGFloat(410))
//                    .foregroundColor(Constants.CLOUDS)
//                    .cornerRadius(10)
//                    .shadow(radius: 5)
//                
//                VStack {
//                    Form {
//                        
//                        Section(header: Text("SERVER INFORMATION").bold().font(.headline)) {
//                            
//                            VStack (alignment: .leading) {
//                                
//                                HStack {
//                                    Text("Team 1 First Server: ")
//                                    Picker(selection: $match.games[match.currentGameNumber - 1].selectedFirstServerTeam1,
//                                           //Picker(selection: $match.selectedGameFirstServer,
//                                           label: Text("First Server"),
//                                           content:  {
//                                        Text("Select First Server").tag(0)
//                                        Text(match.namePlayer1Team1).tag(1)
//                                        Text(match.namePlayer2Team1).tag(2)
//                                    })
//                                    .pickerStyle(MenuPickerStyle())
//                                    .fixedSize()
//                                }
//                                
//                                HStack {
//                                    Text("Team 2 First Server: ")
//                                    Picker(selection: $match.games[match.currentGameNumber - 1].selectedFirstServerTeam2,
//                                           //Picker(selection: $match.selectedGameFirstServer,
//                                           label: Text("First Server"),
//                                           content:  {
//                                        Text("Select First Server").tag(0)
//                                        Text(match.namePlayer1Team2).tag(3)
//                                        Text(match.namePlayer2Team2).tag(4)
//                                    })
//                                    .pickerStyle(MenuPickerStyle())
//                                    .fixedSize()
//                                }
//                                HStack {
//                                    Text("Game Starting Server: ")
//                                    Picker(selection: $match.selectedGameStartingServer,
//                                           label: Text("First Server"),
//                                           content:  {
//                                        Text("Select Starting Server").tag(0)
//                                        Text(match.namePlayer1Team1).tag(1)
//                                        Text(match.namePlayer2Team1).tag(2)
//                                        Text(match.namePlayer1Team2).tag(3)
//                                        Text(match.namePlayer2Team2).tag(4)
//                                    })
//                                    .pickerStyle(MenuPickerStyle())
//                                    .fixedSize()
//                                }
//                            }
//                        }
//                        
//                        Section(header: Text("COURT ALIGNMENT INFORMATION").bold().font(.headline)) {
//                            
//                            HStack {
//                                Text("Game Starting Court Side:")
//                                
//                                Picker(selection: $match.isServingLeftSide,
//                                       label: Text("Side"),
//                                       content:  {
//                                    Text("Select Court Side").tag(0)
//                                    Text("Left").tag(true)
//                                    Text("Right").tag(false)
//                                })
//                                .pickerStyle(MenuPickerStyle())
//                                
//                            }
//                        }
//                    }
//                }
//                
//            }
//            
//            VStack {
//                HStack (spacing: 40) {
//                    Button("Cancel") {
//                        // Reset to default or existing values
//                        dismiss()
//                    }
//                    .buttonStyle(SheetButtonStyle())
//                    
//                    Button("Save") {
//                        print("")
//                        print("Inside Save Button of SelectGameFirstServerView")
//                        print("Saving SelectGameFirstServer")
//                        print("Starting Server in Match is: \(match.servingPlayerNumber)")
//                        print("")
//                        
//                        dismiss()
//                    }
//                    .buttonStyle(SheetButtonStyle())
//                    .disabled(match.namePlayer1Team1.isEmpty  || match.namePlayer2Team1.isEmpty || match.namePlayer1Team2.isEmpty || match.namePlayer2Team2.isEmpty)
//                }
//            }
//            Spacer()
            
        }  // Top VStack
        .padding()
    }
}

struct SelectGameStartingServerView_Previews: PreviewProvider {
    static var previews: some View {
        SelectGameStartingServerView(match: Match())
    }
}
