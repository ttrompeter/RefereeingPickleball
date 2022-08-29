//
//  PointScoredMatchExtension.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/20/22.
//

import RealmSwift
import SwiftUI

extension MatchView {
    
    func pointScored() {
        
        // TODO: - Need to handle game to 21 points if it goes past 21 points
        if match.servingPlayerNumber == 1 {
            $match.games[match.currentGameNumber - 1].player1Points.wrappedValue += 1
            // Player 1 Team 1 is serving as second server on Team 1
            if scoresheetManager.isSecondServer {
                // Second server uses backslash to mark points
                switch match.games[match.currentGameNumber - 1].gameScoreTeam1 {
                case 1:
                    if match.currentGameNumber == 1 {
                        $match.point1Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point1Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point1Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point1Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point1Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point1Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 2:
                    if match.currentGameNumber == 1 {
                        $match.point2Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point2Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point2Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point2Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point2Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point2Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 3:
                    if match.currentGameNumber == 1 {
                        $match.point3Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point3Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point3Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point3Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point3Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point3Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 4:
                    if match.currentGameNumber == 1 {
                        $match.point4Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point4Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point4Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point4Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point4Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point4Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 5:
                    if match.currentGameNumber == 1 {
                        $match.point5Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point5Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point5Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point5Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point5Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point5Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 6:
                    if match.currentGameNumber == 1 {
                        $match.point6Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point6Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point6Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point6Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point6Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point6Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 7:
                    if match.currentGameNumber == 1 {
                        $match.point7Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point7Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point7Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point7Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point7Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point7Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 8:
                    if match.currentGameNumber == 1 {
                        $match.point8Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point8Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point8Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point8Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point8Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point8Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 9:
                    if match.currentGameNumber == 1 {
                        $match.point9Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point9Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point9Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point9Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point9Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point9Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 10:
                    if match.currentGameNumber == 1 {
                        $match.point10Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point10Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point10Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point10Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point10Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point10Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 11:
                    if match.currentGameNumber == 1 {
                        $match.point11Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point11Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point11Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point11Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point11Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point11Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 12:
                    if match.currentGameNumber == 1 {
                        $match.point12Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point12Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point12Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point12Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point12Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point1Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 13:
                    if match.currentGameNumber == 1 {
                        $match.point13Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point13Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point13Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point13Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point13Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point13Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 14:
                    if match.currentGameNumber == 1 {
                        $match.point14Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point14Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point14Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point14Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point14Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point14Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 15:
                    if match.currentGameNumber == 1 {
                        $match.point15Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point15Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point15Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point15Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point15Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point15Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 16:
                    if match.currentGameNumber == 1 {
                        $match.point16Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point16Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point16Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point16Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point16Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point16Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 17:
                    if match.currentGameNumber == 1 {
                        $match.point17Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point17Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point17Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point17Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point17Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point17Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 18:
                    if match.currentGameNumber == 1 {
                        $match.point18Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point18Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point18Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point18Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point18Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point18Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 19:
                    if match.currentGameNumber == 1 {
                        $match.point19Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point19Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point19Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point19Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point19Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point19Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 20:
                    if match.currentGameNumber == 1 {
                        $match.point20Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point20Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point20Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point20Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point20Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point20Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 21:
                    if match.currentGameNumber == 1 {
                        $match.point21Game1ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point21Game2ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point21Game3ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
                        } else {
                            $match.point21Game3ImageTm1.wrappedValue = Constants.BOX_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point21Game4ImageTm1.wrappedValue = Constants.BOX_RIGHT_ONLY_END_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point21Game5ImageTm1.wrappedValue = Constants.BOX_BACK_SLASH
                    }
                default:
                    print("Error setting image in switch statement of pointScored()")
                }
            } else {
                // Player 1 Team 1 is serving as first server on Team 1
                // First server uses forwardslash to mark points - "squareleftfwdslash"
                //print("    > > > gameScoreTeam1 in pointScored() [2]: \(match.gameScoreTeam1)")
                switch match.games[match.currentGameNumber - 1].gameScoreTeam1 {
                case 1:
                    if match.currentGameNumber == 1 {
                        $match.point1Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point1Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point1Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point1Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point1Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point1Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                case 2:
                    if match.currentGameNumber == 1 {
                        $match.point2Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point2Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point2Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point2Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point2Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point2Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                case 3:
                    if match.currentGameNumber == 1 {
                        $match.point3Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point3Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point3Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point3Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point3Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point3Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                case 4:
                    if match.currentGameNumber == 1 {
                        $match.point4Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point4Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point4Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point4Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point4Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point4Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                case 5:
                    if match.currentGameNumber == 1 {
                        $match.point5Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point5Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point5Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point5Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point5Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point5Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                case 6:
                    if match.currentGameNumber == 1 {
                        $match.point6Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point6Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point6Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point6Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point6Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point6Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                case 7:
                    if match.currentGameNumber == 1 {
                        $match.point7Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point7Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point7Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point7Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point7Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point7Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                case 8:
                    if match.currentGameNumber == 1 {
                        $match.point8Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point8Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point8Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point8Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point8Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point8Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                case 9:
                    if match.currentGameNumber == 1 {
                        $match.point9Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point9Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point9Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point9Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point9Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point9Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                case 10:
                    if match.currentGameNumber == 1 {
                        $match.point10Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point10Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point10Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point10Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point10Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point10Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                case 11:
                    if match.currentGameNumber == 1 {
                        $match.point11Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point11Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point11Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point11Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point11Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point11Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                case 12:
                    if match.currentGameNumber == 1 {
                        $match.point12Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point12Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point12Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point12Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point12Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point12Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                case 13:
                    if match.currentGameNumber == 1 {
                        $match.point13Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point13Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point13Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point13Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point13Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point1Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                case 14:
                    if match.currentGameNumber == 1 {
                        $match.point14Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point14Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point14Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point14Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point14Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point14Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                case 15:
                    if match.currentGameNumber == 1 {
                        $match.point15Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point15Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point15Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point15Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point15Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point15Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                case 16:
                    if match.currentGameNumber == 1 {
                        $match.point16Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point16Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point16Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point16Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point16Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point16Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                case 17:
                    if match.currentGameNumber == 1 {
                        $match.point17Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point17Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point17Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point17Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point17Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point17Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                case 18:
                    if match.currentGameNumber == 1 {
                        $match.point18Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point18Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point18Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point18Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point18Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point18Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                case 19:
                    if match.currentGameNumber == 1 {
                        $match.point19Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point19Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point19Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point19Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point19Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point19Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                case 20:
                    if match.currentGameNumber == 1 {
                        $match.point20Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point20Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point20Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point20Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point20Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point20Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                case 21:
                    if match.currentGameNumber == 1 {
                        $match.point21Game1ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point21Game2ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point21Game3ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
                        } else {
                            $match.point21Game3ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point21Game4ImageTm1.wrappedValue = Constants.BOX_RIGHT_ONLY_END_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point21Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                default:
                    print("Error setting image in switch statement of pointScored()")
                }
            }
            // End if player 1 serving
        } else if  match.servingPlayerNumber == 2 {
            $match.games[match.currentGameNumber - 1].player2Points.wrappedValue += 1
            // Player 2 Team 1 is serving as second server on Team 1
            if scoresheetManager.isSecondServer {
                // Second server uses backslash to mark points - "squareleftbackslash"
                
                //print("    > > > gameScoreTeam1 in pointScored()[3]: \(match.gameScoreTeam1)")
                switch match.games[match.currentGameNumber - 1].gameScoreTeam1 {
                case 1:
                    if match.currentGameNumber == 1 {
                        $match.point1Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point1Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point1Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point1Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point1Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point1Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 2:
                    if match.currentGameNumber == 1 {
                        $match.point2Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point2Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point2Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point2Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point2Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point2Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 3:
                    if match.currentGameNumber == 1 {
                        $match.point3Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point3Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point3Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point3Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    }
                    else if match.currentGameNumber == 4 {
                        $match.point3Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    }
                    else if match.currentGameNumber == 5 {
                        $match.point3Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 4:
                    if match.currentGameNumber == 1 {
                        $match.point4Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point4Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point4Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point4Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point4Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point4Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 5:
                    if match.currentGameNumber == 1 {
                        $match.point5Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point5Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point5Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point5Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point5Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point5Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 6:
                    if match.currentGameNumber == 1 {
                        $match.point6Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point6Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point6Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point6Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point6Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point6Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 7:
                    if match.currentGameNumber == 1 {
                        $match.point7Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point7Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point7Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point7Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point7Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point7Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 8:
                    if match.currentGameNumber == 1 {
                        $match.point8Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point8Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point8Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point8Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point8Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point8Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 9:
                    if match.currentGameNumber == 1 {
                        $match.point9Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point9Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point9Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point9Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    }
                    else if match.currentGameNumber == 4 {
                        $match.point9Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    }
                    else if match.currentGameNumber == 5 {
                        $match.point9Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 10:
                    if match.currentGameNumber == 1 {
                        $match.point10Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point10Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point10Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point10Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point10Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point10Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 11:
                    if match.currentGameNumber == 1 {
                        $match.point11Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point11Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point11Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point11Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point11Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point11Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 12:
                    if match.currentGameNumber == 1 {
                        $match.point12Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point12Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point12Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point12Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point12Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point12Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 13:
                    if match.currentGameNumber == 1 {
                        $match.point13Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point13Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point13Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point13Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point13Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point13Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 14:
                    if match.currentGameNumber == 1 {
                        $match.point14Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point14Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point14Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point14Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point14Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point14Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 15:
                    if match.currentGameNumber == 1 {
                        $match.point15Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point15Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point15Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point15Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point15Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point15Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 16:
                    if match.currentGameNumber == 1 {
                        $match.point16Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point16Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point16Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point16Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point16Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point16Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 17:
                    if match.currentGameNumber == 1 {
                        $match.point17Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point17Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point17Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point17Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point17Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point17Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 18:
                    if match.currentGameNumber == 1 {
                        $match.point18Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point18Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point18Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point18Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point18Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point18Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 19:
                    if match.currentGameNumber == 1 {
                        $match.point19Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point19Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point19Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point19Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point19Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point19Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 20:
                    if match.currentGameNumber == 1 {
                        $match.point20Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point20Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point20Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point20Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point20Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point20Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 21:
                    if match.currentGameNumber == 1 {
                        $match.point21Game1ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point21Game2ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point21Game3ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
                        } else {
                            $match.point21Game3ImageTm1.wrappedValue = Constants.BOX_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point21Game4ImageTm1.wrappedValue = Constants.BOX_RIGHT_ONLY_END_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point21Game5ImageTm1.wrappedValue = Constants.BOX_BACK_SLASH
                    }
                default:
                    print("Error setting image in switch statement of pointScored()")
                }
            } else {
                // Player 2 Team 1 is serving as first server on Team 1
                // First server uses forwardslash to mark points - "squareleftfwdslash"
                //print("    > > > gameScoreTeam1 in pointScored() [4]: \(match.gameScoreTeam1)")
                switch match.games[match.currentGameNumber - 1].gameScoreTeam1 {
                case 1:
                    if match.currentGameNumber == 1 {
                        $match.point1Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point1Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point1Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point1Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point1Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point1Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 2:
                    if match.currentGameNumber == 1 {
                        $match.point2Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point2Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point2Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point2Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point2Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point2Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 3:
                    if match.currentGameNumber == 1 {
                        $match.point3Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point3Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point3Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point3Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point3Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point3Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 4:
                    if match.currentGameNumber == 1 {
                        $match.point4Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point4Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point4Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point4Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point4Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point4Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 5:
                    if match.currentGameNumber == 1 {
                        $match.point5Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point5Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point5Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point5Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point5Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point5Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 6:
                    if match.currentGameNumber == 1 {
                        $match.point6Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point6Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point6Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point6Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point6Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point6Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 7:
                    if match.currentGameNumber == 1 {
                        $match.point7Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point7Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point7Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point7Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point7Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point7Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 8:
                    if match.currentGameNumber == 1 {
                        $match.point8Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point8Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point8Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point8Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point8Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point8Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 9:
                    if match.currentGameNumber == 1 {
                        $match.point9Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point9Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point9Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point9Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point9Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point9Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 10:
                    if match.currentGameNumber == 1 {
                        $match.point10Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point10Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point10Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point10Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point10Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point10Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 11:
                    if match.currentGameNumber == 1 {
                        $match.point11Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point11Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point11Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point11Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point11Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point11Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 12:
                    if match.currentGameNumber == 1 {
                        $match.point12Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point12Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point12Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point12Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point12Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point12Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 13:
                    if match.currentGameNumber == 1 {
                        $match.point13Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point13Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point13Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point13Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point13Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point13Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 14:
                    if match.currentGameNumber == 1 {
                        $match.point14Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point14Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point14Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point14Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point14Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point14Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 15:
                    if match.currentGameNumber == 1 {
                        $match.point15Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point15Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point15Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point15Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point15Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point15Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 16:
                    if match.currentGameNumber == 1 {
                        $match.point16Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point16Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point16Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point16Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point16Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point16Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 17:
                    if match.currentGameNumber == 1 {
                        $match.point17Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point17Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point17Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point17Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point17Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point17Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 18:
                    if match.currentGameNumber == 1 {
                        $match.point18Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point18Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point18Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point18Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point18Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point18Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 19:
                    if match.currentGameNumber == 1 {
                        $match.point19Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point19Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point19Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point19Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point19Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point19Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 20:
                    if match.currentGameNumber == 1 {
                        $match.point20Game1ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point20Game2ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point20Game3ImageTm1.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point20Game3ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point20Game4ImageTm1.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point20Game5ImageTm1.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 21:
                    if match.currentGameNumber == 1 {
                        $match.point21Game1ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point21Game2ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point21Game3ImageTm1.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
                        } else {
                            $match.point21Game3ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point21Game4ImageTm1.wrappedValue = Constants.BOX_RIGHT_ONLY_END_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point21Game5ImageTm1.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                default:
                    print("Error setting image in switch statement of pointScored()")
                }
            }
            // End if player 2 serving
        } else if  match.servingPlayerNumber == 3 {
            $match.games[match.currentGameNumber - 1].player3Points.wrappedValue += 1
            // Player 1 Team 2 is serving as second server on Team 2
            if scoresheetManager.isSecondServer {
                // Second server uses backslash to mark points - "squareleftbackslash"
                
                //print("    > > > gameScoreTeam2 in pointScored()[5]: \(match.gameScoreTeam2)")
                switch match.games[match.currentGameNumber - 1].gameScoreTeam2 {
                case 1:
                    if match.currentGameNumber == 1 {
                        $match.point1Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point1Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point1Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point1Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point1Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point1Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 2:
                    if match.currentGameNumber == 1 {
                        $match.point2Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point2Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point2Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point2Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    }
                    else if match.currentGameNumber == 4 {
                        $match.point2Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point2Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 3:
                    if match.currentGameNumber == 1 {
                        $match.point3Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point3Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point3Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point3Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point3Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point3Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 4:
                    if match.currentGameNumber == 1 {
                        $match.point4Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point4Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point4Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point4Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point4Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point4Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 5:
                    if match.currentGameNumber == 1 {
                        $match.point5Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point5Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point5Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point5Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point5Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point5Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 6:
                    if match.currentGameNumber == 1 {
                        $match.point6Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point6Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point6Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point6Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point6Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point6Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 7:
                    if match.currentGameNumber == 1 {
                        $match.point7Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point7Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point7Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point7Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point7Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point7Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 8:
                    if match.currentGameNumber == 1 {
                        $match.point8Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point8Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point8Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point8Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point8Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point8Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 9:
                    if match.currentGameNumber == 1 {
                        $match.point9Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point9Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point9Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point9Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point9Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point9Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 10:
                    if match.currentGameNumber == 1 {
                        $match.point10Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point10Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point10Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point10Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point10Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point10Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 11:
                    if match.currentGameNumber == 1 {
                        $match.point11Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point11Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point11Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point11Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point11Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point11Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 12:
                    if match.currentGameNumber == 1 {
                        $match.point12Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point12Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point12Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point12Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point12Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point12Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 13:
                    if match.currentGameNumber == 1 {
                        $match.point13Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point13Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point13Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point13Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point13Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point1Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 14:
                    if match.currentGameNumber == 1 {
                        $match.point14Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point14Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point14Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point14Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point14Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point14Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 15:
                    if match.currentGameNumber == 1 {
                        $match.point15Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point15Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point15Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point15Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point15Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point15Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 16:
                    if match.currentGameNumber == 1 {
                        $match.point16Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point16Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point16Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point16Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point16Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    }
                    else if match.currentGameNumber == 5 {
                        $match.point16Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 17:
                    if match.currentGameNumber == 1 {
                        $match.point17Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point17Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point17Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point17Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point17Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    }
                    else if match.currentGameNumber == 5 {
                        $match.point17Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 18:
                    if match.currentGameNumber == 1 {
                        $match.point18Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point18Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point18Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point18Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point18Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point18Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 19:
                    if match.currentGameNumber == 1 {
                        $match.point19Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point19Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point19Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point19Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point19Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point19Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 20:
                    if match.currentGameNumber == 1 {
                        $match.point20Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point20Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point20Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                        } else {
                            $match.point20Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point20Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point20Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 21:
                    if match.currentGameNumber == 1 {
                        $match.point21Game1ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point21Game2ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point21Game3ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
                        } else {
                            $match.point21Game3ImageTm2.wrappedValue = Constants.BOX_BACK_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point21Game4ImageTm2.wrappedValue = Constants.BOX_RIGHT_ONLY_END_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point21Game5ImageTm2.wrappedValue = Constants.BOX_BACK_SLASH
                    }
                    
                default:
                    print("Error setting image in switch statement of pointScored()")
                }
            } else {
                // Player 1 Team 2 is serving as first server on Team 2
                // First server uses forwardslash to mark points - "squareleftfwdslash"
                //print("    > > > gameScoreTeam2 in pointScored() [6]: \(match.gameScoreTeam2)")
                switch match.games[match.currentGameNumber - 1].gameScoreTeam2 {
                case 1:
                    if match.currentGameNumber == 1 {
                        $match.point1Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point1Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point1Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point1Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point1Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point1Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 2:
                    if match.currentGameNumber == 1 {
                        $match.point2Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point2Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point2Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point2Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point2Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point2Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 3:
                    if match.currentGameNumber == 1 {
                        $match.point3Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point3Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point3Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point3Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    }
                    else if match.currentGameNumber == 4 {
                        $match.point3Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point3Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 4:
                    if match.currentGameNumber == 1 {
                        $match.point4Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point4Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point4Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point4Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point4Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point4Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 5:
                    if match.currentGameNumber == 1 {
                        $match.point5Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point5Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point5Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point5Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point5Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point5Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 6:
                    if match.currentGameNumber == 1 {
                        $match.point6Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point6Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point6Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point6Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point6Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point6Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 7:
                    if match.currentGameNumber == 1 {
                        $match.point7Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point7Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point7Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point7Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point7Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point7Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 8:
                    if match.currentGameNumber == 1 {
                        $match.point8Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point8Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point8Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point8Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point8Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point8Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 9:
                    if match.currentGameNumber == 1 {
                        $match.point9Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point9Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point9Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point9Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point9Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point9Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 10:
                    if match.currentGameNumber == 1 {
                        $match.point10Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point10Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point10Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point10Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point10Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point10Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 11:
                    if match.currentGameNumber == 1 {
                        $match.point11Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point11Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point11Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point11Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point11Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point11Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 12:
                    if match.currentGameNumber == 1 {
                        $match.point12Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point12Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point12Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point12Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point12Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point12Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 13:
                    if match.currentGameNumber == 1 {
                        $match.point13Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point13Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point13Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point13Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point13Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point13Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 14:
                    if match.currentGameNumber == 1 {
                        $match.point14Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point14Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point14Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point14Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point14Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point14Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 15:
                    if match.currentGameNumber == 1 {
                        $match.point15Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point15Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point15Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point15Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point15Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point15Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 16:
                    if match.currentGameNumber == 1 {
                        $match.point16Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point16Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point16Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point16Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point16Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point16Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 17:
                    if match.currentGameNumber == 1 {
                        $match.point17Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point17Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point17Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point17Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point17Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point17Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 18:
                    if match.currentGameNumber == 1 {
                        $match.point18Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point18Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point18Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point18Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point18Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point18Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 19:
                    if match.currentGameNumber == 1 {
                        $match.point19Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point19Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point19Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point19Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point19Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point19Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 20:
                    if match.currentGameNumber == 1 {
                        $match.point20Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point20Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point20Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point20Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point20Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point20Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 21:
                    if match.currentGameNumber == 1 {
                        $match.point21Game1ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point21Game2ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point21Game3ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
                        } else {
                            $match.point21Game3ImageTm2.wrappedValue = Constants.BOX_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point21Game4ImageTm2.wrappedValue = Constants.BOX_RIGHT_ONLY_END_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point21Game5ImageTm2.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                default:
                    print("Error setting image in switch statement of pointScored()")
                }
            }
            
            // End if player 3 serving
        }
        
        else if  match.servingPlayerNumber == 4 {
            $match.games[match.currentGameNumber - 1].player4Points.wrappedValue += 1
            // Player 2 Team 2 is serving as second server on Team 2
            if scoresheetManager.isSecondServer {
                // Second server uses backslash to mark points - "squareleftbackslash"
                
                //print("    > > > gameScoreTeam2 in pointScored()[7]: \(match.gameScoreTeam2)")
                switch match.games[match.currentGameNumber - 1].gameScoreTeam2 {
                case 1:
                    if match.currentGameNumber == 1 {
                        $match.point1Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point1Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point1Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point1Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point1Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 2:
                    if match.currentGameNumber == 1 {
                        $match.point2Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point2Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point2Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point2Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point2Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 3:
                    if match.currentGameNumber == 1 {
                        $match.point3Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point3Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point3Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point3Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point3Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 4:
                    if match.currentGameNumber == 1 {
                        $match.point4Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point4Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point4Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point4Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point4Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 5:
                    if match.currentGameNumber == 1 {
                        $match.point5Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point5Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point5Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point5Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point5Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 6:
                    if match.currentGameNumber == 1 {
                        $match.point6Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point6Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point6Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point6Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point6Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 7:
                    if match.currentGameNumber == 1 {
                        $match.point7Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point7Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point7Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point7Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point7Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 8:
                    if match.currentGameNumber == 1 {
                        $match.point8Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point8Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point8Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point8Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point8Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 9:
                    if match.currentGameNumber == 1 {
                        $match.point9Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point9Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point9Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point9Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point9Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 10:
                    if match.currentGameNumber == 1 {
                        $match.point10Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point10Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point10Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point10Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point10Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 11:
                    if match.currentGameNumber == 1 {
                        $match.point11Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point11Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point11Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point11Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point11Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 12:
                    if match.currentGameNumber == 1 {
                        $match.point12Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point12Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point12Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point12Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point12Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 13:
                    if match.currentGameNumber == 1 {
                        $match.point13Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point13Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point13Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point13Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point13Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 14:
                    if match.currentGameNumber == 1 {
                        $match.point14Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point14Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point14Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point14Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point14Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 15:
                    if match.currentGameNumber == 1 {
                        $match.point15Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point15Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point15Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point15Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point15Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 16:
                    if match.currentGameNumber == 1 {
                        $match.point16Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point16Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point16Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point16Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point16Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 17:
                    if match.currentGameNumber == 1 {
                        $match.point17Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point17Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point17Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point17Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point17Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 18:
                    if match.currentGameNumber == 1 {
                        $match.point18Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point18Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point18Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point18Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point18Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 19:
                    if match.currentGameNumber == 1 {
                        $match.point19Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point19Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point19Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point19Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point19Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 20:
                    if match.currentGameNumber == 1 {
                        $match.point20Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point20Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point20Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point20Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point20Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 21:
                    if match.currentGameNumber == 1 {
                        $match.point21Game1ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point21Game2ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_BACK_SLASH
                    } else if match.currentGameNumber == 3 {
                        $match.point21Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    } else if match.currentGameNumber == 4 {
                        $match.point21Game4ImageTm2.wrappedValue = Constants.BOX_RIGHT_ONLY_END_BACK_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point21Game5ImageTm2.wrappedValue = Constants.BOX_BACK_SLASH
                    }
                    
                default:
                    print("Error setting image in switch statement of pointScored()")
                }
            } else {
                // Player 2 Team 2 is serving as first server on Team 2
                // First server uses forwardslash to mark points - "squareleftfwdslash"
                //print("    > > > gameScoreTeam2 in pointScored() [8]: \(match.gameScoreTeam2)")
                switch match.games[match.currentGameNumber - 1].gameScoreTeam2 {
                case 1:
                    if match.currentGameNumber == 1 {
                        $match.point1Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point1Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point1Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point1Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point1Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point1Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 2:
                    if match.currentGameNumber == 1 {
                        $match.point2Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point2Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point2Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point2Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point2Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point2Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 3:
                    if match.currentGameNumber == 1 {
                        $match.point3Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point3Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point3Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point3Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point3Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point3Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 4:
                    if match.currentGameNumber == 1 {
                        $match.point4Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point4Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point4Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point4Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point4Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point4Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 5:
                    if match.currentGameNumber == 1 {
                        $match.point5Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point5Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point5Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point5Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point5Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point5Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 6:
                    if match.currentGameNumber == 1 {
                        $match.point6Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point6Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point6Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point6Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point6Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point6Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 7:
                    if match.currentGameNumber == 1 {
                        $match.point7Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point7Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point7Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point7Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point7Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point7Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 8:
                    if match.currentGameNumber == 1 {
                        $match.point8Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point8Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point8Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point8Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point8Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point8Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 9:
                    if match.currentGameNumber == 1 {
                        $match.point9Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point9Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point9Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point9Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point9Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point9Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 10:
                    if match.currentGameNumber == 1 {
                        $match.point10Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point10Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point10Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point10Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point10Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point10Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 11:
                    if match.currentGameNumber == 1 {
                        $match.point11Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point11Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point11Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point11Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point11Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point11Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_BACK_SLASH
                    }
                case 12:
                    if match.currentGameNumber == 1 {
                        $match.point12Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point12Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point12Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point12Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point12Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point12Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 13:
                    if match.currentGameNumber == 1 {
                        $match.point13Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point13Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point13Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point13Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point13Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point13Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 14:
                    if match.currentGameNumber == 1 {
                        $match.point14Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point14Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point14Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point14Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point14Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point14Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 15:
                    if match.currentGameNumber == 1 {
                        $match.point15Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point15Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point15Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point15Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point15Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point15Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 16:
                    if match.currentGameNumber == 1 {
                        $match.point16Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point16Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point16Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point16Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point16Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point16Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 17:
                    if match.currentGameNumber == 1 {
                        $match.point17Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point17Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point17Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point17Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point17Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point17Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 18:
                    if match.currentGameNumber == 1 {
                        $match.point18Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point18Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point18Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point18Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point18Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point18Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 19:
                    if match.currentGameNumber == 1 {
                        $match.point19Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point19Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point19Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point19Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point19Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point19Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 20:
                    if match.currentGameNumber == 1 {
                        $match.point20Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point20Game2ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point20Game3ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
                        } else {
                            $match.point20Game3ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point20Game4ImageTm2.wrappedValue = Constants.BOX_LEFT_ONLY_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point20Game5ImageTm2.wrappedValue = Constants.BOX_BOTTOM_LEFT_FORWARD_SLASH
                    }
                case 21:
                    if match.currentGameNumber == 1 {
                        $match.point21Game1ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
                    } else if match.currentGameNumber == 2 {
                        $match.point21Game2ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
                    } else if match.currentGameNumber == 3 {
                        if match.selectedMatchFormat == 3 {
                            $match.point21Game3ImageTm2.wrappedValue = Constants.BOX_RIGHT_END_FORWARD_SLASH
                        } else {
                            $match.point21Game3ImageTm2.wrappedValue = Constants.BOX_FORWARD_SLASH
                        }
                    } else if match.currentGameNumber == 4 {
                        $match.point21Game4ImageTm2.wrappedValue = Constants.BOX_RIGHT_ONLY_END_FORWARD_SLASH
                    } else if match.currentGameNumber == 5 {
                        $match.point21Game5ImageTm2.wrappedValue = Constants.BOX_FORWARD_SLASH
                    }
                default:
                    print("Error setting image in switch statement of pointScored()")
                }
            }
            
            // End if player 4 serving
        }
        
    }
    
}
