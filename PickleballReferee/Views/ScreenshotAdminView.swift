//
//  ScreenshotAdminView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/8/22.
//

import MessageUI
import RealmSwift
import SwiftUI
import UIKit

struct ScreenshotAdminView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedRealmObject var match: Match
    
    // // TODO: - Fix recipients for email instead of hardcoded value
    @State private var mailData = ComposeMailData(subject: "Pickleball Match Report",
        recipients: ["ttrompeter@zoho.com"],
        message: "Match report sent from Pickleball Referee. Completed score sheet is attached.",
        attachments:  [])  // Empty array of attachments until this is working for matc hsnapshot image
    
        // imageView: UIImageView
        // let imageData: NSData = UIImagePNGRepresentation(imageView.image)!
        // mail.addAttachmentData(imageData, mimeType: "image/png", fileName: "imageName.png")
        //      addAttachmentData($0.data, mimeType: $0.mimeType, fileName: $0.fileName)
        //[AttachmentData(data: UIImagePNGRepresentation(imageView.image)!,
        //mimeType: "image/png",
        //fileName: "FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].match.png")]
    
    @State private var showMailView = false
    @State private var showPrintView = false
    @State private var imageToUse = UIImage()
    @State private var isScorsheetScreenshotUnavailable = true
    @State private var presentingNoScoresheetScreenshotAvailable = false
    @State private var presentEnlargedImage = false
    

    private var url: URL {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return paths[0].appendingPathComponent("scoresheet.png")
    }
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text("Administer Screenshot Process")
                    .bold()
                    .font(.largeTitle)
            }
            .padding(.vertical, 10)
            
            
            VStack (alignment: .leading) {
                
                ZStack {
                    Rectangle()
                        .frame(width: CGFloat(620), height: CGFloat(550))
                        .foregroundColor(Constants.CLOUDS)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    
                    VStack (alignment: .leading) {
                        
                        HStack (alignment: .top) {
                            VStack {
                                
                                Image(uiImage: imageToUse)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 380.0, height: 280.0, alignment: .center)
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
                                .sheet(isPresented: $presentEnlargedImage) { LargeScoresheetImageView() }
                                
                            }
                            VStack {
                                Text("\n")
                                HStack {
                                    Button(action: {
                                        showPrintView = true
                                       
                                        }) {
                                            Image("printer")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .clipped()
                                        }
                                        .sheet(isPresented: $showPrintView) {
                                            ActivityViewController(activityItems: [imageToUse])
                                        }
                                    Text("Print")
                                }
                                HStack {
                                    Button(action: {
                                        //$mailData.recipients[0] = [match.emailAddressForScoresheetSnaphot]
                                            showMailView = true
                                        }) {
                                            Image("mail")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .clipped()
                                        }
                                        .disabled(!MailView.canSendMail)
                                        .sheet(isPresented: $showMailView) {
                                          MailView(data: $mailData) { result in
                                            print(result)
                                           }
                                        }
                                    Text("Email")
                                }
                                .padding()
                                
                            }
                        }
                        VStack (alignment: .leading) {
                            HStack (alignment: .top) {
                                Text("\u{2022}")
                                Text("To print the screenshot of the match click the print icon next to the image and select the printer to use. You MUST HAVE FIRST CREATED THE SCREENSHOT using the 'Take Screenshot' link on the main Match Scorsheet page located under the Score.")
                            }
                            Text("")
                            HStack (alignment: .top) {
                                Text("\u{2022}")
                                Text("To email the screenshot of the match click the email icon next to the image and enter the email address to send the image to. If you did not set up the email address to send the email to in 'Match Setup', you can add one or more addressees in the email popup before you send it.")
                            }
                        }
                        .padding(15)
                    }
                    .frame(width: 550, height: 500)
                }
                .padding(.leading, 20)
            }
            .alert("No Scoresheet Screenshot is available.\nTake Screenshot on Match Scorsheet Page.", isPresented: $presentingNoScoresheetScreenshotAvailable, actions: {})
            VStack {
                Button("Close") {
                    dismiss()
                }
                .buttonStyle(SheetButtonStyle())
            }
            
        }   // End Top VStack
        .onAppear {
            //$imageToUse.wrappedValue = getScoresheetImage()
            
            let imageUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("scoresheet.png")
            let matchUIImage = UIImage(contentsOfFile: imageUrl.path)
            if matchUIImage == nil {
                print("Error: the scoresheet image is missing. Using sample scoresheet")
                let sampleImageUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("sample_scoresheet.png")
                let sampleUIImage = UIImage(contentsOfFile: sampleImageUrl.path)
                $imageToUse.wrappedValue = sampleUIImage!
                $presentingNoScoresheetScreenshotAvailable.wrappedValue = true
                $isScorsheetScreenshotUnavailable.wrappedValue = true
            } else {
                $imageToUse.wrappedValue = matchUIImage!
                $isScorsheetScreenshotUnavailable.wrappedValue = false
            }
        }
    }
    
}
struct ScreenshotAdminView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotAdminView(match: Match())
    }
}



