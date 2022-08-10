//
//  SnapshotAdminView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/8/22.
//

import SwiftUI

struct SnapshotAdminView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text("Administer Snapshot Process")
                    .bold()
                    .font(.largeTitle)
            }
            .padding(.vertical, 10)
            
            
            VStack (alignment: .leading) {
                
                ZStack {
                    Rectangle()
                        .frame(width: CGFloat(620), height: CGFloat(550))
                        .foregroundColor(Constants.CLOUDS)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    
                    VStack (alignment: .leading) {
                        
                        HStack (alignment: .top) {
                            VStack {
                                Image("match-1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 380.0, height: 280.0, alignment: .center)
                                    .border(Color.gray, width: 3.0)
                                    .clipped()
                                Text("Show Enlarged Image")
                                    .padding(5)
                                    .font(.title2)
                                    .foregroundColor(Constants.MINT_LEAF)
                            }
                            VStack {
                                Text("\n")
                                HStack {
                                    Image("printer")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .clipped()
                                    Text("Print")
                                }
                                HStack {
                                    Image("mail")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .clipped()
                                    Text("Email")
                                }
                                
                                .padding()
                            }
                        }
                        VStack (alignment: .leading) {
                            HStack (alignment: .top) {
                                Text("\u{2022}")
                                Text("To print the snapshot of the match click the print icon next to the image and select the printer to use.")
                            }
                            Text("")
                            HStack (alignment: .top) {
                                Text("\u{2022}")
                                Text("To email the snapshot of the match click the email icon next to the image and enter the email address to send the image to.")
                            }
                        }
                        .padding(15)
                    }
                    .frame(width: 550, height: 500)
                }
                .padding(.leading, 20)
            }
            VStack {
                Button("Close") {
                    dismiss()
                }
                .buttonStyle(SheetButtonStyle())
            }
            
        }   // End Top VStack
    }
    
}
struct SnapshotAdminView_Previews: PreviewProvider {
    static var previews: some View {
        SnapshotAdminView()
    }
}
