//
//  MatchManagerMatchExtension.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/20/22.
//

import RealmSwift
import SwiftUI

extension MatchView {
 
    
    
    func sideOut() {
       
        if match.servingPlayerNumber == 1 || match.servingPlayerNumber == 2 {
            // In here Team 1 was serving at sideout
            $match.games[match.currentGameNumber - 1].sideOutsTeam1.wrappedValue += 1
            switch match.games[match.currentGameNumber - 1].gameScoreTeam1 {
            case 0:
                if match.currentGameNumber == 1 {
                    $match.games[0].isSideoutPoint0Game1Team1.wrappedValue = true
                }
            case 1:
                if match.currentGameNumber == 1 {
                    $match.games[0].isSideoutPoint1Game1Team1.wrappedValue = true
                }
            case 2:
                if match.currentGameNumber == 1 {
                    $match.games[0].isSideoutPoint2Game1Team1.wrappedValue = true
                }
            case 3:
                if match.currentGameNumber == 1 {
                    $match.games[0].isSideoutPoint3Game1Team1.wrappedValue = true
                }
            case 4:
                if match.currentGameNumber == 1 {
                    $match.games[0].isSideoutPoint4Game1Team1.wrappedValue = true
                }
            case 5:
                if match.currentGameNumber == 1 {
                    $match.games[0].isSideoutPoint5Game1Team1.wrappedValue = true
                }
            case 6:
                if match.currentGameNumber == 1 {
                    $match.games[0].isSideoutPoint6Game1Team1.wrappedValue = true
                }
            case 7:
                if match.currentGameNumber == 1 {
                    $match.games[0].isSideoutPoint7Game1Team1.wrappedValue = true
                }
            default:
                print("Error setting image in switch statement of pointScored()")
            }
        } else if match.servingPlayerNumber == 3 || match.servingPlayerNumber == 4 {
            // In here Team 2 was serving at sideout
            $match.games[match.currentGameNumber - 1].sideOutsTeam2.wrappedValue += 1
            switch match.games[match.currentGameNumber - 1].gameScoreTeam2 {
            case 0:
                if match.currentGameNumber == 1 {
                    $match.games[0].isSideoutPoint0Game1Team2.wrappedValue = true
                }
            case 1:
                if match.currentGameNumber == 1 {
                    $match.games[0].isSideoutPoint1Game1Team2.wrappedValue = true
                }
            case 2:
                if match.currentGameNumber == 1 {
                    $match.games[0].isSideoutPoint2Game1Team2.wrappedValue = true
                }
            case 3:
                if match.currentGameNumber == 1 {
                    $match.games[0].isSideoutPoint3Game1Team2.wrappedValue = true
                }
            case 4:
                if match.currentGameNumber == 1 {
                    $match.games[0].isSideoutPoint4Game1Team2.wrappedValue = true
                }
            case 5:
                if match.currentGameNumber == 1 {
                    $match.games[0].isSideoutPoint5Game1Team2.wrappedValue = true
                }
            case 6:
                if match.currentGameNumber == 1 {
                    $match.games[0].isSideoutPoint6Game1Team2.wrappedValue = true
                }
            case 7:
                if match.currentGameNumber == 1 {
                    $match.games[0].isSideoutPoint7Game1Team2.wrappedValue = true
                }
            default:
                print("Error setting image in switch statement of pointScored()")
            }
        }
        
        
        // Set server to the next server
        setWhoIsServing()
        // Set isSecondServer value to false
        //$match.isSecondServer.wrappedValue = false
        $match.isSecondServer.wrappedValue.toggle()
        $match.whoIsServingText.wrappedValue = "1st Server"
        
        // Team Service game is over so change value for isTeam1Serving
        $match.isTeam1Serving.wrappedValue.toggle()
        $match.isServingLeftSide.wrappedValue.toggle()
        updateScore()
    }
    

    
    func setWhoIsServing() {
        
        switch match.servingPlayerNumber {
        case 1:
            //print("\nStarting case 1 of setWhoIsServing()")
            //print("gameScoreTeam2 in case 1: \(match.games[match.currentGameNumber - 1].gameScoreTeam2)")
            //print("isSecondServer in case 1: \(match.isSecondServer)")
            if match.isSecondServer {
                //print("In if match.isSecondServer of case 1")
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam2) % 2) == 0 {
                    $match.servingPlayerNumber.wrappedValue = 3
                    //print("Player1Team1 was serving, server is set to Player1Team2")
                } else {
                    $match.servingPlayerNumber.wrappedValue = 4
                    //print("Player1Team1 was serving, server is set to Player2Team2")
                }
            } else {
                //print("In else of if match.isSecondServer of case 1")
                $match.servingPlayerNumber.wrappedValue = 2
                //print("Player1Team1 was serving, server is set to Player2Team1")
            }
        case 2:
            //print("\nStarting case 2 of setWhoIsServing()")
            //print("gameScoreTeam2 in case 2: \(match.games[match.currentGameNumber - 1].gameScoreTeam2)")
            if match.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam2) % 2) == 0 {
                    $match.servingPlayerNumber.wrappedValue = 3
                    //print("Player2Team1 was serving, server is set to Player1Team2")
                } else {
                    $match.servingPlayerNumber.wrappedValue = 4
                    //print("Player2Team1 was serving, server is set to Player2Team2")
                }
            } else {
                $match.servingPlayerNumber.wrappedValue = 1
                //print("Player2Team1 was serving, server is set to Player1Team1")
            }
        case 3:
            //print("\nStarting case 3 of setWhoIsServing()")
            //print("gameScoreTeam1: \(match.games[match.currentGameNumber - 1].gameScoreTeam1)")
            if match.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam1) % 2) == 0 {
                    $match.servingPlayerNumber.wrappedValue = 1
                    //print("Player1Team2 was serving, server is set to Player1Team1")
                } else {
                    $match.servingPlayerNumber.wrappedValue = 2
                    //print("Player1Team2 was serving, server is set to Player2Team1")
                }
            } else {
                $match.servingPlayerNumber.wrappedValue = 4
                //print("Player1Team2 was serving, server is set to Player2Team2")
            }
        case 4:
            //print("\nStarting case 4 of setWhoIsServing()")
            //print("gameScoreTeam1: \(match.games[match.currentGameNumber - 1].gameScoreTeam1)")
            if match.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam2) % 2) == 0 {
                    $match.servingPlayerNumber.wrappedValue = 1
                    //print("Player2Team2 was serving, server is set to Player1Team1")
                } else {
                    $match.servingPlayerNumber.wrappedValue = 2
                    //print("Player2Team2 was serving, server is set to Player2Team1")
                }
            } else {
                $match.servingPlayerNumber.wrappedValue = 3
                //print("Player2Team2 was serving, server is set to Player1Team2")
            }
        default:
            print("Error in function setWhoIsServing()")
        }
    }
    
    

    
    func isGameWinner() -> Bool {
        
        //@ObservedRealmObject var match: Match
        
        let tm1Score = (match.games[match.currentGameNumber - 1].player1Team1Points) + (match.games[match.currentGameNumber - 1].player2Team1Points)
        let tm2Score = (match.games[match.currentGameNumber - 1].player1Team2Points) + (match.games[match.currentGameNumber - 1].player2Team2Points)
        
        if match.selectedGameFormat == 7 {
            if (tm1Score > 6) || (tm2Score > 6) {
                let largest = max(tm1Score, tm2Score)
                if  largest == tm1Score {
                    if tm1Score - tm2Score > 1 {
                        $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm1Score) | \(tm2Score)"
                        $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                        $match.games[match.currentGameNumber - 1].gameWinningTeam.wrappedValue = 1
                        return true
                    }
                } else if largest == tm2Score {
                    if tm2Score - tm2Score > 1 {
                        $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm2Score) | \(tm1Score)"
                        $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                        $match.games[match.currentGameNumber - 1].gameWinningTeam.wrappedValue = 2
                        return true
                    }
                }
            }
            return false
        } else if match.selectedGameFormat == 11 {
            if (tm1Score > 10) || (tm2Score > 10) {
                let largest = max(tm1Score, tm2Score)
                if  largest == tm1Score {
                    if tm1Score - tm2Score > 1 {
                        $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm1Score) | \(tm2Score)"
                        $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                        $match.games[match.currentGameNumber - 1].gameWinningTeam.wrappedValue = 1
                        return true
                    }
                } else if largest == tm2Score {
                    if tm2Score - tm1Score > 1 {
                        $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm2Score) | \(tm1Score)"
                        $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                        $match.games[match.currentGameNumber - 1].gameWinningTeam.wrappedValue = 2
                        return true
                    }
                }
            }
            return false
        } else if match.selectedGameFormat == 15 {
            if (tm1Score > 14) || (tm2Score > 14) {
                let largest = max(tm1Score, tm2Score)
                if  largest == tm1Score {
                    if tm1Score - tm2Score > 1 {
                        $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm1Score) | \(tm2Score)"
                        $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                        $match.games[match.currentGameNumber - 1].gameWinningTeam.wrappedValue = 1
                    }
                } else if largest == tm2Score {
                    if tm2Score - tm2Score > 1 {
                        $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm2Score) | \(tm1Score)"
                        $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                        $match.games[match.currentGameNumber - 1].gameWinningTeam.wrappedValue = 2
                        return true
                    }
                }
            }
            return false
        } else if match.selectedGameFormat == 21 {
            if (tm1Score > 20) || (tm2Score > 20) {
                let largest = max(tm1Score, tm2Score)
                if  largest == tm1Score {
                    if tm1Score - tm2Score > 1 {
                        $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm1Score) | \(tm2Score)"
                        $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                        $match.games[match.currentGameNumber - 1].gameWinningTeam.wrappedValue = 1
                        return true
                    }
                } else if largest == tm2Score {
                    if tm2Score - tm2Score > 1 {
                        $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm2Score) | \(tm1Score)"
                        $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                        $match.games[match.currentGameNumber - 1].gameWinningTeam.wrappedValue = 2
                        return true
                    }
                }
            }
            return false
        }
        
        return false

    }
    

    
    func isMatchWinner() -> Bool {
        
        var gamesWonTeam1 = 0
        var gamesWonTeam2 = 0
        
        if match.selectedMatchFormat == 1 {
            if match.games[match.currentGameNumber - 1].isGameWinner {
                $match.isMatchWinner.wrappedValue = true
                $match.isMatchCompleted.wrappedValue = true
                if match.games[match.currentGameNumber - 1].gameWinningTeam == 1 {
                    $match.matchWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                } else {
                    $match.matchWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                }
                return true
            }
        } else if match.selectedMatchFormat == 2 {
            
            if match.games[0].isGameWinner {
                if match.games[0].gameWinningTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            if match.games[1].isGameWinner {
                if match.games[1].gameWinningTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            if match.games[2].isGameWinner {
                if match.games[2].gameWinningTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            
            if gamesWonTeam1 == 2 {
                $match.isMatchWinner.wrappedValue = true
                $match.isMatchCompleted.wrappedValue = true
                $match.matchWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                gamesWonTeam1 = 0
                gamesWonTeam2 = 0
                return true
            } else if gamesWonTeam2 == 2 {
                $match.isMatchWinner.wrappedValue = true
                $match.isMatchCompleted.wrappedValue = true
                $match.matchWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                gamesWonTeam1 = 0
                gamesWonTeam2 = 0
                return true
            }
        } else if match.selectedMatchFormat == 3 {
            if match.games[0].isGameWinner {
                if match.games[0].gameWinningTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            if match.games[1].isGameWinner {
                if match.games[1].gameWinningTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            if match.games[2].isGameWinner {
                if match.games[2].gameWinningTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            if match.games[3].isGameWinner {
                if match.games[3].gameWinningTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            if match.games[4].isGameWinner {
                if match.games[4].gameWinningTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            if match.games[5].isGameWinner {
                if match.games[5].gameWinningTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            
            if gamesWonTeam1 == 3 {
                $match.isMatchWinner.wrappedValue = true
                $match.isMatchCompleted.wrappedValue = true
                $match.matchWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                gamesWonTeam1 = 0
                gamesWonTeam2 = 0
                return true
            } else if gamesWonTeam2 == 3 {
                $match.isMatchWinner.wrappedValue = true
                $match.isMatchCompleted.wrappedValue = true
                $match.matchWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                gamesWonTeam1 = 0
                gamesWonTeam2 = 0
                return true
            }
        }
        
        return false
    }
}

