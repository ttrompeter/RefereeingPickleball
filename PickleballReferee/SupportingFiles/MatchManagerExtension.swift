//
//  MatchManagerMatchExtension.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/20/22.
//

import RealmSwift
import SwiftUI

extension MatchView {
    
    func closeGame() {
        
        /*
         This function is called from updateScore() when there is a gameWinner.
         This game is over. To complete this game:
            - Set value of isGameWinner in the current game to true.
            - Set the value of isGameCompleted in the currrent game to true.
            - Set the gameFinalScore in the current game to the current score when game ended.
            - Set the gameWinner in the current game to the names of the players on the game winning team.
         */
        
        // Set final values in current game
        $match.games[match.currentGameNumber - 1].isGameWinner.wrappedValue = true
        $match.games[match.currentGameNumber - 1].isGameCompleted.wrappedValue = true
        let tm1ScoreValue = (match.games[match.currentGameNumber - 1].player1Team1Points) + (match.games[match.currentGameNumber - 1].player2Team1Points)
        let tm2ScoreValue = (match.games[match.currentGameNumber - 1].player1Team2Points) + (match.games[match.currentGameNumber - 1].player2Team2Points)
        if match.isTeam1Serving {
            $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm1ScoreValue) - \(tm2ScoreValue)"
        } else {
            $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm2ScoreValue) - \(tm1ScoreValue)"
        }
        switch match.servingPlayerNumber {
        case 1, 2:
            $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team1) - \(match.namePlayer2Team1)"
        case 3, 4:
            $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team2) - \(match.namePlayer2Team2)"
        default:
            print("Error setting gameWinner in isGameWinner of updateScore() in MatchView")
        }
    }
    
    func closeMatch() {
        print("     > > > closeMatch() function starting ...")
        
        /*
         - ALREADY SET IN isMatchWinner Set matchWinner of current match [= ""]
         - ALREADY SET IN isMatchWinner Set isMatchWinner of current match to true
         - ALREADY SET IN isMatchWinner Set isMatchCompleted of current match to trrue
         - ALREADY SET IN isMatchWinner Set matchWinningTeam of current match  [= 0]
         
         - Archive match data: save scoresheet, save statistics, save Match and Game objects?, save ??
         
         - ???? Create new match
         */
        
        
    }
    
    func isGameWinner() -> Bool {
        
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
                        $match.games[match.currentGameNumber - 1].isGameWinner.wrappedValue = true
                        return true
                    }
                } else if largest == tm2Score {
                    if tm2Score - tm1Score > 1 {
                        $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm2Score) | \(tm1Score)"
                        $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                        $match.games[match.currentGameNumber - 1].gameWinningTeam.wrappedValue = 2
                        $match.games[match.currentGameNumber - 1].isGameWinner.wrappedValue = true
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
                        $match.games[match.currentGameNumber - 1].isGameWinner.wrappedValue = true
                        return true
                    }
                } else if largest == tm2Score {
                    if tm2Score - tm1Score > 1 {
                        $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm2Score) | \(tm1Score)"
                        $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                        $match.games[match.currentGameNumber - 1].gameWinningTeam.wrappedValue = 2
                        $match.games[match.currentGameNumber - 1].isGameWinner.wrappedValue = true
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
                        $match.games[match.currentGameNumber - 1].isGameWinner.wrappedValue = true
                    }
                } else if largest == tm2Score {
                    if tm2Score - tm1Score > 1 {
                        $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm2Score) | \(tm1Score)"
                        $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                        $match.games[match.currentGameNumber - 1].gameWinningTeam.wrappedValue = 2
                        $match.games[match.currentGameNumber - 1].isGameWinner.wrappedValue = true
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
                        $match.games[match.currentGameNumber - 1].isGameWinner.wrappedValue = true
                        return true
                    }
                } else if largest == tm2Score {
                    if tm2Score - tm1Score > 1 {
                        $match.games[match.currentGameNumber - 1].gameFinalScore.wrappedValue = "\(tm2Score) | \(tm1Score)"
                        $match.games[match.currentGameNumber - 1].gameWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                        $match.games[match.currentGameNumber - 1].gameWinningTeam.wrappedValue = 2
                        $match.games[match.currentGameNumber - 1].isGameWinner.wrappedValue = true
                        return true
                    }
                }
            }
            return false
        }
        return false

    }
    
    func isMatchWinner() -> Bool {
        
        print("Starting isMatchWinner()")
        var gamesWonTeam1 = 0
        var gamesWonTeam2 = 0
        
        if match.selectedMatchFormat == 1 {
            if match.games[match.currentGameNumber - 1].isGameWinner {
                $match.isMatchWinner.wrappedValue = true
                $match.isMatchCompleted.wrappedValue = true
                if match.games[match.currentGameNumber - 1].gameWinningTeam == 1 {
                    $match.matchWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                    $match.matchWinningTeam.wrappedValue = 1
                } else {
                    $match.matchWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                    $match.matchWinningTeam.wrappedValue = 2
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
                $match.matchWinningTeam.wrappedValue = 1
                gamesWonTeam1 = 0
                gamesWonTeam2 = 0
                return true
            } else if gamesWonTeam2 == 2 {
                $match.isMatchWinner.wrappedValue = true
                $match.isMatchCompleted.wrappedValue = true
                $match.matchWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                $match.matchWinningTeam.wrappedValue = 2
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
                $match.matchWinningTeam.wrappedValue = 1
                gamesWonTeam1 = 0
                gamesWonTeam2 = 0
                return true
            } else if gamesWonTeam2 == 3 {
                $match.isMatchWinner.wrappedValue = true
                $match.isMatchCompleted.wrappedValue = true
                $match.matchWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                $match.matchWinningTeam.wrappedValue = 2
                gamesWonTeam1 = 0
                gamesWonTeam2 = 0
                return true
            }
        }
        
        return false
    }
    
    func setStartingServerName() -> String{
        switch match.servingPlayerNumber {
        case 0:
            return "Undetermined"
        case 1:
            return match.namePlayer1Team1
        case 3:
            return match.namePlayer1Team2
        default:
            print("Error in setting gameStartingServerDescription")
            return "Error"
        }
    }
    
    func setUpNewGame() {
        
        /*
        - Set the gameStartingServerPlayerNumber for the new game, based on who served first in the prior game. //was serving when the game ended.
        - Set the gameStartingServerName for the new game, based on who sereved first in the prior game.        //was serving when the game ended.
        - Set the match servingPlayerNumber based on who was serving when the game ended.
        - Set the currentGameNumber in the match by udpating the currentGameNumber by 1.
        - Set which team is serving in the new game by toggling the isTeam1Serving value in match.
        - Set the isServerSideSet to true (from default of false so that user will not be asked to set the value with alert.
        - Update the score (to 0-0-2) to start the new game by calling upateScore().
        - The value games[currentGameNumber - 1] is the game that just ended.
        - The value games[currentGameNumber] is the new game.
         */
        
        // Get the player number of the player that was the first server in the game that just ended.
        let priorGame1stServerPlayerNumber = match.games[match.currentGameNumber - 1].gameFirstServerPlayerNumber
        
        // Set gameStartingServerPlayerNumber and gameStartingServerName for next game
        print("servingPlayerNumber at end of game in setUpNewGame: \(match.servingPlayerNumber)")
        // Set the first server values for the new game based on who was the first server (therefore which team) in the game that just ended.
        switch priorGame1stServerPlayerNumber {
        case 1, 2:
            // Set the gameStartingPlayerNumber for the new game as the selectedFirstServer for the team that will be serving first in the new game.
            // Then set the player information for the new first server based on who is the designated first server for that team.
            $match.games[match.currentGameNumber].gameFirstServerPlayerNumber.wrappedValue = match.games[match.currentGameNumber].selectedFirstServerTeam2
            if match.games[match.currentGameNumber].gameFirstServerPlayerNumber == 3 {
                $match.games[match.currentGameNumber].gameFirstServerPlayerNumber.wrappedValue = 3
                $match.games[match.currentGameNumber].gameFirstServerName.wrappedValue = match.namePlayer1Team2
                $match.servingPlayerNumber.wrappedValue = 3
            } else {
                $match.games[match.currentGameNumber].gameFirstServerPlayerNumber.wrappedValue = 4
                $match.games[match.currentGameNumber].gameFirstServerName.wrappedValue = match.namePlayer2Team2
                $match.servingPlayerNumber.wrappedValue = 4
            }
        case 3, 4:
            $match.games[match.currentGameNumber].gameFirstServerPlayerNumber.wrappedValue = match.games[match.currentGameNumber].selectedFirstServerTeam1
            if match.games[match.currentGameNumber].gameFirstServerPlayerNumber == 1 {
                $match.games[match.currentGameNumber].gameFirstServerPlayerNumber.wrappedValue = 1
                $match.games[match.currentGameNumber].gameFirstServerName.wrappedValue = match.namePlayer1Team1
                $match.servingPlayerNumber.wrappedValue = 1
            } else {
                $match.games[match.currentGameNumber].gameFirstServerPlayerNumber.wrappedValue = 2
                $match.games[match.currentGameNumber].gameFirstServerName.wrappedValue = match.namePlayer2Team1
                $match.servingPlayerNumber.wrappedValue = 2
            }
        default:
            print("Error setting first server for next game in isGameWinner().")
        }
        /*
         Serving team in new game is opposite team that served the current game
         If serving team in prior game was Team 1, then set isTeam1Serving() to false
         Since other team takes the side of team that was serving when game ended, the arrow is pointing correctly.
         So don't need to change orientation of arrow, just the team (that is serving).
         Set the isServerSideSet to true.
         Set the isSecondServer to true.
         Set the whoIsServingText to "2nd Server" since the first server of each game is always the 2d Server.
         Update the game number by increasing by 1
         */
        
        if priorGame1stServerPlayerNumber == 1 || priorGame1stServerPlayerNumber == 2 {
            $match.isTeam1Serving.wrappedValue = false
        }
        
        $match.games[match.currentGameNumber - 1].isServerSideSet.wrappedValue = true
        $match.isSecondServer.wrappedValue = true
        $match.whoIsServingText.wrappedValue = "2d Server"
        $match.currentGameNumber.wrappedValue = match.currentGameNumber + 1
        updateScore()
        
//        print("")
//        print("     in isGameWinner() of updateScore() in MatchView")
//        print("isTeam1Serving after set for new game: \(match.isTeam1Serving)")
//        print("whoIsServing after set for new game: \(match.whoIsServingText)")
//        print("servingPlayerNumber after set for new game: \(match.servingPlayerNumber)")
//        print("selectedFirstServerTeam1 after set for new game: \(match.games[match.currentGameNumber - 1].selectedFirstServerTeam1)")
//        print("selectedFirstServerTeam2 after set for new game: \(match.games[match.currentGameNumber - 1].selectedFirstServerTeam2)")
//        print("")
        
        
        /*
         These chagnes can be made in MatchSetupView if needed
         - Set selectedFirstServerTeam1 for next game  [ = 0 ]
         - Set selectedFirstServerTeam2 for next game  [ = 0 ]
         - Team first server can change for neet games if players choose
         - Update referee if needed
         - Update asst referee if needed
         - Update line judges if needed
         - Update trainee if needed
         */
    }
    
    
    func setWhichServer() {
        
        switch match.servingPlayerNumber {
        case 1:
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
    
    func updateScore() {

        let tm1Score = (match.games[match.currentGameNumber - 1].player1Team1Points) + (match.games[match.currentGameNumber - 1].player2Team1Points)
        let tm2Score = (match.games[match.currentGameNumber - 1].player1Team2Points) + (match.games[match.currentGameNumber - 1].player2Team2Points)
        let server = match.isSecondServer == true ? "2" : "1"

        if match.isTeam1Serving {
            $match.scoreDisplay.wrappedValue = "\(tm1Score) - \(tm2Score) - \(server)"
        } else {
            $match.scoreDisplay.wrappedValue = "\(tm2Score) - \(tm1Score) - \(server)"
        }

        // Determine if there is a game winner every time the score is updated.
        if isGameWinner() {
            // Game is over so close out the current game.
            closeGame()

//            if isMatchWinner() {
//                print("There is a match winner in updateScore()")
//                closeMatch()
//            }
        }
    }
    
}

