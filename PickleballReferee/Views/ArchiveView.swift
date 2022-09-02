//
//  Archive.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/31/22.
//

import RealmSwift
import SwiftUI

struct ArchiveView: View {
    
    @Environment(\.realm) var realm
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var scoresheetManager: ScoresheetManager
    @ObservedResults(Match.self) var matches
    @State private var isShowArhivedMatch = false
    
    var body: some View {
        
        VStack {
            Text("Pickleball Match Archives ")
                .bold()
                .padding()
                .font(.largeTitle)
                .foregroundColor(Constants.DARK_SLATE)
            
            ZStack {
                Rectangle()
                    .frame(width: CGFloat(620), height: CGFloat(570))
                    .foregroundColor(Constants.CLOUDS)
                    .cornerRadius(5)
                    .shadow(radius: 5)
                VStack {
                    Text("Archived Matches")
                        .padding(10)
                        .font(.headline)
                        .foregroundColor(Constants.DARK_SLATE)
                    List {
                        ForEach(matches.sorted(byKeyPath: "matchDate", ascending: false)) { match in
                            if match.isCompleted && !match.isInvalidated {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("\(match.namePlayer1Team1) | \(match.namePlayer1Team2)")
                                            .font(.callout)
                                            .foregroundColor(Constants.MINT_LEAF)
                                        Text("\(match.eventTitle)")
                                            .font(.footnote)
                                            .foregroundColor(Constants.DARK_SLATE)
                                            .lineLimit(1)
                                        Text("\(match.matchDate, style: .date)")
                                            .font(.caption2)
                                            .foregroundColor(Constants.DARK_SLATE)
                                        //NavigationLink(destination: DetailView(trail: trail))
                                        //NavigationLink(destination: MatchView(match: match).environmentObject(scoresheetManager), isActive: $isShowArhivedMatch) { }
                                        NavigationLink("", destination: MatchView(match: match).environmentObject(scoresheetManager))
                                        
//                                        NavigationLink {
//                                            CitiesListView(country: country)
//                                        } label: {
//                                            CountryRowView(country: country, isFocused: _isFocused)
//                                        }
                                    }
                                    //Spacer()
//                                    Button(action: {
//                                        isShowArhivedMatch.toggle()
//                                    }) {
//                                        Text("Open").padding(.horizontal)
//                                            .padding(.vertical,5)
//                                            .background(Constants.MINT_LEAF)
//                                            .cornerRadius(5)
//                                            .foregroundColor(.white)
//                                    }.buttonStyle(.plain) // This focusses tap on the button and not the row
                                }
                            }
                            //.listRowSeparator(.hidden)
                        }
                    }
                    .frame(width: 520, height: 460)
                    .listStyle(.plain)
                }
            }
            Spacer()
            HStack (spacing: 40) {
                Button("Close") {
                    dismiss()
                }
                .buttonStyle(SheetButtonStyle())
            }
            .padding(.vertical, 10)
        }
    }
}
    struct ArchiveView_Previews: PreviewProvider {
        static var previews: some View {
            ArchiveView()
        }
    }
