//
//  LargeScoresheetImageView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/19/22.
//

import SwiftUI

struct LargeScoresheetImageView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var sheetManager: SheetManager
    @State private var imageToUse = UIImage()
    
    var body: some View {
        
        VStack (spacing: 30) {
            
            Text("Enlarged Scoresheet Image")
                .bold()
                .font(.largeTitle)
            
            Image(uiImage: imageToUse)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 650.0, height: 550.0, alignment: .center)
                .border(Color.gray, width: 3.0)
                .clipped()
          
            VStack {
                Button("Close") {
                    dismiss()
                }
                .buttonStyle(SheetButtonStyle())
            }
            
        }  // Top VStack
        .onAppear {
            $imageToUse.wrappedValue = getScoresheetImage()
        }
    }
}

struct LargeScoresheetImageView_Previews: PreviewProvider {
    static var previews: some View {
        LargeScoresheetImageView()
    }
}
