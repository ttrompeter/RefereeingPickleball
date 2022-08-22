//
//  WarningView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/21/22.
//

import RealmSwift
import SwiftUI

struct WarningView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var sheetManager: SheetManager
    @ObservedRealmObject var match: Match
    
    var body: some View {
        
        VStack (spacing: 30) {
            
            Text("Warning")
                .bold()
                .font(.largeTitle)
            
            ZStack {
                Rectangle()
                    .frame(width: CGFloat(660), height: CGFloat(410))
                    .foregroundColor(Constants.CLOUDS)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                VStack (alignment: .leading) {
    
                    Text("Warning Information Goes Here")
                            .font(.headline)
                    Text("Warning Stuff")
                       
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

struct WarningView_Previews: PreviewProvider {
    static var previews: some View {
        WarningView(match: Match())
    }
}
