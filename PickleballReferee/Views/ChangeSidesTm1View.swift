//
//  ChangeSidesTm1View.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/26/22.
//

import RealmSwift
import SwiftUI

struct ChangeSidesTm1View: View {
    
    @ObservedRealmObject var match: Match
    
    var body: some View {
        VStack(spacing: 0) {
            HStack (alignment: .top, spacing: 0) {
                
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 120.0, height: Constants.BOX_DIMENSION, alignment: .leading)
                
                //Empty space column
                VStack (spacing: 0) {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION, alignment: .leading)
                }
                
                Group {
                    Image(Constants.BOX_BLANK)  //1
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image(Constants.BOX_BLANK)  //2
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    if match.selectedGameFormat == 7 {
                        Image(Constants.TRIANGLE)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    } else {
                        Image(Constants.BOX_BLANK)  //3
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    }
                    
                    Image(Constants.BOX_BLANK)  //4
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image(Constants.BOX_BLANK)  //5
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    if match.selectedGameFormat == 11 {
                        Image(Constants.TRIANGLE)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    } else {
                        Image(Constants.BOX_BLANK)  //6
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    }
                    
                    Image(Constants.BOX_BLANK)  //7
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    if match.selectedGameFormat == 15 {
                        Image(Constants.TRIANGLE)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    } else {
                        Image(Constants.BOX_BLANK)  //8
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    }
                    
                    Image(Constants.BOX_BLANK)  //9
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                }
                Group {
                    Image(Constants.BOX_BLANK)  //10
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    if match.selectedGameFormat == 21 {
                        Image(Constants.TRIANGLE)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    } else {
                        Image(Constants.BOX_BLANK)  //11
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    }
                    
                    Image(Constants.BOX_BLANK)  //12
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image(Constants.BOX_BLANK)  //13
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image(Constants.BOX_BLANK)  //14
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image(Constants.BOX_BLANK)  //15
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image(Constants.BOX_BLANK)  //16
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image(Constants.BOX_BLANK)  //17
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image(Constants.BOX_BLANK)  //18
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image(Constants.BOX_BLANK)  //19
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                }
                
                Group {
                    Image(Constants.BOX_BLANK)  //20
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image(Constants.BOX_BLANK)  //21
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                }
                //Empty space column
                VStack (spacing: 0) {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION, alignment: .leading)
                }
                // Timeouts
                ZStack {
                    
                    Image(Constants.BOX_BLANK)
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    Image("yellowcard")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                ZStack {
                    
                    Image(Constants.BOX_BLANK)
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    Image("penaltyflag")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                ZStack {
                    
                    Image(Constants.BOX_BLANK)
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    Image("red_yellow_cards")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
        }
    }
}

//struct ChangeSidesTm1View_Previews: PreviewProvider {
//    static var previews: some View {
//        ChangeSidesTm1View()
//    }
//}
