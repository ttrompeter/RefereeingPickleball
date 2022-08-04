//
//  MatchSetupView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//
import RealmSwift
import SwiftUI

struct MatchSetupView: View {
    
    @Environment(\.realm) var realm
    @Environment(\.dismiss) var dismiss
    @ObservedRealmObject var match: Match
    @State private var isShowingPlayerNamesAlert = false
    
    
    // Closed range for DatePicker for Match Date
    var closedRange: ClosedRange<Date> {
        let today = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
        let thirtyDaysAhead = Calendar.current.date(byAdding: .day, value: +30, to: Date())!
        return today...thirtyDaysAhead
    }
    
    
    var body: some View {
        
        VStack {
            
            Text("Match Setup Information")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Constants.DARK_SLATE)
                .padding(5)
            
            VStack {
                
                Form {
                    
                    Section(header: Text("Match Information").bold().font(.headline)) {
                        VStack (alignment: .leading) {
                            HStack {
                                Text("Event Title: ")
                                    .foregroundColor(Constants.DARK_SLATE)
                                TextField("Title of Event", text: $match.eventTitle)
                            }
                            HStack {
                                Text("Match Location: ")
                                    .foregroundColor(Constants.DARK_SLATE)
                                TextField("Match Location", text: $match.matchLocation)
                            }
                            
                            HStack (alignment: .top) {
                                
                                VStack (alignment: .leading) {
                                    HStack {
                                        Text("Match Number: ")
                                            .foregroundColor(Constants.DARK_SLATE)
                                        TextField("Match Number", text: $match.matchNumber)
                                    }
                                }
                                
                                VStack (alignment: .leading) {
                                    HStack {
                                        Text("Court Number: ")
                                            .foregroundColor(Constants.DARK_SLATE)
                                        TextField("Court Number", text: $match.courtNumber)
                                    }
                                }
                            }
    
                            HStack {
                                Text("Play Type: ")
                                Picker(selection: $match.selectedDoublesPlay,
                                       label: Text(" "),
                                       content:  {
                                    Text("Doubles").tag(2)
                                    Text("Singles").tag(1)
                                })
                                .pickerStyle(SegmentedPickerStyle())
                                .fixedSize()
                                .onAppear {
                                    UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1.0) // Silver
                                    UISegmentedControl.appearance().backgroundColor = UIColor(red: 236/255, green: 240/255, blue: 241/255, alpha: 1.0) // Clouds
                                    UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(red: 45/255, green: 52/255, blue: 54/255, alpha: 1.0)], for: .selected) // Dracula Orchid
                                    UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(red: 47/255, green: 79/255, blue: 79/255, alpha: 1.0)], for: .normal) // Dark Slate

                                    // SILVER = Color(red: 189/255, green: 195/255, blue: 199/255)
                                    // DARK_SLATE = Color(red: 47/255, green: 79/255, blue: 79/255)
                                    // CLOUDS = Color(red: 236/255, green: 240/255, blue: 241/255)
                                    // SLATE_GRAY = Color(red: 112/255, green: 128/255, blue: 144/255)
                                    // ASBESTOS         rgba(127, 140, 141,1.0)
                                    // DRACULA ORCHID   rgba(45, 52, 54,1.0)

                                }
                            }
                            
