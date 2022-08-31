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
    //@ObservedRealmObject var match: Match
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
                    .frame(width: CGFloat(620), height: CGFloat(600))
                    .foregroundColor(Constants.CLOUDS)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                VStack {
                    Text("The following archived matches are available to review (10 Maximum):")
                        .padding()
                        .font(.headline)
                        .foregroundColor(Constants.DARK_SLATE)
                    List() {
                        ForEach(matches.sorted(byKeyPath: "matchDate")) { match in
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("\(match.eventTitle)").font(.body)
                                            .lineLimit(1)
                                        Text("\(match.matchDate, style: .date)").font(.caption)
                                        NavigationLink(destination: MatchView(match: match).environmentObject(scoresheetManager), isActive: $isShowArhivedMatch) { }
                                    }
                                    Spacer()
                                    Button(action: {
                                        isShowArhivedMatch.toggle()
                                    }) {
                                        Text("Open").padding(.horizontal)
                                            .padding(.vertical,5)
                                            .background(Constants.MINT_LEAF)
                                            .cornerRadius(5)
                                            .foregroundColor(.white)
                                    }.buttonStyle(BorderlessButtonStyle()) // This focusses tap on the button and not the row
                            }
                        }
                        //.listRowSeparator(.hidden)
                    }
                    .frame(width: 520)
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
            .padding(.bottom, 20)
        }
    }
}

struct ArchiveView_Previews: PreviewProvider {
    static var previews: some View {
        ArchiveView()
    }
}
