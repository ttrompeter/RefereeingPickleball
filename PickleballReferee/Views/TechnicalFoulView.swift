//
//  TechnicalFoul.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/21/22.
//

import RealmSwift
import SwiftUI

struct TechnicalFoulView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var sheetManager: SheetManager
    @ObservedRealmObject var match: Match
    
    var body: some View {
        
        VStack (spacing: 30) {
            
            Text("Technical Foul")
                .bold()
                .font(.largeTitle)
            
            ZStack {
                Rectangle()
                    .frame(width: CGFloat(660), height: CGFloat(410))
                    .foregroundColor(Constants.CLOUDS)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                VStack (alignment: .leading) {
    
                    Text("Technical Foul Information Goes Here")
                            .font(.headline)
                    Text("Technical Foul Stuff")
                       
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

struct TechnicalFoulView_Previews: PreviewProvider {
    static var previews: some View {
        TechnicalFoulView(match: Match())
    }
}
