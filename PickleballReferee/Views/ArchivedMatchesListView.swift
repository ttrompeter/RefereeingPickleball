//
//  ArchivedMatchesListView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/31/22.
//

import RealmSwift
import SwiftUI

struct ArchivedMatchesListView: View {
    
    @Environment(\.realm) var realm
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var scoresheetManager: ScoresheetManager
    @ObservedResults(ArchivedMatch.self) var archives
    @State private var isShowArhivedMatch = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Pickleball Match Archives ")
                    .bold()
                    .padding()
                    .font(.largeTitle)
                    .foregroundColor(Constants.DARK_SLATE)
                
                    VStack {
                        if archives.count < 1 {
                            Text("There are no archived Matches")
                                .font(.headline)
                                .foregroundColor(Constants.MINT_LEAF)
                        }
                        List {
                            ForEach(archives.sorted(byKeyPath: "matchDate", ascending: false)) { archivedMatch in
                                if !archivedMatch.isInvalidated {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text("\(archivedMatch.namePlayer1Team1) | \(archivedMatch.namePlayer2Team1)")
                                                .font(.headline)
                                                .foregroundColor(Constants.MINT_LEAF)
                                            Text("\(archivedMatch.namePlayer1Team2) | \(archivedMatch.namePlayer2Team2)")
                                                .font(.headline)
                                                .foregroundColor(Constants.MINT_LEAF)
                                            Text("\(archivedMatch.eventTitle)   Match: \(archivedMatch.matchNumber)")
                                                .font(.callout)
                                                .foregroundColor(Constants.DARK_SLATE)
                                                .lineLimit(1)
                                            Text("\(archivedMatch.matchDate, style: .date)")
                                                .font(.caption)
                                                .foregroundColor(Constants.DARK_SLATE)
                                        }
                                        Spacer()
                                        NavigationLink("",destination: ArchivedMatchView(archivedMatch: archivedMatch)
                                            .environmentObject(scoresheetManager)
//                                            .navigationBarTitle("")
//                                            .navigationBarHidden(true)
//                                            .navigationBarBackButtonHidden(true)
                                        )
                                            .frame(width: 20)
                                        
  
                                        //                                            NavigationLink(destination: DetailView(trail: trail))
                                        //                                            NavigationLink(destination: MatchView(match: match).environmentObject(scoresheetManager), isActive: $isShowArhivedMatch) { }
                                        //                                            NavigationLink(destination: DestinationView()) {
                                        //                                                EmptyView()
                                        //                                            }.buttonStyle(PlainButtonStyle())
//                                        NavigationLink(destination: MatchView(match: match).environmentObject(scoresheetManager)) {
//                                            EmptyView()
//                                        }.buttonStyle(PlainButtonStyle())
//
//                                        Spacer()
//                                        Button(action: {
//                                            isShowArhivedMatch.toggle()
//                                        }) {
//                                            Text("Open").padding(.horizontal)
//                                                .padding(.vertical,5)
//                                                .background(Constants.MINT_LEAF)
//                                                .cornerRadius(5)
//                                                .foregroundColor(.white)
//                                        }.buttonStyle(.plain) // This focusses tap on the button and not the row
                                        
                                    }
                                }
                                //.listRowSeparator(.hidden)
                            }
                        }
                        .padding(.horizontal, 40)
                        .listStyle(.plain)
                    }
//                }  // End ZStack
                Spacer()
                HStack (spacing: 40) {
                    Button("Close") {
                        dismiss()
                    }
                    .buttonStyle(SheetButtonStyle())
                }
                .padding(.vertical, 10)
            } // End Top VStak
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        } // End NavigationView
        .navigationViewStyle(.stack)
    }
}
struct ArchivedMathesListView_Previews: PreviewProvider {
    static var previews: some View {
        ArchivedMatchesListView()
    }
}
