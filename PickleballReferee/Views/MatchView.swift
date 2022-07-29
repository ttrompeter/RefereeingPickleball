//
//  MatchView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import RealmSwift
import SwiftUI

struct MatchView: View {
    
    @ObservedRealmObject var match: Match
    
    @State private var matchDate = Date.now
    
    var body: some View {
        
        VStack {
            Section {
                
                Text("Pickleball Match Scorsheet")
                    .foregroundColor(Constants.DARK_SLATE)
                    .font(.largeTitle)
                if match.isTeam1Serving {
                    Text(match.whoIsServingText)
                } else {
                    Text(match.selectedDoublesPlay)
                }
                
            }
            .padding(.bottom, 10)
            
            // Heading and Setup Section
            Section  {
                
                HStack (alignment: .top, spacing: 40) {
                    Spacer()
                    VStack (alignment: .leading) {
                        
                        HStack {
                            
                            VStack (alignment: .leading) {
                                Text("Event:")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Date:")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Location:")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Game Format:")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Game Number: ")
                                    .foregroundColor(Constants.DARK_SLATE)
                            }
                            
                            VStack (alignment: .leading) {
                                Text("Event Name")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text(matchDate, format: .dateTime.month().day().year())
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Match Location")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("7 points, win by 2 points")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Game Number")
                                    .foregroundColor(Constants.DARK_SLATE)
                            }
                        }
                    }
                    Spacer()
                    VStack (alignment: .leading) {
                        
                        HStack (alignment: .top) {
                            VStack (alignment: .leading) {
                                Text("Match: ")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Court: ")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Referee: ")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Match Format: ")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("First Serve Team: ")
                                    .foregroundColor(Constants.DARK_SLATE)
                            }
                            VStack (alignment: .leading) {
                                Text("Match Number")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Court Number")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Referee Name")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Match Format Description")
                                    .foregroundColor(Constants.DARK_SLATE)
                                Text("Selected Server Team")
                                    .foregroundColor(Constants.DARK_SLATE)
                            }
                        }
                    }
                    Spacer()
                }
            }
            
            // Team Information Section
            Section {
                if match.isTeam1Serving {
                    TeamListingTeam1()
                } else {
                    TeamListingTeam2()
                }
            }
            
            //Scoring for Team 1 Section
            Section {
                if match.isTeam1Serving {
                    //("Team 1 Scoring Section")
                    ScoringSectionTeam1View()
                } else {
                    //Text("Team 2 Scoring Section")
                    ScoringSectionTeam2View()
                }
            }
            
            //Scoring Section
            Section {
                Text("Scoring Section Goes Here")
            }
            .frame(height: 80)
            
            // Initials & Score Recording Section
            Section {
                VStack {
                    //Spacer()
                    HStack {
                        
                        HStack {
                            HStack {
                                Text("Winnng Team Score: ")
                                //Text(model.finalScoreWinningTeam)
                                Text("TBD")
                            }
                            HStack {
                                Text("Initials: ")
                                Text("_______")
                                //TextField("____", text: $model.initialsWinningTeam)
                            }
                        }
                        // Spacing between teams
                        Text("          ||          ")
                        HStack {
                            HStack {
                                Text("Losing Team Score: ")
                                //Text(model.finalScoreLosingTeam)
                                Text("TBD")
                            }
                            HStack {
                                Text("Initials: ")
                                Text("_______")
                                //TextField("____", text: $model.initialsLosingTeam)
                            }
                        }
                        .rotationEffect(.degrees(180))
                    }
                    .font(.subheadline.italic())
                    .foregroundColor(Constants.SLATE_GRAY)
                    .padding()
                    .background(Constants.CLOUDS.opacity(0.6))
                    .padding(.bottom, 10)
                    //Spacer()
                }
            }
            
            // Scoring For Team 2 Section
            Section {
                if match.isTeam1Serving {
                    ScoringSectionTeam2View()
                        .rotationEffect(.degrees(180))
                } else {
                    ScoringSectionTeam1View()
                        .rotationEffect(.degrees(180))
                }
            }
            
            // Team 2 Information
            Section {
                if match.isTeam1Serving {
                    TeamListingTeam2()
                } else {
                    TeamListingTeam1()
                }
            }
            .rotationEffect(.degrees(180))
            
            // Empty text field for spacing
            Text(" ")
                .padding()
            
        }
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView(match: Match())
    }
}
