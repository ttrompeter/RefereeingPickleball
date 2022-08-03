//
//  ReferenceView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import SwiftUI

struct ReferenceView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var showingPopover = false
    
    var body: some View {
        
        VStack (spacing: 30) {
            
            Text("Reference Information")
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
                        Text("Reference Information Goes Here")
                            .font(.headline)
                        Text("Introduction")
                       
                    }
                    Button("Show Menu") {
                        showingPopover = true
                    }
                    .popover(isPresented: $showingPopover) {
                        Text("Pickleball referee training")
                            .font(.headline)
                            .padding()
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

struct ReferenceView_Previews: PreviewProvider {
    static var previews: some View {
        ReferenceView()
    }
}
