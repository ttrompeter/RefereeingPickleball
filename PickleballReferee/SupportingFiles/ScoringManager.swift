//
//  ScoringManager.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/4/22.
//


import SwiftUI

struct ScoringManger {
    
}

// *****************************************************************************************
// *****************************************************************************************
// Copy of earlier version of PointScored() method that worked before change to Realm

//

//func PointScored() {
    
    //print("gameScoreTeam1 in pointScored(): \(model.gameScoreTeam1)")
    //print("gameScoreTeam2 in pointScored(): \(model.gameScoreTeam2)")
//    if match.isTeam1Serving {
        // Point scored for Team 1
//        if match.isSecondServer {
            // Second server scored the point
            /*
             model.match.games![model.gameNumber - 1].player2Team1Points += 1
             print("model.player2Team1Points: \(model.player2Team1Points)")
             model.gameScoreTeam1 += 1
             print("model.gameScoreTeam1: \(model.gameScoreTeam1)")
             switch model.gameScoreTeam1 {
             case 1:
             model.point1Game1ImageTm1 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point1Game1ImageTm1 = "squareleftbackslash"
             case 2:
             model.point2Game1ImageTm1 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point2Game1ImageTm1 = "squareleftbackslash"
             case 3:
             model.point3Game1ImageTm1 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point3Game1ImageTm1 = "squareleftbackslash"
             case 4:
             model.point4Game1ImageTm1 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point4Game1ImageTm1 = "squareleftbackslash"
             case 5:
             model.point5Game1ImageTm1 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point5Game1ImageTm1 = "squareleftbackslash"
             case 6:
             model.point6Game1ImageTm1 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point6Game1ImageTm1 = "squareleftbackslash"
             case 7:
             model.point7Game1ImageTm1 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point7Game1ImageTm1 = "squareleftbackslash"
             case 8:
             model.point8Game1ImageTm1 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point8Game1ImageTm1 = "squareleftbackslash"
             case 9:
             model.point9Game1ImageTm1 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point9Game1ImageTm1 = "squareleftbackslash"
             case 10:
             model.point10Game1ImageTm1 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point10Game1ImageTm1 = "squareleftbackslash"
             case 11:
             model.point11Game1ImageTm1 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point11Game1ImageTm1 = "squareleftbackslash"
             case 12:
             model.point12Game1ImageTm1 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point12Game1ImageTm1 = "squareleftbackslash"
             case 13:
             model.point13Game1ImageTm1 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point13Game1ImageTm1 = "squareleftbackslash"
             case 14:
             model.point14Game1ImageTm1 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point14Game1ImageTm1 = "squareleftbackslash"
             case 15:
             model.point15Game1ImageTm1 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point15Game1ImageTm1 = "squareleftbackslash"
             case 16:
             model.point16Game1ImageTm1 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point16Game1ImageTm1 = "squareleftbackslash"
             case 17:
             model.point17Game1ImageTm1 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point17Game1ImageTm1 = "squareleftbackslash"
             case 18:
             model.point18Game1ImageTm1 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point18Game1ImageTm1 = "squareleftbackslash"
             case 19:
             model.point19Game1ImageTm1 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point19Game1ImageTm1 = "squareleftbackslash"
             case 20:
             model.point20Game1ImageTm1 = "squareleftbackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point20Game1ImageTm1 = "squareleftbackslash"
             case 21:
             model.point21Game1ImageTm1 = "squarebackslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point21Game1ImageTm1 = "squarebackslash"
             default:
             model.point1Game1ImageTm1 = "square"
             print("Error setting image in switch statement")
             }
             */
