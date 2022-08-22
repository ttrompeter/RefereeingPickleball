//
//  ProgrammerNotes.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/12/22.
//


//******************************************************************
/*
 
 Change of side by teams during match. In the third or fifth game
 of such matches the teams change sides halfway through the game.
 
 A triangle mark is placed on the scoresheet of 3rd or 5th games of a
 match to indicate that the teams change sides after a team scores that
 point in the game. Example: If mark is at point 6, then change sides
 after the point where one team scores 6. Players have 1 minute to change sides.
 
 End-Change Marks
 AT 6 of the third game for 3 games to 11 points
 At 8 of the third game for 3 games to 15 points
 AT 11 of the third game for 3 games to 21 points
 
 Before match begins each team designates who will be the first server for the team
 The first server for each team wears an identifying wristband designating that they
 are the first server for their team.
 
 Which team serves first is determined at the pre-Match briefing. The referee determines
 which team "wins the coin toss" using a "secret" number (1 or 2) written on the back of
 his scorsheet. The winning team then decides to either serve, receive, or chose a side of
 the court. The other team then decides whatver is left. For instance if the winning team
 decides to serve, then the other team decides which side of the court to defend and receives.
 As a result we don't know whihe player will be the first server of the match, the first server
 for each team, or which side of the court the teams will be on until after the pre_match briefing.
 
 Thus, the layout of the scoresheet (whether the arrow points left or right) and the identification
 of values for first servers can't be set until after the pre-Match briefing. Plus the layout depends
 on which side of the court the referee stands.
 
 In doubles, teams may change the starting server between games and should notify the referee.
 Teams switch ends and initial service upon the completion of each game.
 In game three of five, the teams will switch ends when the first team reaches a score of 6 / 8 / 11
 
 */

//******************************************************************
/*
 
 Timeouts
 
 For games to 11 or 15 points each team gets 2 timeouts
 For games to 21 points, each team gets 3 timeouts
 
 A regular timeout last one minute, with the referee announcing when fifrteen seconds remain
 and clalling time in when the timeout ends.
 
 Timeouts can end early if both teams are ready to resume play
 
 Medical timeout is called when a play sustains an injry or has amedical emergency.
 Once medical peresonnel arrive the referee starts a 15 minute period for assessment and treatment.
 Each player can can 1 medical timeout
 If it is determined that there is no medical issue then a regualr timeout is charged.
 
 Equipment timeout. If referee determines that a team needs to adjust equipment and has no timeouts,
 the referee may cal an equipment timeout. Equipment timeouts can last up to 2 minutes.
 
 Timeout between games and matches. A team may request that one or more of their timeouts be used
 to extend the time between games or matches. If that time is not used the timeout(s) are restored.
 
 Referee timeout. CAn be called for extenuating circumstances. These include inclement weatherm medical
 situations, player bleeding on court, player is inclapable of playing but refuses to take a medical timeout.
 
 */

/*
 Violations
 
 Technical Foul – A referee’s assessment of a behavioral violation that results in one point being removed from the score of the offending team, unless their score is zero, in which case a point shall be added to the score of the opposing side. A technical foul shall be issued if one technical warning has already been given and a second technical warning is warranted; or when warranted by a player’s or team’s action, based on the referee’s judgement.
 
 
 */


//******************************************************************





//****************************************************************************************
// Copy of PointScoredExtension Before Change to having them in match and not in each game

