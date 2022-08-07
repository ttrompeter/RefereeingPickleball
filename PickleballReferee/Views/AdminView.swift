//
//  MapView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import SwiftUI

struct AdminView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack (spacing: 30) {
            
            Text("Local Map ")
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
                        Text("Local Map Iformaiton Goes Here")
                            .font(.headline)
                        Text("Local Restaurants and Sights")
                       
                    }
                }
                
            }
            
          
            
            VStack {
                Button("Close") {
                    dismiss()
                }
                .buttonStyle(MediumButton())
            }
            
        }  // Top VStack
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        AdminView()
    }
}
