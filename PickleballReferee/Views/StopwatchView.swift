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
                .font(.largeTitle)
            // Create space between objects
            Text(" ")
                .font(.title)
            ZStack {
                Rectangle()
                    .frame(width: CGFloat(500), height: CGFloat(400))
                    .foregroundColor(Constants.CLOUDS)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                VStack {
                    
                    Stopwatch()
                    
                    // Create space between objects
                    Text(" ")
                    
                    VStack {
                        Button("Close") {
                            dismiss()
                        }
                        .buttonStyle(SheetButton())
                    }
                }.padding()
                
                
            }
        }
    }
}

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
    }
}