//
//  PointScoredMatchExtension.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/20/22.
//

    
//    func pointScored() {
//
//        // TODO: - Need to handle game to 21 points if it goes past 21 points
//        if match.servingPlayerNumber == 1 {
//            $match.games[match.currentGameNumber - 1].player1Team1Points.wrappedValue += 1
//            // Player 1 Team 1 is serving as second server on Team 1
//            if match.isSecondServer {
//                // Second server uses backslash to mark points - "squareleftbackslash"
//                //print("    > > > gameScoreTeam1 in pointScored()[1]: \(match.games[match.currentGameNumber - 1].gameScoreTeam1)")
//                switch match.games[match.currentGameNumber - 1].gameScoreTeam1 {
//                case 1:
//                    print("Starting case 1 Player 1 Team1 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point1Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point1Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point1Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point1Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point1Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 2:
//                    print("Starting case 2 Player 1 Team1 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point2Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point2Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point2Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point2Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point2Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point2Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 3:
//                    print("Starting case 3 Player 1 Team1 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point3Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point3Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point3Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point3Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point3Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point3Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 4:
//                    print("Starting case 4 Player 1 Team1 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point4Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point4Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point4Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point4Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point4Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point4Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 5:
//                    print("Starting case 5 Player 1 Team1 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point5Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point5Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point5Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point5Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point5Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point5Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 6:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point6Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point6Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point6Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point6Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point6Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point6Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 7:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point7Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point7Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point7Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point7Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point7Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point7Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 8:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point8Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point8Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point8Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point8Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point8Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point8Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 9:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point9Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point9Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point9Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point9Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point9Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point9Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 10:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point10Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point10Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point10Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point10Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point10Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point10Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 11:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point11Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point11Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point11Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point11Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point11Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point11Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 12:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point12Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point12Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point12Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point12Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point12Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 13:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point13Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point13Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point13Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point13Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point13Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point13Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 14:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point14Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point14Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point14Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point14Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point14Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point14Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 15:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point15Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point15Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point15Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point15Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point15Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point15Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 16:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point16Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point16Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point16Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point16Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point16Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point16Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 17:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point17Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point17Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point17Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point17Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point17Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point17Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 18:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point18Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point18Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point18Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point18Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point18Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point18Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 19:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point19Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point19Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point19Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point19Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point19Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point19Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 20:
//                    print("Starting case 20 Player1 Team1 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point20Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point20Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point20Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point20Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point20Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point20Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 21:
//                    print("Starting case 21 Player1 Team1 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point21Game1ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point21Game2ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point21Game3ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point21Game3ImageTm1.wrappedValue = Constants.BOX_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point21Game4ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point21Game5ImageTm1.wrappedValue = Constants.BOX_BACK_SLASH
//                    }
//                default:
//                    print("Error setting image in switch statement of pointScored()")
//                }
//            } else {
//                // Player 1 Team 1 is serving as first server on Team 1
//                // First server uses forwardslash to mark points - "squareleftfwdslash"
//                //print("    > > > gameScoreTeam1 in pointScored() [2]: \(match.games[match.currentGameNumber - 1].gameScoreTeam1)")
//                switch match.games[match.currentGameNumber - 1].gameScoreTeam1 {
//                case 1:
//                    print("Starting case 1 Player 1 Team1 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point1Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point1Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point1Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point1Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point1Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                case 2:
//                    print("Starting case 2 Player 1 Team1 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point2Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point2Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point2Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point2Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point2Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point2Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                case 3:
//                    print("Starting case 3 Player 1 Team1 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point3Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point3Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point3Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point3Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point3Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point3Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                case 4:
//                    print("Starting case 4 Player 1 Team1 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point4Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point4Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point4Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point4Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point4Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point4Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                case 5:
//                    print("Starting case 5 Player 1 Team1 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point5Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point5Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point5Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point5Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point5Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point5Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                case 6:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point6Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point6Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point6Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point6Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point6Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point6Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                case 7:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point7Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point7Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point7Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point7Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point7Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point7Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                case 8:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point8Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point8Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point8Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point8Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point8Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point8Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                case 9:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point9Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point9Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point9Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point9Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point9Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point9Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                case 10:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point10Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point10Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point10Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point10Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point10Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point10Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                case 11:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point11Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point11Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point11Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point11Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point11Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point11Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                case 12:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point12Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point12Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point12Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point12Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point12Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point12Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                case 13:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point13Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point13Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point13Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point13Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point13Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                case 14:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point14Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point14Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point14Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point14Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point14Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point14Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                case 15:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point15Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point15Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point15Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point15Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point15Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point15Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                case 16:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point16Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point16Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point16Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point16Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point16Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point16Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                case 17:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point17Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point17Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point17Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point17Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point17Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point17Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                case 18:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point18Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point18Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point18Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point18Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point18Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point18Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                case 19:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point19Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point19Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point19Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point19Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point19Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point19Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                case 20:
//                    print("Starting case 20 Player1 Team1 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point20Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point20Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point20Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point20Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point20Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point20Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                case 21:
//                    print("Starting case 21 Player1 Team1 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point21Game1ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point21Game2ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point21Game3ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point21Game3ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point21Game4ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point21Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                default:
//                    print("Error setting image in switch statement of pointScored()")
//                }
//            }
//            // End if player 1 serving
//        } else if  match.servingPlayerNumber == 2 {
//            $match.games[match.currentGameNumber - 1].player2Team1Points.wrappedValue += 1
//            // Player 2 Team 1 is serving as second server on Team 1
//            if match.isSecondServer {
//                // Second server uses backslash to mark points - "squareleftbackslash"
//
//                //print("    > > > gameScoreTeam1 in pointScored()[3]: \(match.games[match.currentGameNumber - 1].gameScoreTeam1)")
//                switch match.games[match.currentGameNumber - 1].gameScoreTeam1 {
//                case 1:
//                    print("Starting case 1 Player 2 Team1 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point1Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point1Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point1Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point1Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point1Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 2:
//                    print("Starting case 2 Player 2 Team1 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point2Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point2Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point2Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point2Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point2Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point2Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 3:
//                    print("Starting case 3 Player 2 Team1 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point3Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point3Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point3Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point3Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    }
//                    else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point3Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    }
//                    else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point3Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 4:
//                    print("Starting case 4 Player 2 Team1 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point4Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point4Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point4Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point4Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point4Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point4Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 5:
//                    print("Starting case 5 Player 2 Team1 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point5Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point5Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point5Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point5Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point5Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point5Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 6:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point6Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point6Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point6Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point6Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point6Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point6Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 7:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point7Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point7Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point7Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point7Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point7Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point7Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 8:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point8Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point8Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point8Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point8Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point8Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point8Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 9:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point9Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point9Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point9Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point9Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    }
//                    else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point9Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    }
//                    else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point9Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 10:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point10Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point10Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point10Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point10Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point10Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point10Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 11:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point11Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point11Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point11Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point11Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point11Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point11Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 12:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point12Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point12Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point12Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point12Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point12Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point12Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 13:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point13Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point13Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point13Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point13Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point13Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point13Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 14:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point14Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point14Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point14Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point14Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point14Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point14Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 15:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point15Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point15Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point15Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point15Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point15Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point15Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 16:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point16Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point16Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point16Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point16Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point16Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point16Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 17:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point17Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point17Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point17Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point17Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point17Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point17Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 18:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point18Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point18Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point18Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point18Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point18Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point18Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 19:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point19Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point19Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point19Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point19Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point19Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point19Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 20:
//                    print("Starting case 21 Player2 Team1 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point20Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point20Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point20Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point20Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point20Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point20Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 21:
//                    print("Starting case 21 Player2 Team1 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point21Game1ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point21Game2ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point21Game3ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point21Game3ImageTm1.wrappedValue = Constants.BOX_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point21Game4ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point21Game5ImageTm1.wrappedValue = Constants.BOX_BACK_SLASH
//                    }
//                default:
//                    print("Error setting image in switch statement of pointScored()")
//                }
//            } else {
//                // Player 2 Team 1 is serving as first server on Team 1
//                // First server uses forwardslash to mark points - "squareleftfwdslash"
//                //print("    > > > gameScoreTeam1 in pointScored() [4]: \(match.games[match.currentGameNumber - 1].gameScoreTeam1)")
//                switch match.games[match.currentGameNumber - 1].gameScoreTeam1 {
//                case 1:
//                    print("Starting case 1 Player 2 Team1 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point1Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point1Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point1Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point1Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point1Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 2:
//                    print("Starting case 2 Player 2 Team1 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point2Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point2Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point2Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point2Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point2Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point2Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 3:
//                    print("Starting case 3 Player 2 Team1 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point3Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point3Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point3Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point3Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point3Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point3Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 4:
//                    print("Starting case 4 Player 2 Team1 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point4Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point4Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point4Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point4Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point4Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point4Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 5:
//                    print("Starting case 5 Player 2 Team1 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point5Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point5Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point5Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point5Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point5Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point5Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 6:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point6Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point6Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point6Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point6Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point6Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point6Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 7:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point7Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point7Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point7Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point7Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point7Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point7Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 8:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point8Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point8Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point8Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point8Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point8Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point8Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 9:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point9Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point9Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point9Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point9Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point9Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point9Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 10:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point10Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point10Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point10Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point10Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point10Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point10Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 11:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point11Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point11Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point11Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point11Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point11Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point11Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 12:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point12Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point12Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point12Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point12Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point12Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point12Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 13:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point13Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point13Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point13Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point13Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point13Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point13Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 14:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point14Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point14Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point14Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point14Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point14Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point14Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 15:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point15Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point15Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point15Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point15Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point15Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point15Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 16:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point16Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point16Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point16Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point16Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point16Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point16Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 17:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point17Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point17Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point17Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point17Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point17Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point17Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 18:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point18Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point18Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point18Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point18Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point18Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point18Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 19:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point19Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point19Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point19Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point19Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point19Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point19Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 20:
//                    print("Starting case 20 Player 2 Team1 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point20Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point20Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point20Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point20Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point20Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point20Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 21:
//                    print("Starting case 21 Player 2 Team1 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point21Game1ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point21Game2ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point21Game3ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point21Game3ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point21Game4ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point21Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                default:
//                    print("Error setting image in switch statement of pointScored()")
//                }
//            }
//            // End if player 2 serving
//        } else if  match.servingPlayerNumber == 3 {
//            $match.games[match.currentGameNumber - 1].player1Team2Points.wrappedValue += 1
//            // Player 1 Team 2 is serving as second server on Team 2
//            if match.isSecondServer {
//                // Second server uses backslash to mark points - "squareleftbackslash"
//
//                //print("    > > > gameScoreTeam2 in pointScored()[5]: \(match.games[match.currentGameNumber - 1].gameScoreTeam2)")
//                switch match.games[match.currentGameNumber - 1].gameScoreTeam2 {
//                case 1:
//                    print("Starting case 1 Player 1 Team2 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point1Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point1Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point1Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point1Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point1Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 2:
//                    print("Starting case 2 Player 1 Team2 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point2Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point2Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point2Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point2Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    }
//                    else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point2Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point2Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 3:
//                    print("Starting case 3 Player 1 Team2 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point3Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point3Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point3Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point3Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point3Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point3Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 4:
//                    print("Starting case 4 Player 1 Team2 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point4Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point4Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point4Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point4Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point4Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point4Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 5:
//                    print("Starting case 5 Player 1 Team2 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point5Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point5Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point5Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point5Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point5Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point5Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 6:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point6Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point6Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point6Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point6Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point6Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point6Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 7:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point7Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point7Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point7Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point7Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point7Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point7Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 8:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point8Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point8Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point8Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point8Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point8Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point8Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 9:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point9Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point9Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point9Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point9Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point9Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point9Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 10:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point10Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point10Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point10Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point10Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point10Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point10Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 11:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point11Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point11Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point11Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point11Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point11Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point11Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 12:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point12Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point12Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point12Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point12Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point12Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point12Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 13:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point13Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point13Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point13Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point13Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point13Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 14:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point14Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point14Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point14Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point14Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point14Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point14Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 15:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point15Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point15Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point15Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point15Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point15Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point15Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 16:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point16Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point16Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point16Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point16Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point16Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    }
//                    else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point16Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 17:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point17Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point17Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point17Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point17Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point17Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    }
//                    else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point17Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 18:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point18Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point18Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point18Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point18Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point18Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point18Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 19:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point19Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point19Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point19Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point19Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point19Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point19Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 20:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point20Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point20Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point20Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point20Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point20Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point20Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 21:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point21Game1ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point21Game2ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point21Game3ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point21Game3ImageTm2.wrappedValue = Constants.BOX_BACK_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point21Game4ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point21Game5ImageTm2.wrappedValue = Constants.BOX_BACK_SLASH
//                    }
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
//                    print("Starting case 1 Player 1 Team2 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point1Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point1Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point1Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point1Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point1Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 2:
//                    print("Starting case 2 Player 1 Team2 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point2Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point2Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point2Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point2Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point2Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point2Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 3:
//                    print("Starting case 3 Player 1 Team2 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point3Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point3Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point3Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point3Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    }
//                    else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point3Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point3Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 4:
//                    print("Starting case 4 Player 1 Team2 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point4Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point4Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point4Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point4Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point4Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point4Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 5:
//                    print("Starting case 5 Player 1 Team2 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point5Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point5Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point5Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point5Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point5Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point5Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 6:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point6Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point6Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point6Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point6Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point6Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point6Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 7:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point7Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point7Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point7Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point7Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point7Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point7Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 8:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point8Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point8Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point8Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point8Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point8Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point8Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 9:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point9Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point9Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point9Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point9Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point9Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point9Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 10:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point10Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point10Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point10Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point10Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point10Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point10Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 11:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point11Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point11Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point11Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point11Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point11Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point11Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 12:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point12Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point12Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point12Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point12Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point12Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point12Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 13:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point13Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point13Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point13Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point13Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point13Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point13Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 14:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point14Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point14Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point14Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point14Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point14Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point14Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 15:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point15Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point15Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point15Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point15Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point15Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point15Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 16:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point16Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point16Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point16Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point16Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point16Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point16Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 17:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point17Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point17Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point17Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point17Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point17Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point17Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 18:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point18Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point18Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point18Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point18Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point18Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point18Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 19:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point19Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point19Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point19Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point19Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point19Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point19Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 20:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point20Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point20Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point20Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point20Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point20Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point20Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 21:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point21Game1ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point21Game2ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point21Game3ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point21Game3ImageTm2.wrappedValue = Constants.BOX_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point21Game4ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point21Game5ImageTm2.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                default:
//                    print("Error setting image in switch statement of pointScored()")
//                }
//            }
//
//            // End if player 3 serving
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
//                    print("Starting case 1 Player 2 Team2 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point1Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point1Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point1Game3ImageTm2.wrappedValue = "squareleftbackslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point1Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 2:
//                    print("Starting case 2 Player 2 Team2 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point2Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point2Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point2Game3ImageTm2.wrappedValue = "squareleftbackslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point2Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point2Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 3:
//                    print("Starting case 3 Player 2 Team2 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point3Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point3Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point3Game3ImageTm2.wrappedValue = "squareleftbackslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point3Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point3Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 4:
//                    print("Starting case 4 Player 2 Team2 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point4Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point4Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point4Game3ImageTm2.wrappedValue = "squareleftbackslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point4Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point4Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 5:
//                    print("Starting case 5 Player 2 Team2 as second server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point5Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point5Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point5Game3ImageTm2.wrappedValue = "squareleftbackslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point5Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point5Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 6:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point6Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point6Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point6Game3ImageTm2.wrappedValue = "squareleftbackslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point6Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point6Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 7:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point7Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point7Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point7Game3ImageTm2.wrappedValue = "squareleftbackslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point7Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point7Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 8:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point8Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point8Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point8Game3ImageTm2.wrappedValue = "squareleftbackslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point8Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point8Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 9:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point9Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point9Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point9Game3ImageTm2.wrappedValue = "squareleftbackslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point9Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point9Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 10:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point10Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point10Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point10Game3ImageTm2.wrappedValue = "squareleftbackslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point10Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point10Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 11:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point11Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point11Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point11Game3ImageTm2.wrappedValue = "squareleftbackslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point11Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point11Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 12:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point12Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point12Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point12Game3ImageTm2.wrappedValue = "squareleftbackslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point12Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point12Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 13:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point13Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point13Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point13Game3ImageTm2.wrappedValue = "squareleftbackslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point13Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point13Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 14:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point14Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point14Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point14Game3ImageTm2.wrappedValue = "squareleftbackslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point14Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point14Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 15:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point15Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point15Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point15Game3ImageTm2.wrappedValue = "squareleftbackslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point15Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point15Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 16:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point16Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point16Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point16Game3ImageTm2.wrappedValue = "squareleftbackslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point16Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point16Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 17:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point17Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point17Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point17Game3ImageTm2.wrappedValue = "squareleftbackslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point17Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point17Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 18:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point18Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point18Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point18Game3ImageTm2.wrappedValue = "squareleftbackslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point18Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point18Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 19:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point19Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point19Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point19Game3ImageTm2.wrappedValue = "squareleftbackslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point19Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point19Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 20:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point20Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point20Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point20Game3ImageTm2.wrappedValue = "squareleftbackslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point20Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point20Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 21:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point21Game1ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point21Game2ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        $match.games[match.currentGameNumber - 1].point21Game3ImageTm2.wrappedValue = "squarerightfwdslash"
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point21Game4ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point21Game5ImageTm2.wrappedValue = Constants.BOX_BACK_SLASH
//                    }
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
//                    print("Starting case 1 Player 2 Team2 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point1Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point1Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point1Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point1Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point1Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point1Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 2:
//                    print("Starting case 2 Player 2 Team2 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point2Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point2Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point2Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point2Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point2Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point2Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 3:
//                    print("Starting case 3 Player 2 Team2 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point3Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point3Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point3Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point3Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point3Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point3Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 4:
//                    print("Starting case 4 Player 2 Team2 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point4Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point4Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point4Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point4Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point4Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point4Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 5:
//                    print("Starting case 5 Player 2 Team2 as first server")
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point5Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point5Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point5Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point5Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point5Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point5Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 6:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point6Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point6Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point6Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point6Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point6Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point6Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 7:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point7Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point7Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point7Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point7Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point7Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point7Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 8:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point8Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point8Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point8Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point8Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point8Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point8Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 9:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point9Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point9Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point9Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point9Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point9Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point9Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 10:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point10Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point10Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point10Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point10Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point10Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point10Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 11:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point11Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point11Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point11Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point11Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point11Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point11Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
//                    }
//                case 12:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point12Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point12Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point12Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point12Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point12Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point12Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 13:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point13Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point13Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point13Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point13Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point13Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point13Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 14:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point14Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point14Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point14Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point14Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point14Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point14Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 15:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point15Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point15Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point15Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point15Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point15Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point15Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 16:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point16Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point16Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point16Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point16Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point16Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point16Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 17:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point17Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point17Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point17Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point17Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point17Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point17Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 18:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point18Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point18Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point18Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point18Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point18Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point18Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 19:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point19Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point19Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point19Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point19Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point19Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point19Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 20:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point20Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point20Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point20Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point20Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point20Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point20Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
//                    }
//                case 21:
//                    if match.currentGameNumber == 1 {
//                        $match.games[match.currentGameNumber - 1].point21Game1ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
//                    } else if match.currentGameNumber == 2 {
//                        $match.games[match.currentGameNumber - 1].point21Game2ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
//                    } else if match.currentGameNumber == 3 {
//                        if match.selectedMatchFormat == 3 {
//                            $match.games[match.currentGameNumber - 1].point21Game3ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
//                        } else {
//                            $match.games[match.currentGameNumber - 1].point21Game3ImageTm2.wrappedValue = Constants.BOX_FORWARD_SLASH
//                        }
//                    } else if match.currentGameNumber == 4 {
//                        $match.games[match.currentGameNumber - 1].point21Game4ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
//                    } else if match.currentGameNumber == 5 {
//                        $match.games[match.currentGameNumber - 1].point21Game5ImageTm2.wrappedValue = Constants.BOX_FORWARD_SLASH
//                    }
//                default:
//                    print("Error setting image in switch statement of pointScored()")
//                }
//            }
//
//            // End if player 4 serving
//        }
//
//    }
//
//}










