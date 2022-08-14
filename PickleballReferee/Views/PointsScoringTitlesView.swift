//
//  PointScoringTitlesView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import SwiftUI

struct PointsScoringTitlesView: View {
    
    @State private var boxDimension = CGFloat(30)
    
    var body: some View {
        
        VStack (spacing: 0) {
            HStack (alignment: .top, spacing: 0) {
                
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 90.0, height: boxDimension, alignment: .leading)
                    .overlay(Text("   Servers"))
                
                
                //Empty space column
                VStack (spacing: 0) {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: boxDimension, height: boxDimension, alignment: .leading)
                }
                
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: (boxDimension * 21), height: boxDimension, alignment: .leading)
                    .overlay(Text("Points Scoring & Sideouts"))
                
                //Empty space column
                VStack (spacing: 0) {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: boxDimension, height: boxDimension, alignment: .leading)
                }
                
                
                // Timeouts
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: (boxDimension * 3), height: boxDimension, alignment: .leading)
                    .overlay(Text("Timeouts"))
            }
        }
    }
}

struct PointScoringTitlesView_Previews: PreviewProvider {
    static var previews: some View {
        PointsScoringTitlesView()
    }
}
