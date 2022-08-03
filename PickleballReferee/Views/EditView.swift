//
//  EditView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import SwiftUI

struct EditView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack (spacing: 30) {
            
            Text("Edit Information")
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
                        Text("Data to edit Goes Here")
                            .font(.headline)
                        Text("Confirm Edits")
                       
                    }
                }
                
                
            }
            
            VStack {
                Button("Save") {
                    dismiss()
                }
                .buttonStyle(MediumButton())
            }
            
        }  // Top VStack
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
