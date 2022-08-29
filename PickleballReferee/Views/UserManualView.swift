//
//  UserManualView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/28/22.
//

import SwiftUI

struct UserManualView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var sheetManager: SheetManager
    
    var body: some View {
        
        VStack (spacing: 30) {
            
            Text("User Manual")
                .bold()
                .font(.largeTitle)
            
            ZStack {
                Rectangle()
                    .frame(width: CGFloat(660), height: CGFloat(410))
                    .foregroundColor(Constants.CLOUDS)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                VStack (alignment: .leading) {
                    
                    Text("User Manual Information Goes Here")
                        .font(.headline)
                   
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
        }  // Top VStack
    }
}

struct UserManualView_Previews: PreviewProvider {
    static var previews: some View {
        UserManualView()
    }
}