//        } else {
            // First server scored the point
            /*
             model.match.games![model.gameNumber - 1].player1Team1Points += 1
             print("model.player1Team1Points: \(model.player1Team1Points)")
             model.gameScoreTeam1 += 1
             print("model.gameScoreTeam1: \(model.gameScoreTeam1)")
             switch model.gameScoreTeam1 {
             case 1:
             model.point1Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point1Game1ImageTm1 = "squareleftfwdslash"
             case 2:
             model.point2Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point2Game1ImageTm1 = "squareleftfwdslash"
             case 3:
             model.point3Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point3Game1ImageTm1 = "squareleftfwdslash"
             case 4:
             model.point4Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point4Game1ImageTm1 = "squareleftfwdslash"
             case 5:
             model.point5Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point5Game1ImageTm1 = "squareleftfwdslash"
             case 6:
             model.point6Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point6Game1ImageTm1 = "squareleftfwdslash"
             case 7:
             model.point7Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point7Game1ImageTm1 = "squareleftfwdslash"
             case 8:
             model.point8Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point8Game1ImageTm1 = "squareleftfwdslash"
             case 9:
             model.point9Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point9Game1ImageTm1 = "squareleftfwdslash"
             case 10:
             model.point10Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point10Game1ImageTm1 = "squareleftfwdslash"
             case 11:
             model.point11Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point11Game1ImageTm1 = "squareleftfwdslash"
             case 12:
             model.point12Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point12Game1ImageTm1 = "squareleftfwdslash"
             case 13:
             model.point13Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point13Game1ImageTm1 = "squareleftfwdslash"
             case 14:
             model.point14Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point14Game1ImageTm1 = "squareleftfwdslash"
             case 15:
             model.point15Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point15Game1ImageTm1 = "squareleftfwdslash"
             case 16:
             model.point16Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point16Game1ImageTm1 = "squareleftfwdslash"
             case 17:
             model.point17Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point17Game1ImageTm1 = "squareleftfwdslash"
             case 18:
             model.point18Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point18Game1ImageTm1 = "squareleftfwdslash"
             case 19:
             model.point19Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point19Game1ImageTm1 = "squareleftfwdslash"
             case 20:
             model.point20Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point20Game1ImageTm1 = "squareleftfwdslash"
             case 21:
             model.point21Game1ImageTm1 = "squareleftfwdslash"
             model.match.games![model.gameNumber - 1].gameScoreImages!.point21Game1ImageTm1 = "squarefwdslash"
             default:
             model.point1Game1ImageTm1 = "square"
             print("Error setting image in switch statement")
             }
             */
//        }
//    } else if !match.isTeam1Serving {
        /*
         // Point scored for Team 2
         if model.isSecondServer {
         // Second server scored the point
         model.match.games![model.gameNumber - 1].player2Team2Points += 1
         print("model.player2Team2Points: \(model.player2Team2Points)")
         model.gameScoreTeam2 += 1
         print("model.gameScoreTeam2: \(model.gameScoreTeam2)")
         switch model.gameScoreTeam2 {
         case 1:
         model.point1Game1ImageTm2 = "squareleftbackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point1Game1ImageTm2 = "squareleftbackslash"
         case 2:
         model.point2Game1ImageTm2 = "squareleftbackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point2Game1ImageTm2 = "squareleftbackslash"
         case 3:
         model.point3Game1ImageTm2 = "squareleftbackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point3Game1ImageTm2 = "squareleftbackslash"
         case 4:
         model.point4Game1ImageTm2 = "squareleftbackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point4Game1ImageTm2 = "squareleftbackslash"
         case 5:
         model.point5Game1ImageTm2 = "squareleftbackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point5Game1ImageTm2 = "squareleftbackslash"
         case 6:
         model.point6Game1ImageTm2 = "squareleftbackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point6Game1ImageTm2 = "squareleftbackslash"
         case 7:
         model.point7Game1ImageTm2 = "squareleftbackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point7Game1ImageTm2 = "squareleftbackslash"
         case 8:
         model.point8Game1ImageTm2 = "squareleftbackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point8Game1ImageTm2 = "squareleftbackslash"
         case 9:
         model.point9Game1ImageTm2 = "squareleftbackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point9Game1ImageTm2 = "squareleftbackslash"
         case 10:
         model.point10Game1ImageTm2 = "squareleftbackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point10Game1ImageTm2 = "squareleftbackslash"
         case 11:
         model.point11Game1ImageTm2 = "squareleftbackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point11Game1ImageTm2 = "squareleftbackslash"
         case 12:
         model.point12Game1ImageTm2 = "squareleftbackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point12Game1ImageTm2 = "squareleftbackslash"
         case 13:
         model.point13Game1ImageTm2 = "squareleftbackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point13Game1ImageTm2 = "squareleftbackslash"
         case 14:
         model.point14Game1ImageTm2 = "squareleftbackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point14Game1ImageTm2 = "squareleftbackslash"
         case 15:
         model.point15Game1ImageTm2 = "squareleftbackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point15Game1ImageTm2 = "squareleftbackslash"
         case 16:
         model.point16Game1ImageTm2 = "squareleftbackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point16Game1ImageTm2 = "squareleftbackslash"
         case 17:
         model.point17Game1ImageTm2 = "squareleftbackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point17Game1ImageTm2 = "squareleftbackslash"
         case 18:
         model.point18Game1ImageTm2 = "squareleftbackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point18Game1ImageTm2 = "squareleftbackslash"
         case 19:
         model.point19Game1ImageTm2 = "squareleftbackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point19Game1ImageTm2 = "squareleftbackslash"
         case 20:
         model.point20Game1ImageTm2 = "squareleftbackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point20Game1ImageTm2 = "squareleftbackslash"
         case 21:
         model.point21Game1ImageTm2 = "squarebackslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point21Game1ImageTm2 = "squarebackslash"
         default:
         model.point1Game1ImageTm2 = "square"
         print("Error setting image in switch statement")
         }
         */
