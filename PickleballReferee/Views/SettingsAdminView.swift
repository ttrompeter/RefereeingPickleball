//
//  SettingsView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import SwiftUI

struct SettingsAdminView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack (spacing: 30) {
            
            Text("Settings")
                .bold()
                .font(.largeTitle)
                .foregroundColor(Constants.DARK_SLATE)
            
            ZStack {
                Rectangle()
                    .frame(width: CGFloat(660), height: CGFloat(410))
                    .foregroundColor(Constants.CLOUDS)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                VStack (alignment: .leading) {
                    Group {
                        Text("Settings Information Goes Here")
                            .font(.headline)
                        Text("Pickleball Referee Application Settings")
                       
                    }
                }
                
                
            }
            
          
            
            VStack {
                Button("Close") {
                    dismiss()
                }
                .buttonStyle(SheetButtonStyle())
            }
            
        }  // Top VStack
    }
}

struct SettingsAdminView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsAdminView()
    }
}
