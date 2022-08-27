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
            - Set the gameEndDataValue to the current Date.
            - Set the gameDuration which is calculated based on the gameEndDateValue by gameComputedDuration.
            - Set the images for all unused boxes for game to horizontal line image
         */
        
        // Set final values in current game
        $match.games[match.currentGameArrayIndex].isGameWinner.wrappedValue = true
        $match.games[match.currentGameArrayIndex].isGameCompleted.wrappedValue = true
        $match.games[match.currentGameArrayIndex].gameEndDateValue.wrappedValue = Date.now
        $match.games[match.currentGameArrayIndex].gameDuration.wrappedValue = match.games[match.currentGameArrayIndex].gameComputedDuration
        
        // Set the images for unused boxes in the game to horizontal line version
        
        
//        switch match.currentGameArrayIndex {
//        case 0:
//            // This is game 1
//            let winningPoint = match.games[match.currentGameArrayIndex].winningPointValue
//            ForEach ((winningPoint + 1)...21, id: \.self) { index in
//                switch index {
//                case 1:
//                    Text("")
//                    //$match.point1Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
//                }
//            }
           
            
                    
//        case 1:
//            let winningPoint = match.games[match.currentGameArrayIndex].winningPointValue
//        case 2:
//            let winningPoint = match.games[match.currentGameArrayIndex].winningPointValue
//        case 3:
//            let winningPoint = match.games[match.currentGameArrayIndex].winningPointValue
//        case 4:
//            let winningPoint = match.games[match.currentGameArrayIndex].winningPointValue
//        default:
//            print("Error setting images in closeGame() switch statement.")
//        }
        // Sample image setting code: $match.point10Game1ImageTm2.wrappedValue = Constants.BOX_LEFT_FORWARD_SLASH
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
        /*
         Determine if the game is over based on the score and determine the winner.
         If there is a winner:
         - Set the gameFinalScore value
         - Set the gameWinner value which is the names of the players on the winning team
         - Set the gameWinningTeam value which is either a 1 for Team 1 or a 2 for Team 2
         These values are set here and not in closeGame() becuase we already have determine which team won the game and we don't want to detrermine it again in closeGame()
         Other needed settings to close out a game are handled in closeGame()
         */
        let tm1Score = (match.games[match.currentGameArrayIndex].player1Team1Points) + (match.games[match.currentGameNumber - 1].player2Team1Points)
        let tm2Score = (match.games[match.currentGameArrayIndex].player1Team2Points) + (match.games[match.currentGameNumber - 1].player2Team2Points)
        
        if match.selectedGameFormat == 7 {
            if (tm1Score > 6) || (tm2Score > 6) {
                let largest = max(tm1Score, tm2Score)
                if  largest == tm1Score {
                    if tm1Score - tm2Score > 1 {
                        $match.games[match.currentGameArrayIndex].gameFinalScore.wrappedValue = "\(tm1Score) - \(tm2Score)"
                        $match.games[match.currentGameArrayIndex].gameWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                        $match.games[match.currentGameArrayIndex].gameWinningTeam.wrappedValue = 1
                        return true
                    }
                } else if largest == tm2Score {
                    if tm2Score - tm1Score > 1 {
                        $match.games[match.currentGameArrayIndex].gameFinalScore.wrappedValue = "\(tm2Score) - \(tm1Score)"
                        $match.games[match.currentGameArrayIndex].gameWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                        $match.games[match.currentGameArrayIndex].gameWinningTeam.wrappedValue = 2
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
                        $match.games[match.currentGameArrayIndex].gameFinalScore.wrappedValue = "\(tm1Score) - \(tm2Score)"
                        $match.games[match.currentGameArrayIndex].gameWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                        $match.games[match.currentGameArrayIndex].gameWinningTeam.wrappedValue = 1
                        return true
                    }
                } else if largest == tm2Score {
                    if tm2Score - tm1Score > 1 {
                        $match.games[match.currentGameArrayIndex].gameFinalScore.wrappedValue = "\(tm2Score) - \(tm1Score)"
                        $match.games[match.currentGameArrayIndex].gameWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                        $match.games[match.currentGameArrayIndex].gameWinningTeam.wrappedValue = 2
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
                        $match.games[match.currentGameArrayIndex].gameFinalScore.wrappedValue = "\(tm1Score) - \(tm2Score)"
                        $match.games[match.currentGameArrayIndex].gameWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                        $match.games[match.currentGameArrayIndex].gameWinningTeam.wrappedValue = 1
                    }
                } else if largest == tm2Score {
                    if tm2Score - tm1Score > 1 {
                        $match.games[match.currentGameArrayIndex].gameFinalScore.wrappedValue = "\(tm2Score) - \(tm1Score)"
                        $match.games[match.currentGameArrayIndex].gameWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                        $match.games[match.currentGameArrayIndex].gameWinningTeam.wrappedValue = 2
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
                        $match.games[match.currentGameArrayIndex].gameFinalScore.wrappedValue = "\(tm1Score) - \(tm2Score)"
                        $match.games[match.currentGameArrayIndex].gameWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                        $match.games[match.currentGameArrayIndex].gameWinningTeam.wrappedValue = 1
                        return true
                    }
                } else if largest == tm2Score {
                    if tm2Score - tm1Score > 1 {
                        $match.games[match.currentGameArrayIndex].gameFinalScore.wrappedValue = "\(tm2Score) - \(tm1Score)"
                        $match.games[match.currentGameArrayIndex].gameWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                        $match.games[match.currentGameArrayIndex].gameWinningTeam.wrappedValue = 2
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
        - Set the gameStartingServerPlayerNumber for the team serving first in the new game, based on who (which team) served first in the prior game.
        - Set the gameStartingServerName for the new game, again based on who served first in the prior game.
        - Set the match servingPlayerNumber based on who was serving when the game ended.
        - Set the currentGameNumber in the match by udpating the currentGameArrayIndex by 1.
        - Set which team is serving in the new game based on which team served first in the pior game.
        - Set the isServerSideSet to true (from default of false so that user will not be asked to set the value with alert.
        - Update the score (to 0-0-2) to start the new game by calling upateScore().
        - The value games[currentGameNumber - 1] when this function starts is the game that just ended.
        - The value games[currentGameArrayIndex] when this function starts is the game that just ended.
        - The value games[currentGameNumber] when this function starts is the new game.
         */
        
        // Get the player number of the player that was the first server in the game that just ended.
        let priorGame1stServerPlayerNumber = match.games[match.currentGameNumber - 1].gameFirstServerPlayerNumber
        
        // Set gameStartingServerPlayerNumber and gameStartingServerName for next game
        print("servingPlayerNumber at end of game in setUpNewGame: \(match.servingPlayerNumber)")
        // Set the first server values for the new game based on who was the first server (therefore which team served first) in the game that just ended.
        switch priorGame1stServerPlayerNumber {
        case 1, 2:
            // Set isTeam1Sereving to false since team 1 was the first serving team in the prior game
            $match.isTeam1Serving.wrappedValue = false
            // Set the gameStartingPlayerNumber for the new game as the selectedFirstServer for the team that will be serving first in the new game.
            // Then set the player information for the new first server based on who is the designated first server for that team.
            $match.games[match.currentGameArrayIndex + 1].gameFirstServerPlayerNumber.wrappedValue = match.games[match.currentGameArrayIndex + 1].selectedFirstServerTeam2
            if match.games[match.currentGameArrayIndex + 1].gameFirstServerPlayerNumber == 3 {
                $match.games[match.currentGameArrayIndex + 1].gameFirstServerPlayerNumber.wrappedValue = 3
                $match.games[match.currentGameArrayIndex + 1].gameFirstServerName.wrappedValue = match.namePlayer1Team2
                $match.servingPlayerNumber.wrappedValue = 3
            } else {
                $match.games[match.currentGameArrayIndex + 1].gameFirstServerPlayerNumber.wrappedValue = 4
                $match.games[match.currentGameArrayIndex + 1].gameFirstServerName.wrappedValue = match.namePlayer2Team2
                $match.servingPlayerNumber.wrappedValue = 4
            }
//            $match.games[match.currentGameNumber].gameFirstServerPlayerNumber.wrappedValue = match.games[match.currentGameNumber].selectedFirstServerTeam2
//            if match.games[match.currentGameNumber].gameFirstServerPlayerNumber == 3 {
//                $match.games[match.currentGameNumber].gameFirstServerPlayerNumber.wrappedValue = 3
//                $match.games[match.currentGameNumber].gameFirstServerName.wrappedValue = match.namePlayer1Team2
//                $match.servingPlayerNumber.wrappedValue = 3
//            } else {
//                $match.games[match.currentGameNumber].gameFirstServerPlayerNumber.wrappedValue = 4
//                $match.games[match.currentGameNumber].gameFirstServerName.wrappedValue = match.namePlayer2Team2
//                $match.servingPlayerNumber.wrappedValue = 4
//            }
        case 3, 4:
            // Set isTeam1Sereving to true since team 2 was the first serving team in the prior game
            $match.isTeam1Serving.wrappedValue = true
            $match.games[match.currentGameArrayIndex + 1].gameFirstServerPlayerNumber.wrappedValue = match.games[match.currentGameArrayIndex + 1].selectedFirstServerTeam1
            if match.games[match.currentGameArrayIndex + 1].gameFirstServerPlayerNumber == 1 {
                $match.games[match.currentGameArrayIndex + 1].gameFirstServerPlayerNumber.wrappedValue = 1
                $match.games[match.currentGameArrayIndex + 1].gameFirstServerName.wrappedValue = match.namePlayer1Team1
                $match.servingPlayerNumber.wrappedValue = 1
            } else {
                $match.games[match.currentGameArrayIndex + 1].gameFirstServerPlayerNumber.wrappedValue = 2
                $match.games[match.currentGameArrayIndex + 1].gameFirstServerName.wrappedValue = match.namePlayer2Team1
                $match.servingPlayerNumber.wrappedValue = 2
            }
//            $match.games[match.currentGameNumber].gameFirstServerPlayerNumber.wrappedValue = match.games[match.currentGameNumber].selectedFirstServerTeam1
//            if match.games[match.currentGameNumber].gameFirstServerPlayerNumber == 1 {
//                $match.games[match.currentGameNumber].gameFirstServerPlayerNumber.wrappedValue = 1
//                $match.games[match.currentGameNumber].gameFirstServerName.wrappedValue = match.namePlayer1Team1
//                $match.servingPlayerNumber.wrappedValue = 1
//            } else {
//                $match.games[match.currentGameNumber].gameFirstServerPlayerNumber.wrappedValue = 2
//                $match.games[match.currentGameNumber].gameFirstServerName.wrappedValue = match.namePlayer2Team1
//                $match.servingPlayerNumber.wrappedValue = 2
//            }
        default:
            print("Error setting first server for next game in isGameWinner().")
        }
        /*
         First serving team in new game is opposite team that served first in the prior game
         NO NO NO If serving team in prior game was Team 1, then set isTeam1Serving() to false
         Since other team takes the side of team that was serving when game ended, the arrow is pointing correctly for the next game since players change side.
         So don't need to change orientation of arrow, just the team (that is serving).
         Update the game array index value (currentGameArrayIndex) in March by increasing by 1
         Update the game number in March by increasing by 1
         Set the gameStartDateValue for the new game to a new Date.now.
         Set the isServerSideSet to true.
         Set the isSecondServer to true since in the first game of each match, the first person to serve is a second server.
         Set the whoIsServingText to "2nd Server" since the first server of the first game of a match is always the 2d Server.
         
         */
        
        
//        $match.currentGameNumber.wrappedValue = match.currentGameNumber + 1
        $match.currentGameNumber.wrappedValue += 1
        $match.currentGameArrayIndex.wrappedValue += 1
        $match.games[match.currentGameArrayIndex].gameStartDateValue.wrappedValue = Date.now
        $match.games[match.currentGameArrayIndex].isServerSideSet.wrappedValue = true
//        $match.games[match.currentGameNumber - 1].gameStartDateValue.wrappedValue = Date.now
//        $match.games[match.currentGameNumber - 1].isServerSideSet.wrappedValue = true
        $match.isSecondServer.wrappedValue = true
        $match.whoIsServingText.wrappedValue = "2nd Server"
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
         These changes can be made in MatchSetupView if needed
         - Team first server can change for a games if players choose, so
         - Set selectedFirstServerTeam1 if they change designated first server
         - Set selectedFirstServerTeam2 if they change designated first server
         - Change referee if needed
         - Change asst referee if needed
         - Change line judges if needed
         - Change trainee if needed
         - Change court number
         */
    }
    
    
    func setServingPlayerNumber() {
        
        switch match.servingPlayerNumber {
        case 1:
            if match.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam2) % 2) == 0 {
                    $match.servingPlayerNumber.wrappedValue = 3
                } else {
                    $match.servingPlayerNumber.wrappedValue = 4
                }
            } else {
                $match.servingPlayerNumber.wrappedValue = 2
            }
        case 2:
            if match.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam2) % 2) == 0 {
                    $match.servingPlayerNumber.wrappedValue = 3
                } else {
                    $match.servingPlayerNumber.wrappedValue = 4
                }
            } else {
                $match.servingPlayerNumber.wrappedValue = 1
            }
        case 3:
            if match.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam1) % 2) == 0 {
                    $match.servingPlayerNumber.wrappedValue = 1
                } else {
                    $match.servingPlayerNumber.wrappedValue = 2
                }
            } else {
                $match.servingPlayerNumber.wrappedValue = 4
            }
        case 4:
            if match.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam2) % 2) == 0 {
                    $match.servingPlayerNumber.wrappedValue = 1
                } else {
                    $match.servingPlayerNumber.wrappedValue = 2
                }
            } else {
                $match.servingPlayerNumber.wrappedValue = 3
            }
        default:
            print("Error in function setWhichServer()")
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

