//
//  StatisticsView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import SwiftUI

struct StatisticAdminView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var screenshotMaker: ScreenshotMaker?
    
    var body: some View {
        
        VStack (spacing: 30) {
            
            Text("Match Statistics ")
                .bold()
                .font(.largeTitle)
            
            ZStack {
                Rectangle()
                    .frame(width: CGFloat(660), height: CGFloat(500))
                    .foregroundColor(Constants.CLOUDS)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                VStack (alignment: .leading) {
                    
                    VStack (alignment: .leading) {
                        HStack (alignment: .top) {
                            
                            VStack (alignment: .leading){
                                HStack (alignment: .top) {
                                    VStack (alignment: .leading) {
                                        Text("Final Score: ")
                                        Divider()
                                        Text("Winning Team: ")
                                        Text("X")
                                            .foregroundColor(Constants.LIGHT_GRAY)
                                        Divider()
                                        Text("Losing Team: ")
                                        Text("X")
                                            .foregroundColor(Constants.LIGHT_GRAY)
                                    }
                                    VStack {
                                        Text("X")
                                            .foregroundColor(Constants.LIGHT_GRAY)
                                        Divider()
                                        Text("11 Points")
                                        Text("X")
                                            .foregroundColor(Constants.LIGHT_GRAY)
                                        Divider()
                                        Text("6 Points")
                                        Text("")
                                    }
                                    VStack {
                                        Text("2 of 3 Games")
                                        Divider()
                                        Text("Jack Smith")
                                        Text("6 Points")
                                        Divider()
                                        Text("Margo Sullivan")
                                        Text("4 Points")
                                    }
                                    VStack {
                                        Text("To 11 Points")
                                        Divider()
                                        Text("Ellen Stephenson")
                                        Text("5 Points")
                                        Divider()
                                        Text("David Danemann")
                                        Text("2 Points")
                                    }
                                }
                                .padding(5)
                                .background(Constants.LIGHT_GRAY)
                                
                                HStack (alignment: .top) {
                                    VStack (alignment: .leading) {
                                        HStack {
                                            Text("Total Match Time: ")
                                            Text("47 min")
                                        }
                                        
                                        HStack {
                                            Text("Information: ")
                                            Text("X")
                                        }
                                        HStack {
                                            Text("More Information: ")
                                            Text("Y")
                                        }
                                    }
                                    .padding()
                                    
                                }
                                .padding(5)
                                .background(Constants.LIGHT_GRAY)
                                
                                HStack (alignment: .top) {
                                    VStack (alignment: .leading) {
                                        HStack {
                                            Text("Spectator count: ")
                                            Text("38")
                                        }
                                        
                                        HStack {
                                            Text("Much MoreInformation: ")
                                            Text("X")
                                        }
                                        HStack {
                                            Text("Even More Information: ")
                                            Text("Y")
                                        }
                                    }
                                    .padding()
                                    VStack {
                                        Text("     ")
                                    }
                                    VStack (alignment: .leading) {
                                        HStack {
                                            Text("Spectator count: ")
                                            Text("38")
                                        }
                                        
                                        HStack {
                                            Text("Much MoreInformation: ")
                                            Text("X")
                                        }
                                        HStack {
                                            Text("Even More Information: ")
                                            Text("Y")
                                        }
                                    }
                                    .padding()
                                    
                                }
                                .padding(5)
                                .background(Constants.LIGHT_GRAY)
                                
                                
                                
                            }
                            .padding(10)
                        }
                    }
                }
                .padding(.horizontal, 40)
            }
            
            
            VStack {
                HStack {
                    Button("Snapshot") {
                        if let screenshotMaker = screenshotMaker {
                            screenshotMaker.screenshot()?.saveToDocuments()
                        }
                    }
                    .buttonStyle(SheetButtonStyle())
                    
                    Button("Close") {
                        dismiss()
                    }
                    .buttonStyle(SheetButtonStyle())
                }
                
            }
            
        }  // Top VStack
        .screenshotView { screenshotMaker in
            self.screenshotMaker = screenshotMaker
        }
    }
}

struct StatisticsAdminView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticAdminView()
    }
}