                            HStack {
                                Text("Match Format: ")
                                Picker(selection: $match.selectedMatchFormat,
                                       label: Text(" "),
                                       content:  {
                                    Text("2 out of 3 Games").tag(2)
                                    Text("3 out of 5 Games").tag(3)
                                    Text("Single Game").tag(1)
                                })
                                .pickerStyle(SegmentedPickerStyle())
                                .fixedSize()
                                .onAppear {
                                    UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1.0) // Silver
                                    UISegmentedControl.appearance().backgroundColor = UIColor(red: 236/255, green: 240/255, blue: 241/255, alpha: 1.0) // Clouds
                                    UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(red: 45/255, green: 52/255, blue: 54/255, alpha: 1.0)], for: .selected) // Dracula Orchid
                                    UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(red: 47/255, green: 79/255, blue: 79/255, alpha: 1.0)], for: .normal) // Dark Slate
                                }
                            }
                            
                            HStack {
                                Text("Points To Win: ")
                                Picker(selection: $match.selectedGameFormat,
                                       label: Text(" "),
                                       content:  {
                                    Text("7 Points").tag(7)
                                    Text("11 Points").tag(11)
                                    Text("15 Points").tag(15)
                                    Text("21 Points").tag(21)
                                })
                                .pickerStyle(SegmentedPickerStyle())
                                .fixedSize()
                                .onAppear {
                                    UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1.0) // Silver
                                    UISegmentedControl.appearance().backgroundColor = UIColor(red: 236/255, green: 240/255, blue: 241/255, alpha: 1.0) // Clouds
                                    UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(red: 45/255, green: 52/255, blue: 54/255, alpha: 1.0)], for: .selected) // Dracula Orchid
                                    UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(red: 47/255, green: 79/255, blue: 79/255, alpha: 1.0)], for: .normal) // Dark Slate
                                }
                                Text("Win By 2 Points")
                                    .font(.caption).italic()
                            }
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            HStack {
                                
                                HStack {
                                    Text("Notes : ")
                                        .foregroundColor(Constants.DARK_SLATE)
                                    TextField("Notes", text: $match.matchNotes)
                                        .foregroundColor(Constants.DARK_SLATE)
                                }
                            }
                            
                        }  // Top VStack in Section
                    } // Section - Match Information
                    
                    
                    Section (header: Text("Player Information").bold().font(.headline)) {
                        
                        // TODO: - Change display based on doubles or singles
                        HStack {
                            VStack {
                                Text("Team 1")
                                    .font(.headline)
                                VStack (alignment: .leading) {
                                    Text("This is startiing server for Team 1")
                                        .font(.caption).italic()
                                        .foregroundColor(Constants.CRIMSON)
                                    HStack {
                                        Text("Player1 Name")
                                            .foregroundColor(Constants.CRIMSON)
                                        TextField("Player1 Team1 Name:", text: $match.namePlayer1Team1)
                                    }
                                    HStack {
                                        Text("Player1 Identifiers")
                                        TextField("Player1 Team1 Identifiers:", text: $match.player1Team1Identifiers)
                                    }
                                }
                                .padding()
                                .background(Constants.CLOUDS)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                VStack {
                                    HStack {
                                        Text("Player2 Name")
                                        TextField("Player2 Team1 Name:", text: $match.namePlayer2Team1)
                                    }
                                    HStack {
                                        Text("Player2 Identifiers")
                                        TextField("Player2 Team1 Identifiers:", text: $match.player2Team1Identifiers)
                                    }
                                }
                                .padding()
                                .background(Constants.CLOUDS)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            
                            VStack {
                                Text("Team 2")
                                    .font(.headline)
                                VStack (alignment: .leading) {
                                    Text("This is startiing server for Team 2")
                                        .font(.caption).italic()
                                        .foregroundColor(Constants.CRIMSON)
                                    HStack {
                                        Text("Player1 Name")
                                            .foregroundColor(Constants.CRIMSON)
                                        TextField("Player1 Team2 Name:", text: $match.namePlayer1Team2)
                                    }
                                    HStack {
                                        Text("Player1 Identifiers")
                                        TextField("Player1 Team2 Identifiers:", text: $match.player1Team2Identifiers)
                                    }
                                }
                                .padding()
                                .background(Constants.CLOUDS)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                VStack {
                                    HStack {
                                        Text("Player2 Name")
                                        TextField("Player2 Team2 Name:", text: $match.namePlayer2Team2)
                                    }
                                    HStack {
                                        Text("Player2 Identifiers")
                                        TextField("Player2 Team2 Identifiers:", text: $match.player2Team2Identifiers)
                                    }
                                }
                                .padding()
                                .background(Constants.CLOUDS)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            
                        }
                        
//                        // Removed since usually don't know starting server until after setup is done
//                        // Also don't want to have this same functionality in 2 places
//                        // It is available on the MatchView page after setup is completed
//
//                        VStack {
//                            Text("Game Starting Server Can Be Entered later If Not Known")
//                                .font(.title3)
//                                .foregroundColor(Constants.MINT_LEAF)
//                            HStack {
//                                Spacer()
//                                Text("Game Starting Server: ")
//                                Picker(selection: $match.selectedGameStartingServer,
//                                       label: Text("Starting Server"),
//                                       content:  {
//                                    Text("Select Starting Server").tag(0)
//                                    Text(match.namePlayer1Team1).tag(1)
//                                    Text(match.namePlayer1Team2).tag(3)
//                                })
//                                .pickerStyle(MenuPickerStyle())
//                                .fixedSize()
//                                Spacer()
//                            }
//                        }
                            
                        
                    } // Section - Player Information
                    
                    Section (header: Text("Referee Information").bold().font(.headline)) {
                        HStack {
                            Text("Referee Name: ")
                            TextField("Referee Name:", text: $match.games[0].refereeName)  // $match.games[0].refereeName
                            Text("Asst Referee Name: ")
                            TextField("Asst Referee Name:", text: $match.games[0].asstRefereeName)
                        }
                        HStack {
                            Text("Line Judge 1 Name: ")
                            TextField("Line Judge 1 Name:", text: $match.games[0].lineJudge1Name)
                            Text("Line Judge 2 Name: ")
                            TextField("Line Judge 2 Name:", text: $match.games[0].lineJudge2Name)
                        }
                        HStack {
                            Text("Line Judge 3 Name: ")
                            TextField("LineJudge 3 Name:", text: $match.games[0].lineJudge3Name)
                            Text("Line Judge 4 Name: ")
                            TextField("Line Judge 4 Name: ", text: $match.games[0].lineJudge4Name)
                        }
                        HStack {
                            Text("Trainee Name: ")
                            TextField("Trainee Name:", text: $match.games[0].traineeName)
                            Text("Remarks: ")
                            TextField("Remareks: ", text: $match.matchRefereeRemarks)
                        }
                    }
                    
                } // FORM
            }  // VStack
            
            VStack {
                HStack (spacing: 40) {
                    Button("Cancel") {
                        // Reset to default or existing values
                        dismiss()
                    }
                    .buttonStyle(SheetButton())
                    
                    Button("Save") {
                        print("")
                        print("Inside Save Button of MatchSetupView")
                        $match.isMatchSetup.wrappedValue = true
                        print("")
                        dismiss()
                    }
                    .buttonStyle(SheetButton())
                    .disabled(match.namePlayer1Team1.isEmpty  || match.namePlayer2Team1.isEmpty || match.namePlayer1Team2.isEmpty || match.namePlayer2Team2.isEmpty)
                }
            }
            // Empaty Text view to add space below buttons
            Text("")
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    //    func validateMatchSetup() -> Bool{
    //
    //        if match.namePlayer1Team1.isEmpty  || match.namePlayer2Team1.isEmpty || match.namePlayer1Team2.isEmpty || match.namePlayer2Team2.isEmpty {
    //
    //
    //
    //            print("One or more player names are empty")
    //            return false
    //        }
    //        return true
    //    }
    
}

