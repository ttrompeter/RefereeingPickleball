//
//  EditView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import SwiftUI

struct EditView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var screenshotMaker: ScreenshotMaker?
    
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
                VStack {
                    
                    HStack {
                        Text("Lorem ipsum dolor sit amet. Aut architecto dolor est dolorem doloribus et velit galisum qui nihil omnis et soluta sint sit cupiditate sapiente ab impedit sequi? Et mollitia dolorem aut atque nostrum sed eaque cupiditate? Id perspiciatis dignissimos et consectetur harum nobis quam ea quod blanditiis aut consectetur repellendus. Vel impedit mollitia aut voluptate cupiditate qui reprehenderit ducimus ut reiciendis eaque quo sint nesciunt est ullam ducimus.")
                            .padding()
                            .font(.body)
                            .frame(width: 500, height: 350)
                    }
                    HStack {
                        Text("Confirm Edits\n")
                        
                    }
                    HStack {
                        Button {
                            if let screenshotMaker = screenshotMaker {
                                screenshotMaker.screenshot()?.saveToDocuments()
                            }
                            else { // first approach implementation with UIHostingController
                                //snapshot().saveToDocuments()
                            }
                        } label: {
                            Text("Take screenshot\n")
                                .font(.largeTitle)
                                .foregroundColor(Constants.CRIMSON)
                        }
                    }
                    
                }
            }  // End ZStack
            
            VStack {
                Button("Save") {
                    dismiss()
                }
                .buttonStyle(SheetButtonStyle())
            }
            
        }  // Top VStack
        .screenshotView { screenshotMaker in
            self.screenshotMaker = screenshotMaker
        }
    }
    
} // End Edit View



struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
