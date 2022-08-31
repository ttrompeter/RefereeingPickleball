//
//  StopwatchView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import SwiftUI

struct StopwatchView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack {
            Text("Stopwatch")
                .bold()
                .padding(.vertical)
                .font(.largeTitle)
                .foregroundColor(Constants.DARK_SLATE)
            ZStack {
                Rectangle()
                    .frame(width: CGFloat(500), height: CGFloat(400))
                    .foregroundColor(Constants.CLOUDS)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                VStack {
                    
                    StopwatchMinSec()
                    Text("")
                    Stopwatch()
                    
                    // Create space between objects
                    Text(" ")
                }.padding()

            }
            
            VStack {
                Button("Close") {
                    dismiss()
                }
                .buttonStyle(SheetButtonStyle())
            }
            
        } // End Top VStack
    }
}

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
    }
}