//    } else {
        /*
         // First server scored the point
         model.match.games![model.gameNumber - 1].player1Team2Points += 1
         print("model.player1Team2Points: \(model.player1Team2Points)")
         model.gameScoreTeam2 += 1
         print("model.gameScoreTeam2: \(model.gameScoreTeam2)")
         switch model.gameScoreTeam2 {
         case 1:
         model.point1Game1ImageTm2 = "squareleftfwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point1Game1ImageTm2 = "squareleftfwdslash"
         case 2:
         model.point2Game1ImageTm2 = "squareleftfwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point2Game1ImageTm2 = "squareleftfwdslash"
         case 3:
         model.point3Game1ImageTm2 = "squareleftfwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point3Game1ImageTm2 = "squareleftfwdslash"
         case 4:
         model.point4Game1ImageTm2 = "squareleftfwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point4Game1ImageTm2 = "squareleftfwdslash"
         case 5:
         model.point5Game1ImageTm2 = "squareleftfwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point5Game1ImageTm2 = "squareleftfwdslash"
         case 6:
         model.point6Game1ImageTm2 = "squareleftfwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point6Game1ImageTm2 = "squareleftfwdslash"
         case 7:
         model.point7Game1ImageTm2 = "squareleftfwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point7Game1ImageTm2 = "squareleftfwdslash"
         case 8:
         model.point8Game1ImageTm2 = "squareleftfwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point8Game1ImageTm2 = "squareleftfwdslash"
         case 9:
         model.point9Game1ImageTm2 = "squareleftfwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point9Game1ImageTm2 = "squareleftfwdslash"
         case 10:
         model.point10Game1ImageTm2 = "squareleftfwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point10Game1ImageTm2 = "squareleftfwdslash"
         case 11:
         model.point11Game1ImageTm2 = "squareleftfwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point11Game1ImageTm2 = "squareleftfwdslash"
         case 12:
         model.point12Game1ImageTm2 = "squareleftfwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point12Game1ImageTm2 = "squareleftfwdslash"
         case 13:
         model.point13Game1ImageTm2 = "squareleftfwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point13Game1ImageTm2 = "squareleftfwdslash"
         case 14:
         model.point14Game1ImageTm2 = "squareleftfwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point14Game1ImageTm2 = "squareleftfwdslash"
         case 15:
         model.point15Game1ImageTm2 = "squareleftfwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point15Game1ImageTm2 = "squareleftfwdslash"
         case 16:
         model.point16Game1ImageTm2 = "squareleftfwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point16Game1ImageTm2 = "squareleftfwdslash"
         case 17:
         model.point17Game1ImageTm2 = "squareleftfwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point17Game1ImageTm2 = "squareleftfwdslash"
         case 18:
         model.point18Game1ImageTm2 = "squareleftfwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point18Game1ImageTm2 = "squareleftfwdslash"
         case 19:
         model.point19Game1ImageTm2 = "squareleftfwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point19Game1ImageTm2 = "squareleftfwdslash"
         case 20:
         model.point20Game1ImageTm2 = "squareleftfwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point20Game1ImageTm2 = "squareleftfwdslash"
         case 21:
         model.point21Game1ImageTm2 = "squarefwdslash"
         model.match.games![model.gameNumber - 1].gameScoreImages!.point21Game1ImageTm2 = "squarefwdslash"
         default:
         model.point1Game1ImageTm2 = "square"
         print("Error setting image in switch statement")
         }
         }
         */
//    }
//    
//}



// *****************************************************************************************
// *****************************************************************************************
