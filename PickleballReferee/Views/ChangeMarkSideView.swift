//
//  ChangeMarkSideView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/2/22.
//

import RealmSwift
import SwiftUI

struct ChangeMarkSideView: View {
    
    @ObservedRealmObject var match: Match
    @State private var gameScoreImages = GameScoreImages()
    
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
                    Image("")
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image("")
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image("")
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image("")
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image("")
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    if match.selectedGameFormat == 11 {
                        Image(systemName: "arrowtriangle.up")
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    } else {
                        Image("")
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    }
                    
                    Image("")
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    if match.selectedGameFormat == 15 {
                        Image(systemName: "arrowtriangle.up")
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    } else {
                        Image("")
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    }
                    
                    Image("")
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                }
                Group {
                    Image("")
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    if match.selectedGameFormat == 21 {
                        Image(systemName: "arrowtriangle.up")
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    } else {
                        Image("")
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    }
                    
                    Image("")
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image("")
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image("")
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image("")
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image("")
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image("")
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image("")
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image("")
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                }
                
                Group {
                    Image("")
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    
                    Image("")
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
                
                Image("")
                    .resizable()
                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                
                Image("")
                    .resizable()
                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                
                Image("")
                    .resizable()
                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
            }
        }
    }
}

struct ChangeMarkSideView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeMarkSideView(match: Match())
    }
}