struct MatchSetupView_Previews: PreviewProvider {
    static var previews: some View {
        
        MatchSetupView(match: Match())
    }
}










//                        model.match.games![model.gameNumber - 1].gameNumber = model.gameNumber
//                        model.match.games![model.gameNumber - 1].isGameCompleted = model.isGameCompleted
//                        model.match.games![model.gameNumber - 1].courtNumber = model.courtNumber
//                        model.match.games![model.gameNumber - 1].serverNumber = model.serverNumber
//                        model.match.games![model.gameNumber - 1].servingTeam = model.servingTeam
//                        model.match.games![model.gameNumber - 1].selectedFirstServeTeam = model.selectedFirstServeTeam
//                        model.match.games![model.gameNumber - 1].refereeName = model.refereeName
//                        model.match.games![model.gameNumber - 1].asstRefereeName = model.asstRefereeName
//                        model.match.games![model.gameNumber - 1].traineeRefereeName = model.traineeRefereeName
//                        model.match.games![model.gameNumber - 1].gameNumber = model.gameNumber
//                        model.match.games![model.gameNumber - 1].player1Team1Points = model.player1Team1Points
//                        model.match.games![model.gameNumber - 1].player2Team1Points = model.player2Team1Points
//                        model.match.games![model.gameNumber - 1].player1Team2Points = model.player1Team2Points
//                        model.match.games![model.gameNumber - 1].player2Team2Points = model.player2Team2Points
//                        model.match.games![model.gameNumber - 1].whoIsServingText = model.whoIsServingText
//                        model.match.games![model.gameNumber - 1].timeOutsTeam1 = model.timeOutsTeam1
//                        model.match.games![model.gameNumber - 1].timeOutsTeam2 = model.timeOutsTeam2
//
//                        model.match.event?.eventTitle = model.eventTitle
//                        model.match.event?.eventDirector = model.eventDirector
//                        model.match.event?.eventHost = model.eventHost
//
//                        model.match.isSecondServer = model.isSecondServer
//                        model.match.isTeam1Serving = model.isTeam1Serving
//                        model.match.matchDate = model.matchDate
//                        model.match.matchLocation = model.matchLocation
//                        model.match.matchNumber = model.matchNumber
//                        model.match.matchNotes = model.matchNotes
//                        model.match.matchWinner = model.matchWinner
//                        model.match.matchStartingServer = model.match.matchStartingServer
//                        model.match.namePlayer1Team1 = model.namePlayer1Team1
//                        model.match.namePlayer2Team1 = model.namePlayer2Team1
//                        model.match.namePlayer1Team2 = model.namePlayer1Team2
//                        model.match.namePlayer2Team2 = model.namePlayer2Team2
//                        model.match.player1Team1Identifiers = model.player1Team1Identifiers
//                        model.match.player2Team1Identifiers = model.player2Team1Identifiers
//                        model.match.player1Team2Identifiers = model.player1Team2Identifiers
//                        model.match.player2Team2Identifiers = model.player2Team2Identifiers
//
//                        model.match.selectedFirstServeTeam = model.selectedFirstServeTeam
//                        model.match.selectedGameFormat = model.selectedGameFormat
//                        model.match.selectedMatchFormat = model.selectedMatchFormat
//                        model.match.selectedDoublesPlay = model.selectedDoublesPlay
//                        model.match.whoIsServingText = model.whoIsServingText
//
//
//                        let existingMatch = model.match
//                        print("existingMatch: \(existingMatch)")
//                        let existingGames = model.match.games
//                        print("existingGames: \(String(describing: existingGames))")
//                        let existingEvent = model.match.event
//                        print("existingEvent: \(String(describing: existingEvent))")
//                        let existingGameScoreImages = model.match.games![0].gameScoreImages
//                        print("existingGameScoreImages: \(String(describing: existingGameScoreImages))")
//
//                        model.save()
//                        print("Match after save: \(model.match)")
//                        print("gamesAfterSave: \(String(describing: model.match.games))")