//struct PointsFirstRowTeam1View: View {
//    
//    @ObservedRealmObject var match: Match
//    
//    var body: some View {
//        
//        VStack (spacing: 0) {
//            HStack (alignment: .top, spacing: 0) {
//                
//                Rectangle()
//                    .foregroundColor(.white)
//                    .frame(width: 90.0, height: Constants.BOX_DIMENSION, alignment: .leading)
//                    .border(.black, width: 1.0)
//                    .overlay(Text(match.firstServerDesignationGame1Team1).font(.caption).italic())
//                    
//                
//                //Empty space column
//                VStack (spacing: 0) {
//                    Rectangle()
//                        .foregroundColor(.white)
//                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION, alignment: .leading)
//                }
//                
//                Group {
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point1Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint0Game1Team1 {
//                            Image(Constants.SIDEOUT_LEFT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        if match.games[0].isSideoutPoint1Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("1")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point2Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint2Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("2")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point3Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint3Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("3")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point4Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint4Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("4")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point5Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint5Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("5")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point6Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint6Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("6")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point7Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint7Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("7")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point8Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint8Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("8")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point9Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint9Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("9")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                }
//                Group {
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point10Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint10Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("10")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point11Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint11Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("11")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point12Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint12Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("12")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point13Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint13Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("13")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point14Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint14Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("14")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point15Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint15Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("15")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point16Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint16Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("16")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point17Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint17Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("17")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point18Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint18Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("18")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point19Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint19Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("19")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                }
//                
//                Group {
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point20Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint20Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("20")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point21Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint21Game1Team1 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("21")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                }
//                //Empty space column
//                VStack (spacing: 0) {
//                    Rectangle()
//                        .foregroundColor(.white)
//                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION, alignment: .leading)
//                }
//                // Timeouts
//                
//                ZStack {
//                    
//                    Image(match.games[match.currentGameNumber - 1].timeOut1Game1ImageTm1)
//                        .resizable()
//                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                    Text("1")
//                        .foregroundColor(Constants.DARK_SLATE)
//                }
//                if match.selectedMatchFormat != 3 {
//                    
//                }
//                if match.selectedMatchFormat == 3 {
//                    ZStack {
//                        
//                        Image(match.games[match.currentGameNumber - 1].timeOut2_5Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        Text("2")
//                            .foregroundColor(Constants.DARK_SLATE)
//                    }
//                } else {
//                    ZStack {
//                        
//                        Image(match.games[match.currentGameNumber - 1].timeOut2Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        Text("2")
//                            .foregroundColor(Constants.DARK_SLATE)
//                    }
//                }
//                
//                // If match is best 3 games of 5 games then show 3 timeouts else just show 2 timeouts
//                if match.selectedMatchFormat == 3 {
//                    ZStack {
//                        
//                        Image(match.games[match.currentGameNumber - 1].timeOut3Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        Text("3")
//                            .foregroundColor(Constants.DARK_SLATE)
//                    }
//                }
//            }
//        }
//    }
//}







