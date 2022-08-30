//
//  EditView.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import RealmSwift
import SwiftUI

struct CorrectionView: View {
    
    @EnvironmentObject var scoresheetManager: ScoresheetManager
    @Environment(\.dismiss) var dismiss
    @Environment(\.realm) var realm
    @ObservedRealmObject var match: Match
    
    var body: some View {
     
        
/*
 
 To correct an action -
    point scored
    side out
    timeout
    violation
 
 For Point Scored:
    Who scored point?
    Subtract point from total
    Change scoresheet image back to prior value
 
 For Side Out:
    Which team out
    Subtract count of side outs
    Change scoresheet image back to prior value
 
 for Timeout:
    Which team was charge with timeout
    Subtract count of timeouts
    Change scoresheet image back to prior value
 
 For Violation:
    Which player assigned violation
    Subtract cout of violation
    Undo violation
    Change display back
 
 */
        VStack {
            
            Text("Correction")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Constants.DARK_SLATE)
                .padding(5)
            
            VStack {
                Text("Last Action Data")
                
                Text("?")
                // SideOut Function
                //sideout by player 1 or player 2
                //score at sideout is 0
                //game number is 1
                
                //Point Scored Function
                //player number
                //isSecondServer
                //gameNumber
                
            }  // VStack
            
            Spacer()
            HStack (spacing: 40) {
                Button("Cancel") {
                    // Reset to default or existing values
                    dismiss()
                }
                .buttonStyle(SheetButtonStyle())
                
                Button("Undo") {
                    //print("")
                    //print("Inside Save Button of MatchSetupView")
                    $scoresheetManager.isMatchSetupComplete.wrappedValue = true
                    //print("")
                    dismiss()
                }
                .buttonStyle(SheetButtonStyle())
                .disabled(match.namePlayer1Team1.isEmpty  || match.namePlayer2Team1.isEmpty || match.namePlayer1Team2.isEmpty || match.namePlayer2Team2.isEmpty)
            }
            .padding(.bottom, 20)
        } // Top VStack
        .navigationBarBackButtonHidden(true)
    }
    
    func undoPointScored() {
        
//        let playerScoredPoint = scoresheetManager.lastActionPlayerNumber
//        let pointNumberScored = match.games[match.currentGameArrayIndex].player1Points
//        var playerPointsArray = [Int]()
//        playerPointsArray.append(match.games[match.currentGameArrayIndex].player1Points)
//        playerPointsArray.append(match.games[match.currentGameArrayIndex].player2Points)
//        playerPointsArray.append(match.games[match.currentGameArrayIndex].player3Points)
//        playerPointsArray.append(match.games[match.currentGameArrayIndex].player4Points)
        
    }
    
} // End Edit View



struct CorrectionView_Previews: PreviewProvider {
    static var previews: some View {
        CorrectionView(match: Match())
    }
}
