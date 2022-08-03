//
//  StatisticsView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import SwiftUI

struct StatisticsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack (spacing: 30) {
            
            Text("Statistics ")
                .bold()
                .font(.largeTitle)
            
            ZStack {
                Rectangle()
                    .frame(width: CGFloat(660), height: CGFloat(410))
                    .foregroundColor(Constants.CLOUDS)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                VStack (alignment: .leading) {
                    Group {
                        Text("Statistics Information Goes Here")
                            .font(.headline)
                        Text("Player Statistics")
                       
                    }
                }
            }
            

            VStack {
                Button("Close") {
                    dismiss()
                }
                .buttonStyle(SheetButton())
            }
            
        }  // Top VStack
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