//struct PointsFirstRowTeam2View: View {
//    
//    @ObservedRealmObject var match: Match
//    
//    var body: some View {
//        
//        VStack (spacing: 0) {
//            HStack (alignment: .top, spacing: 0) {
//                
//                Rectangle()
//                    .foregroundColor(.white)
//                    .frame(width: 90.0, height: Constants.BOX_DIMENSION, alignment: .leading)
//                    .border(.black, width: 1.0)
//                    .overlay(Text(match.firstServerDesignationGame1Team2).font(.caption).italic())
//                    
//                
//                //Empty space column
//                VStack (spacing: 0) {
//                    Rectangle()
//                        .foregroundColor(.white)
//                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION, alignment: .leading)
//                }
//                
//                Group {
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point1Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint0Game1Team2 {
//                            Image(Constants.SIDEOUT_LEFT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        if match.games[0].isSideoutPoint1Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("1")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point2Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint2Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("2")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point3Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint3Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("3")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point4Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint4Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("4")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point5Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint5Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("5")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point6Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint6Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("6")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point7Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint7Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("7")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point8Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint8Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("8")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point9Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint9Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("9")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                }
//                Group {
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point10Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint10Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("10")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point11Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint11Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("11")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point12Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint12Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("12")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point13Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint13Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("13")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point14Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint14Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("14")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point15Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint15Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("15")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point16Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint16Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("16")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point17Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint17Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("17")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point18Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint18Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("18")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point19Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint19Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("19")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                }
//                
//                Group {
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point20Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint20Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("20")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                    ZStack {
//                        Image(match.games[match.currentGameNumber - 1].point21Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        if match.games[0].isSideoutPoint21Game1Team2 {
//                            Image(Constants.SIDEOUT_RIGHT)
//                                .resizable()
//                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        }
//                        Text("21")
//                            .foregroundColor(Constants.SILVER)
//                    }
//                }
//                //Empty space column
//                VStack (spacing: 0) {
//                    Rectangle()
//                        .foregroundColor(.white)
//                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION, alignment: .leading)
//                }
//                // Timeouts
//                ZStack {
//                    
//                    Image(match.games[match.currentGameNumber - 1].timeOut1Game1ImageTm2)
//                        .resizable()
//                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                    Text("1")
//                        .foregroundColor(Constants.DARK_SLATE)
//                }
//                
//                
//                if match.selectedMatchFormat == 3 {
//                    ZStack {
//                        
//                        Image(match.games[match.currentGameNumber - 1].timeOut2_5Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        Text("2")
//                            .foregroundColor(Constants.DARK_SLATE)
//                    }
//                } else {
//                    ZStack {
//                        
//                        Image(match.games[match.currentGameNumber - 1].timeOut2Game1ImageTm2)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        Text("2")
//                            .foregroundColor(Constants.DARK_SLATE)
//                    }
//                }
//                
//                // If match is best 3 games of 5 games then show 3 timeouts else just show 2 timeouts
//                if match.selectedMatchFormat == 3 {
//                    ZStack {
//                        
//                        Image(match.games[match.currentGameNumber - 1].timeOut3Game1ImageTm1)
//                            .resizable()
//                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
//                        Text("3")
//                            .foregroundColor(Constants.DARK_SLATE)
//                    }
//                }
//
//            }
//        }
//    }
//}


