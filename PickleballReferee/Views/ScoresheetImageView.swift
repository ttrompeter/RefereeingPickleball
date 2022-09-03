//
//  ScoresheetImageView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 9/2/22.
//

import RealmSwift
import SwiftUI

struct ScoresheetImageView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var scoresheetManager: ScoresheetManager
    @State private var presentEnlargedImage = false
    @State private var imageToUse = UIImage()
    
    var body: some View {
        
        VStack {
            Image(uiImage: imageToUse)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 360.0, height: 220.0, alignment: .center)
                .border(Color.gray, width: 3.0)
                .clipped()
            Button {
                presentEnlargedImage = true
            } label: {
                Text("Show Enlarged Image")
                    .padding(10)
                    .font(.headline)
                    .foregroundColor(Constants.MINT_LEAF)
            }
            .sheet(isPresented: $presentEnlargedImage) { EnlargedImageView() }

        }  // End Top VStack
        .onAppear {
            $imageToUse.wrappedValue = getStoredImage(imageName: "scoresheet.png")
            $scoresheetManager.isShowScoresheetImage.wrappedValue = true
        }
    }
}

struct ScoresheetImageView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresheetImageView()
    }
}
