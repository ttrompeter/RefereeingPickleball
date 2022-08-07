//
//  ScoringManager.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/4/22.
//

import RealmSwift
import SwiftUI

    
    
    
//func postPointScored(match: Match) {
//        print("Starting postPointScored()")
//        //@ObservedRealmObject var match: Match
//
//        if match.servingPlayerNumber == 1 {
//            $match.games[match.currentGameNumber - 1].player1Team1Points.wrappedValue += 1
//            // Player 1 Team 1 is serving as second server on Team 1
//            if match.isSecondServer {
//                // Second server uses backslash to mark points - "squareleftbackslash"
//                //print("    > > > gameScoreTeam1 in pointScored()[1]: \(match.games[match.currentGameNumber - 1].gameScoreTeam1)")
//                switch match.games[match.currentGameNumber - 1].gameScoreTeam1 {
//                case 1:
//                    $match.games[match.currentGameNumber - 1].point1Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 2:
//                    $match.games[match.currentGameNumber - 1].point2Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 3:
//                    $match.games[match.currentGameNumber - 1].point3Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 4:
//                    $match.games[match.currentGameNumber - 1].point4Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 5:
//                    $match.games[match.currentGameNumber - 1].point5Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 6:
//                    $match.games[match.currentGameNumber - 1].point6Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 7:
//                    $match.games[match.currentGameNumber - 1].point7Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 8:
//                    $match.games[match.currentGameNumber - 1].point8Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 9:
//                    $match.games[match.currentGameNumber - 1].point9Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 10:
//                    $match.games[match.currentGameNumber - 1].point10Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 11:
//                    $match.games[match.currentGameNumber - 1].point11Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 12:
//                    $match.games[match.currentGameNumber - 1].point12Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                default:
//                    print("Error setting image in switch statement of pointScored()")
//                }
//            } else {
//                // Player 1 Team 1 is serving as first server on Team 1
//                // First server uses forwardslash to mark points - "squareleftfwdslash"
//                //print("    > > > gameScoreTeam1 in pointScored() [2]: \(match.games[match.currentGameNumber - 1].gameScoreTeam1)")
//                switch match.games[match.currentGameNumber - 1].gameScoreTeam1 {
//                case 1:
//                    $match.games[match.currentGameNumber - 1].point1Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 2:
//                    $match.games[match.currentGameNumber - 1].point2Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 3:
//                    $match.games[match.currentGameNumber - 1].point3Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 4:
//                    $match.games[match.currentGameNumber - 1].point4Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 5:
//                    $match.games[match.currentGameNumber - 1].point5Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 6:
//                    $match.games[match.currentGameNumber - 1].point6Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 7:
//                    $match.games[match.currentGameNumber - 1].point7Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 8:
//                    $match.games[match.currentGameNumber - 1].point8Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 9:
//                    $match.games[match.currentGameNumber - 1].point9Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 10:
//                    $match.games[match.currentGameNumber - 1].point10Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 11:
//                    $match.games[match.currentGameNumber - 1].point11Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 12:
//                    $match.games[match.currentGameNumber - 1].point12Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                default:
//                    print("Error setting image in switch statement of pointScored()")
//                }
//            }
//        // End if player 1 serving
//        }
//
//        else if  match.servingPlayerNumber == 2 {
//            $match.games[match.currentGameNumber - 1].player2Team1Points.wrappedValue += 1
//            // Player 2 Team 1 is serving as second server on Team 1
//            if match.isSecondServer {
//                // Second server uses backslash to mark points - "squareleftbackslash"
//
//                //print("    > > > gameScoreTeam1 in pointScored()[3]: \(match.games[match.currentGameNumber - 1].gameScoreTeam1)")
//                switch match.games[match.currentGameNumber - 1].gameScoreTeam1 {
//                case 1:
//                    $match.games[match.currentGameNumber - 1].point1Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 2:
//                    $match.games[match.currentGameNumber - 1].point2Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 3:
//                    $match.games[match.currentGameNumber - 1].point3Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 4:
//                    $match.games[match.currentGameNumber - 1].point4Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 5:
//                    $match.games[match.currentGameNumber - 1].point5Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 6:
//                    $match.games[match.currentGameNumber - 1].point6Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 7:
//                    $match.games[match.currentGameNumber - 1].point7Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 8:
//                    $match.games[match.currentGameNumber - 1].point8Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 9:
//                    $match.games[match.currentGameNumber - 1].point9Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 10:
//                    $match.games[match.currentGameNumber - 1].point10Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 11:
//                    $match.games[match.currentGameNumber - 1].point11Game1ImageTm1.wrappedValue = "squareleftbackslash"
//                case 12:
//                    $match.games[match.currentGameNumber - 1].point12Game1ImageTm1.wrappedValue = "squareleftbackslash"
//
//                default:
//                    print("Error setting image in switch statement of pointScored()")
//                }
//            } else {
//                // Player 2 Team 1 is serving as first server on Team 1
//                // First server uses forwardslash to mark points - "squareleftfwdslash"
//                //print("    > > > gameScoreTeam1 in pointScored() [4]: \(match.games[match.currentGameNumber - 1].gameScoreTeam1)")
//                switch match.games[match.currentGameNumber - 1].gameScoreTeam1 {
//                case 1:
//                    $match.games[match.currentGameNumber - 1].point1Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 2:
//                    $match.games[match.currentGameNumber - 1].point2Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 3:
//                    $match.games[match.currentGameNumber - 1].point3Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 4:
//                    $match.games[match.currentGameNumber - 1].point4Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 5:
//                    $match.games[match.currentGameNumber - 1].point5Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 6:
//                    $match.games[match.currentGameNumber - 1].point6Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 7:
//                    $match.games[match.currentGameNumber - 1].point7Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 8:
//                    $match.games[match.currentGameNumber - 1].point8Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 9:
//                    $match.games[match.currentGameNumber - 1].point9Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 10:
//                    $match.games[match.currentGameNumber - 1].point10Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 11:
//                    $match.games[match.currentGameNumber - 1].point11Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                case 12:
//                    $match.games[match.currentGameNumber - 1].point12Game1ImageTm1.wrappedValue = "squareleftfwdslash"
//                default:
//                    print("Error setting image in switch statement of pointScored()")
//                }
//            }
//
//        // End if player 2 serving
//        }
//
//
//        else if  match.servingPlayerNumber == 3 {
//            $match.games[match.currentGameNumber - 1].player1Team2Points.wrappedValue += 1
//            // Player 1 Team 2 is serving as second server on Team 2
//            if match.isSecondServer {
//                // Second server uses backslash to mark points - "squareleftbackslash"
//
//                //print("    > > > gameScoreTeam2 in pointScored()[5]: \(match.games[match.currentGameNumber - 1].gameScoreTeam2)")
//                switch match.games[match.currentGameNumber - 1].gameScoreTeam2 {
//                case 1:
//                    $match.games[match.currentGameNumber - 1].point1Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 2:
//                    $match.games[match.currentGameNumber - 1].point2Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 3:
//                    $match.games[match.currentGameNumber - 1].point3Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 4:
//                    $match.games[match.currentGameNumber - 1].point4Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 5:
//                    $match.games[match.currentGameNumber - 1].point5Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 6:
//                    $match.games[match.currentGameNumber - 1].point6Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 7:
//                    $match.games[match.currentGameNumber - 1].point7Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 8:
//                    $match.games[match.currentGameNumber - 1].point8Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 9:
//                    $match.games[match.currentGameNumber - 1].point9Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 10:
//                    $match.games[match.currentGameNumber - 1].point10Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 11:
//                    $match.games[match.currentGameNumber - 1].point11Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 12:
//                    $match.games[match.currentGameNumber - 1].point12Game1ImageTm2.wrappedValue = "squareleftbackslash"
//
//                default:
//                    print("Error setting image in switch statement of pointScored()")
//                }
//            } else {
//                // Player 1 Team 2 is serving as first server on Team 2
//                // First server uses forwardslash to mark points - "squareleftfwdslash"
//                //print("    > > > gameScoreTeam2 in pointScored() [6]: \(match.games[match.currentGameNumber - 1].gameScoreTeam2)")
//                switch match.games[match.currentGameNumber - 1].gameScoreTeam2 {
//                case 1:
//                    $match.games[match.currentGameNumber - 1].point1Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 2:
//                    $match.games[match.currentGameNumber - 1].point2Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 3:
//                    $match.games[match.currentGameNumber - 1].point3Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 4:
//                    $match.games[match.currentGameNumber - 1].point4Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 5:
//                    $match.games[match.currentGameNumber - 1].point5Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 6:
//                    $match.games[match.currentGameNumber - 1].point6Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 7:
//                    $match.games[match.currentGameNumber - 1].point7Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 8:
//                    $match.games[match.currentGameNumber - 1].point8Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 9:
//                    $match.games[match.currentGameNumber - 1].point9Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 10:
//                    $match.games[match.currentGameNumber - 1].point10Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 11:
//                    $match.games[match.currentGameNumber - 1].point11Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 12:
//                    $match.games[match.currentGameNumber - 1].point12Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                default:
//                    print("Error setting image in switch statement of pointScored()")
//                }
//            }
//
//        // End if player 3 serving
//        }
//
//        else if  match.servingPlayerNumber == 4 {
//            $match.games[match.currentGameNumber - 1].player2Team2Points.wrappedValue += 1
//            // Player 2 Team 2 is serving as second server on Team 2
//            if match.isSecondServer {
//                // Second server uses backslash to mark points - "squareleftbackslash"
//
//                //print("    > > > gameScoreTeam2 in pointScored()[7]: \(match.games[match.currentGameNumber - 1].gameScoreTeam2)")
//                switch match.games[match.currentGameNumber - 1].gameScoreTeam2 {
//                case 1:
//                    $match.games[match.currentGameNumber - 1].point1Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 2:
//                    $match.games[match.currentGameNumber - 1].point2Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 3:
//                    $match.games[match.currentGameNumber - 1].point3Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 4:
//                    $match.games[match.currentGameNumber - 1].point4Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 5:
//                    $match.games[match.currentGameNumber - 1].point5Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 6:
//                    $match.games[match.currentGameNumber - 1].point6Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 7:
//                    $match.games[match.currentGameNumber - 1].point7Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 8:
//                    $match.games[match.currentGameNumber - 1].point8Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 9:
//                    $match.games[match.currentGameNumber - 1].point9Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 10:
//                    $match.games[match.currentGameNumber - 1].point10Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 11:
//                    $match.games[match.currentGameNumber - 1].point11Game1ImageTm2.wrappedValue = "squareleftbackslash"
//                case 12:
//                    $match.games[match.currentGameNumber - 1].point12Game1ImageTm2.wrappedValue = "squareleftbackslash"
//
//                default:
//                    print("Error setting image in switch statement of pointScored()")
//                }
//            } else {
//                // Player 2 Team 2 is serving as first server on Team 2
//                // First server uses forwardslash to mark points - "squareleftfwdslash"
//                //print("    > > > gameScoreTeam2 in pointScored() [8]: \(match.games[match.currentGameNumber - 1].gameScoreTeam2)")
//                switch match.games[match.currentGameNumber - 1].gameScoreTeam2 {
//                case 1:
//                    $match.games[match.currentGameNumber - 1].point1Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 2:
//                    $match.games[match.currentGameNumber - 1].point2Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 3:
//                    $match.games[match.currentGameNumber - 1].point3Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 4:
//                    $match.games[match.currentGameNumber - 1].point4Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 5:
//                    $match.games[match.currentGameNumber - 1].point5Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 6:
//                    $match.games[match.currentGameNumber - 1].point6Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 7:
//                    $match.games[match.currentGameNumber - 1].point7Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 8:
//                    $match.games[match.currentGameNumber - 1].point8Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 9:
//                    $match.games[match.currentGameNumber - 1].point9Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 10:
//                    $match.games[match.currentGameNumber - 1].point10Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 11:
//                    $match.games[match.currentGameNumber - 1].point11Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                case 12:
//                    $match.games[match.currentGameNumber - 1].point12Game1ImageTm2.wrappedValue = "squareleftfwdslash"
//                default:
//                    print("Error setting image in switch statement of pointScored()")
//                }
//            }
//
//        // End if player 4 serving
//        }
//    }

