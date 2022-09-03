//
//  MatchManagerMatchExtension.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/20/22.
//

import RealmSwift
import SwiftUI
import UIKit

extension MatchView {
    
    
    func calculateMatchFinalGameScores() {
        // Prepare a string of the Game scores for the Match in proper format based on winning team and set it in scoresheetManager.matchFinalGameScores
        var game1Display = "0 - 0"
        var game2Display = "0 - 0"
        var game3Display = "0 - 0"
        var game4Display = "0 - 0"
        var game5Display = "0 - 0"
        
        if match.matchWinningTeam == 1 {
            if match.games[0].gameWinningTeam == 1 {
                game1Display = match.games[0].gameFinalScore
            } else {
                // Reverse the score
                game1Display = reverseGameScore(gameScore: match.games[0].gameFinalScore)
            }
            if match.games[1].gameWinningTeam == 1 {
                game2Display = match.games[1].gameFinalScore
            } else {
                // Reverse the score
                game1Display = reverseGameScore(gameScore: match.games[1].gameFinalScore)
            }
            if match.games[2].gameWinningTeam == 1 {
                game3Display = match.games[2].gameFinalScore
            } else {
                // Reverse the score
                game1Display = reverseGameScore(gameScore: match.games[2].gameFinalScore)
            }
            if match.games[3].gameWinningTeam == 1 {
                game4Display = match.games[3].gameFinalScore
            } else {
                // Reverse the score
                game1Display = reverseGameScore(gameScore: match.games[3].gameFinalScore)
            }
            if match.games[4].gameWinningTeam == 1 {
                game5Display = match.games[4].gameFinalScore
            } else {
                // Reverse the score
                game1Display = reverseGameScore(gameScore: match.games[4].gameFinalScore)
            }
        } else {
            // Team 2 won the match
            if match.games[0].gameWinningTeam == 2 {
                game1Display = match.games[0].gameFinalScore
            } else {
                // Reverse the score
                game1Display = reverseGameScore(gameScore: match.games[0].gameFinalScore)
            }
            if match.games[1].gameWinningTeam == 2 {
                game2Display = match.games[1].gameFinalScore
            } else {
                // Reverse the score
                game1Display = reverseGameScore(gameScore: match.games[1].gameFinalScore)
            }
            if match.games[2].gameWinningTeam == 2 {
                game3Display = match.games[2].gameFinalScore
            } else {
                // Reverse the score
                game1Display = reverseGameScore(gameScore: match.games[2].gameFinalScore)
            }
            if match.games[3].gameWinningTeam == 2 {
                game4Display = match.games[3].gameFinalScore
            } else {
                // Reverse the score
                game1Display = reverseGameScore(gameScore: match.games[3].gameFinalScore)
            }
            if match.games[4].gameWinningTeam == 2 {
                game5Display = match.games[4].gameFinalScore
            } else {
                // Reverse the score
                game1Display = reverseGameScore(gameScore: match.games[4].gameFinalScore)
            }
        }
        let matchGamesDisplay = game1Display + "  " + game2Display + "  " + game3Display + "  " + game4Display + "  " + game5Display
        scoresheetManager.matchFinalGameScores = matchGamesDisplay
    }
    
    func reverseGameScore(gameScore: String) -> String {
        
        var firstScore = ""
        var secondScore = ""
        var components = gameScore.components(separatedBy: " - ")
        if components.count > 0 {
            firstScore = components.removeFirst()
            secondScore = components.joined(separator: " ")
        }
        return "\(secondScore) - \(firstScore)"
    }
    
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
         - Set match final score
         - Set value of isMatchStarted in scoresheetManager to false so Start Match button will show
         - NO      Archive the screenshot image of the scoresheet from diretory file as 'screenshot.png' to a unique name
         - Archive match data: save scoresheet, save statistics, save Match and Game objects?, save ??
         
         - ALREADY SET IN isMatchWinner: matchWinner of current match [= ""]
         - ALREADY SET IN isMatchWinner: isMatchWinner for current match to true
         - ALREADY SET IN isMatchWinner: isCompleted for current match to true
         - ALREADY SET IN isMatchWinner: matchWinningTeam of current match  [= 0]
         
         */
        
        // This is for display of game score in the Scoring section of MatchView underneath the score.
        calculateMatchFinalGameScores()
        
        // Calcualte match final score and save it in the Match
        var matchResult = "0-0"
        var team1Games = 0
        var team2Games = 0
        if match.games[0].gameWinningTeam == 1 {
            team1Games += 1
        } else if match.games[0].gameWinningTeam == 2 {
            team2Games += 1
        }
        if match.games[1].gameWinningTeam == 1 {
            team1Games += 1
        } else if match.games[1].gameWinningTeam == 2 {
            team2Games += 1
        }
        if match.games[2].gameWinningTeam == 1 {
            team1Games += 1
        } else if match.games[2].gameWinningTeam == 2 {
            team2Games += 1
        }
        if match.games[3].gameWinningTeam == 1 {
            team1Games += 1
        } else if match.games[3].gameWinningTeam == 2 {
            team2Games += 1
        }
        if match.games[4].gameWinningTeam == 1 {
            team1Games += 1
        } else if match.games[4].gameWinningTeam == 2 {
            team2Games += 1
        }
        if team1Games > team2Games {
            matchResult = "\(team1Games) - \(team2Games)"
        } else {
            matchResult = "\(team2Games) - \(team1Games)"
        }
        $match.matchFinalScore.wrappedValue = matchResult

        // Set isMatchStarted to false so Start Match button will show
        $scoresheetManager.isMatchStarted.wrappedValue = false
        
//        // Archive the screenshot image so it will be available to the match when open that match from archive
//        // Get existing screenshot image
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let imageUrl = paths[0].appendingPathComponent("scoresheet.png")
//        let matchUIImage = UIImage(contentsOfFile: imageUrl.path)
//        print("matchUIImage returned: \(String(describing: matchUIImage))")
//        if matchUIImage != nil {
//            // Create unique name and then save the image with the new name (and therefore location in documents)
//            let name = "scoresheet\(UUID().uuidString).png"
//            let fileURL = paths[0].appendingPathComponent(name)
//            guard let data = matchUIImage!.pngData() else { return }
//            do {
//                try data.write(to: fileURL)
//                print("Renamed screenshot saved at path \(fileURL.absoluteString)")
//            }
//            catch (let error) {
//                print("Error \(error.localizedDescription)")
//            }
//            $match.screenshotName.wrappedValue = name
//            print("screenshotLocation: \(match.screenshotName)")
//        } else {
//            print("Error saving screenshot for arhive")
//        }
        
        
        // Create an save ArchivedMatch object
        let archivedMatch = ArchivedMatch()
        archivedMatch.eventTitle = match.eventTitle
        archivedMatch.archiveDate = Date.now
        archivedMatch.matchDate = match.matchDate
        archivedMatch.matchFinalScore = match.matchFinalScore
        archivedMatch.matchNumber = match.matchNumber
        archivedMatch.namePlayer1Team1 = match.namePlayer1Team1
        archivedMatch.namePlayer2Team1 = match.namePlayer2Team1
        archivedMatch.namePlayer1Team2 = match.namePlayer1Team2
        archivedMatch.namePlayer2Team2 = match.namePlayer2Team2
        let docPaths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let scoresheetImageUrl = docPaths[0].appendingPathComponent("scoresheet.png")
        let scorsheetUIImage = UIImage(contentsOfFile: scoresheetImageUrl.path)
        guard let scoresheetImageData = scorsheetUIImage!.pngData() else { return }
        let statisticsImageUrl = docPaths[0].appendingPathComponent("statistics.png")
        let statisticsUIImage = UIImage(contentsOfFile: statisticsImageUrl.path)
        guard let statisticsImageData = statisticsUIImage!.pngData() else { return }
        archivedMatch.matchStatisticsImage = scoresheetImageData
        archivedMatch.scoresheetImage = statisticsImageData
        realmManager.saveArchivedMatch(archivedMatch)
        
        // Archived matches are limited to the last 20 matches (arbitrarily as a design decision based on display and memory concerens).
        // So delete oldest match if there are already 20 matches in the realm database so there will be room within the 20 limit for this match
        if archives.count > 20 {
            print("Archived match to delete: \(archives[0])")
            realmManager.removeArchivedMatch(archives[0])
        }
        
        
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
        let tm1Score = (match.games[match.currentGameArrayIndex].player1Points) + (match.games[match.currentGameNumber - 1].player2Points)
        let tm2Score = (match.games[match.currentGameArrayIndex].player3Points) + (match.games[match.currentGameNumber - 1].player4Points)
        
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
            if match.games[match.currentGameNumber - 1].isGameCompleted {
                $scoresheetManager.isMatchWinner.wrappedValue = true
                $match.isCompleted.wrappedValue = true
                if match.games[match.currentGameNumber - 1].gameWinningTeam == 1 {
                    $match.matchWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                    $match.matchWinningTeam.wrappedValue = 1
                    $match.matchLoser.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                } else {
                    $match.matchWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                    $match.matchWinningTeam.wrappedValue = 2
                    $match.matchLoser.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                }
                return true
            }
        } else if match.selectedMatchFormat == 2 {
            
            if match.games[0].isGameCompleted {
                if match.games[0].gameWinningTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            if match.games[1].isGameCompleted {
                if match.games[1].gameWinningTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            if match.games[2].isGameCompleted {
                if match.games[2].gameWinningTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            
            if gamesWonTeam1 == 2 {
                $scoresheetManager.isMatchWinner.wrappedValue = true
                $match.isCompleted.wrappedValue = true
                $match.matchWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                $match.matchWinningTeam.wrappedValue = 1
                $match.matchLoser.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                gamesWonTeam1 = 0
                gamesWonTeam2 = 0
                return true
            } else if gamesWonTeam2 == 2 {
                $scoresheetManager.isMatchWinner.wrappedValue = true
                $match.isCompleted.wrappedValue = true
                $match.matchWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                $match.matchWinningTeam.wrappedValue = 2
                $match.matchLoser.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                gamesWonTeam1 = 0
                gamesWonTeam2 = 0
                return true
            }
        } else if match.selectedMatchFormat == 3 {
            print("Starting else of match.selectedMatchFormat == 3")
            if match.games[0].isGameCompleted {
                if match.games[0].gameWinningTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            if match.games[1].isGameCompleted {
                if match.games[1].gameWinningTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            if match.games[2].isGameCompleted {
                if match.games[2].gameWinningTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            if match.games[3].isGameCompleted {
                if match.games[3].gameWinningTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            if match.games[4].isGameCompleted {
                if match.games[4].gameWinningTeam == 1 {
                    gamesWonTeam1 += 1
                } else {
                    gamesWonTeam2 += 1
                }
            }
            
            if gamesWonTeam1 == 3 {
                $scoresheetManager.isMatchWinner.wrappedValue = true
                $match.isCompleted.wrappedValue = true
                $match.matchWinner.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                $match.matchWinningTeam.wrappedValue = 1
                $match.matchLoser.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                gamesWonTeam1 = 0
                gamesWonTeam2 = 0
                return true
            } else if gamesWonTeam2 == 3 {
                $scoresheetManager.isMatchWinner.wrappedValue = true
                $match.isCompleted.wrappedValue = true
                $match.matchWinner.wrappedValue = "\(match.namePlayer1Team2) | \(match.namePlayer2Team2)"
                $match.matchWinningTeam.wrappedValue = 2
                $match.matchLoser.wrappedValue = "\(match.namePlayer1Team1) | \(match.namePlayer2Team1)"
                gamesWonTeam1 = 0
                gamesWonTeam2 = 0
                return true
            }
        }
        
        return false
    }
    
    func setServersDisplayInformation() {
        // Set the first name or X for servers for each team for each game
        switch match.games[match.currentGameArrayIndex].gameFirstServerPlayerNumber {
        case 1:  // Player 1 is first server and is also therefore selectedFirstServerTeam1 in this game
            if match.currentGameArrayIndex == 0 {
                // This is game 1
                $match.firstServerDesignationGame1Team1.wrappedValue = match.player1FirstName
                $match.firstServerDesignationGame2Team1.wrappedValue = "X"
                $match.firstServerDesignationGame3Team1.wrappedValue = match.player1FirstName
                $match.firstServerDesignationGame4Team1.wrappedValue = "X"
                $match.firstServerDesignationGame5Team1.wrappedValue = match.player1FirstName
                if match.games[match.currentGameArrayIndex].selectedFirstServerTeam2 == 3 {
                    $match.firstServerDesignationGame1Team2.wrappedValue = "X"
                    $match.firstServerDesignationGame2Team2.wrappedValue = match.player3FirstName
                    $match.firstServerDesignationGame3Team2.wrappedValue = "X"
                    $match.firstServerDesignationGame4Team2.wrappedValue = match.player3FirstName
                    $match.firstServerDesignationGame5Team2.wrappedValue = "X"
                } else {
                    $match.firstServerDesignationGame1Team2.wrappedValue = "X"
                    $match.firstServerDesignationGame2Team2.wrappedValue = match.player4FirstName
                    $match.firstServerDesignationGame3Team2.wrappedValue = "X"
                    $match.firstServerDesignationGame4Team2.wrappedValue = match.player4FirstName
                    $match.firstServerDesignationGame5Team2.wrappedValue = "X"
                }
            } else {
                setServersDisplayInformationTeam1()
            }
        case 2:  // Player 2 is first server and is also therefore selectedFirstServerTeam1 in this game
            if match.currentGameArrayIndex == 0 {
                // This is game 1
                $match.firstServerDesignationGame1Team1.wrappedValue = match.player2FirstName
                $match.firstServerDesignationGame2Team1.wrappedValue = "X"
                $match.firstServerDesignationGame3Team1.wrappedValue = match.player2FirstName
                $match.firstServerDesignationGame4Team1.wrappedValue = "X"
                $match.firstServerDesignationGame5Team1.wrappedValue = match.player2FirstName
                if match.games[match.currentGameArrayIndex].selectedFirstServerTeam2 == 3 {
                    $match.firstServerDesignationGame1Team2.wrappedValue = "X"
                    $match.firstServerDesignationGame2Team2.wrappedValue = match.player3FirstName
                    $match.firstServerDesignationGame3Team2.wrappedValue = "X"
                    $match.firstServerDesignationGame4Team2.wrappedValue = match.player3FirstName
                    $match.firstServerDesignationGame5Team2.wrappedValue = "X"
                } else {
                    $match.firstServerDesignationGame1Team2.wrappedValue = "X"
                    $match.firstServerDesignationGame2Team2.wrappedValue = match.player4FirstName
                    $match.firstServerDesignationGame3Team2.wrappedValue = "X"
                    $match.firstServerDesignationGame4Team2.wrappedValue = match.player4FirstName
                    $match.firstServerDesignationGame5Team2.wrappedValue = "X"
                }
            } else {
                setServersDisplayInformationTeam1()
            }
        case 3:  // Player 3 is first server and is also therefore selectedFirstServerTeam2 in this game
            if match.currentGameArrayIndex == 0 {
                // This is game 1
                $match.firstServerDesignationGame1Team2.wrappedValue = match.player3FirstName
                $match.firstServerDesignationGame2Team2.wrappedValue = "X"
                $match.firstServerDesignationGame3Team2.wrappedValue = match.player3FirstName
                $match.firstServerDesignationGame4Team2.wrappedValue = "X"
                $match.firstServerDesignationGame5Team2.wrappedValue = match.player3FirstName
                if match.games[match.currentGameArrayIndex].selectedFirstServerTeam1 == 1 {
                    $match.firstServerDesignationGame1Team1.wrappedValue = "X"
                    $match.firstServerDesignationGame2Team1.wrappedValue = match.player1FirstName
                    $match.firstServerDesignationGame3Team1.wrappedValue = "X"
                    $match.firstServerDesignationGame4Team1.wrappedValue = match.player1FirstName
                    $match.firstServerDesignationGame5Team1.wrappedValue = "X"
                } else {
                    $match.firstServerDesignationGame1Team1.wrappedValue = "X"
                    $match.firstServerDesignationGame2Team1.wrappedValue = match.player2FirstName
                    $match.firstServerDesignationGame3Team1.wrappedValue = "X"
                    $match.firstServerDesignationGame4Team1.wrappedValue = match.player2FirstName
                    $match.firstServerDesignationGame5Team1.wrappedValue = "X"
                }
            } else {
                setServersDisplayInformationTeam2()
            }
        case 4:  // Player 4 is first server and is also therefore selectedFirstServerTeam1 in this game
            if match.currentGameArrayIndex == 0 {
                // This is game 1
                $match.firstServerDesignationGame1Team2.wrappedValue = match.player4FirstName
                $match.firstServerDesignationGame2Team2.wrappedValue = "X"
                $match.firstServerDesignationGame3Team2.wrappedValue = match.player4FirstName
                $match.firstServerDesignationGame4Team2.wrappedValue = "X"
                $match.firstServerDesignationGame5Team2.wrappedValue = match.player4FirstName
                if match.games[match.currentGameArrayIndex].selectedFirstServerTeam2 == 1 {
                    $match.firstServerDesignationGame1Team1.wrappedValue = "X"
                    $match.firstServerDesignationGame2Team1.wrappedValue = match.player1FirstName
                    $match.firstServerDesignationGame3Team1.wrappedValue = "X"
                    $match.firstServerDesignationGame4Team1.wrappedValue = match.player1FirstName
                    $match.firstServerDesignationGame5Team1.wrappedValue = "X"
                } else {
                    $match.firstServerDesignationGame1Team1.wrappedValue = "X"
                    $match.firstServerDesignationGame2Team1.wrappedValue = match.player2FirstName
                    $match.firstServerDesignationGame3Team1.wrappedValue = "X"
                    $match.firstServerDesignationGame4Team1.wrappedValue = match.player2FirstName
                    $match.firstServerDesignationGame5Team1.wrappedValue = "X"
                }
            } else {
                setServersDisplayInformationTeam2()
            }
        default:
            print("Error seetting server display information in setServerDisplayInformation() function.")
        }
    }
    
    func setServersDisplayInformationTeam1 () {
        
        if match.currentGameArrayIndex == 1 {
            // This is game 2, so only changes need to be made for Team 2
            // Only change if slectedFirstServerTeam2 was changed
            let firstServerTm2Game1 = match.games[1].selectedFirstServerTeam2
            if !(firstServerTm2Game1 == match.games[match.currentGameArrayIndex].selectedFirstServerTeam2) {
                // selectedFirstServerTeam2 changed so change info for games 2 and 4 when Team 2 will be serving first
                if match.games[match.currentGameArrayIndex].selectedFirstServerTeam2 == 3 {
                    $match.firstServerDesignationGame2Team2.wrappedValue = match.player3FirstName
                    $match.firstServerDesignationGame4Team2.wrappedValue = match.player3FirstName
                } else {
                    $match.firstServerDesignationGame2Team2.wrappedValue = match.player4FirstName
                    $match.firstServerDesignationGame4Team2.wrappedValue = match.player4FirstName
                }
            }
        } else if match.currentGameArrayIndex == 2 {
            // This is game 3, so only changes need to be made for Team 1
            // All values were already set for all games, so now only need to make changes if needed for games 3-5
            // Only change if slectedFirstServerTeam1 was changed from game 2 setting
            let firstServerTm1Game2 = match.games[2].selectedFirstServerTeam1
            if !(firstServerTm1Game2 == match.games[match.currentGameArrayIndex].selectedFirstServerTeam1) {
                // selectedFirstServerTeam1 changed so change info for games 3 and 5 when Team 1 will be serving first
                if match.games[match.currentGameArrayIndex].selectedFirstServerTeam1 == 1 {
                    $match.firstServerDesignationGame3Team1.wrappedValue = match.player1FirstName
                    $match.firstServerDesignationGame5Team1.wrappedValue = match.player1FirstName
                } else {
                    $match.firstServerDesignationGame3Team1.wrappedValue = match.player2FirstName
                    $match.firstServerDesignationGame5Team1.wrappedValue = match.player2FirstName
                }
            }
            
        } else if match.currentGameArrayIndex == 3 {
            // This is game 4, so only changes can be for Team 2
            // Only change if slectedFirstServerTeam2 was changed
            let firstServerTm2Game3 = match.games[3].selectedFirstServerTeam2
            if !(firstServerTm2Game3 == match.games[match.currentGameArrayIndex].selectedFirstServerTeam2) {
                // selectedFirstServerTeam2 changed so change info for game 4 when Team 2 will be serving first
                if match.games[match.currentGameArrayIndex].selectedFirstServerTeam2 == 3 {
                    $match.firstServerDesignationGame4Team2.wrappedValue = match.player3FirstName
                } else {
                    $match.firstServerDesignationGame4Team2.wrappedValue = match.player4FirstName
                }
            }
        } else if match.currentGameArrayIndex == 4 {
            // This is game 5, so only changes can be for Team 1
            // All values were already set for all games, so now only need to make changes if needed for game 5
            // Only change if slectedFirstServerTeam1 was changed from game 4 setting
            let firstServerTm1Game4 = match.games[3].selectedFirstServerTeam1
            if !(firstServerTm1Game4 == match.games[match.currentGameArrayIndex].selectedFirstServerTeam1) {
                // selectedFirstServerTeam1 changed so change info for game 5 when Team 1 will be serving first
                if match.games[match.currentGameArrayIndex].selectedFirstServerTeam1 == 1 {
                    $match.firstServerDesignationGame5Team1.wrappedValue = match.player1FirstName
                } else {
                    $match.firstServerDesignationGame5Team1.wrappedValue = match.player2FirstName
                }
            }
        }
    }
    
    func setServersDisplayInformationTeam2 () {
        if match.currentGameArrayIndex == 1 {
            // This is game 2, so only changes need to be made for Team 1
            // Only change if slectedFirstServerTeam2 was changed
            let firstServerTm1Game2 = match.games[1].selectedFirstServerTeam2
            if !(firstServerTm1Game2 == match.games[match.currentGameArrayIndex].selectedFirstServerTeam1) {
                // selectedFirstServerTeam1 changed so change info for games 2 and 4 when Team 1 will be serving first
                if match.games[match.currentGameArrayIndex].selectedFirstServerTeam1 == 1 {
                    $match.firstServerDesignationGame2Team2.wrappedValue = match.player1FirstName
                    $match.firstServerDesignationGame4Team2.wrappedValue = match.player1FirstName
                } else {
                    $match.firstServerDesignationGame2Team2.wrappedValue = match.player2FirstName
                    $match.firstServerDesignationGame4Team2.wrappedValue = match.player2FirstName
                }
            }
        } else if match.currentGameArrayIndex == 2 {
            // This is game 3, so only changes need to be made for Team 2
            // All values were already set for all games, so now only need to make changes if needed for games 3-5
            // Only change if slectedFirstServerTeam1 was changed from game 2 setting
            let firstServerTm2Game2 = match.games[2].selectedFirstServerTeam1
            if !(firstServerTm2Game2 == match.games[match.currentGameArrayIndex].selectedFirstServerTeam2) {
                // selectedFirstServerTeam2 changed so change info for games 3 and 5 when Team 2 will be serving first
                if match.games[match.currentGameArrayIndex].selectedFirstServerTeam1 == 3 {
                    $match.firstServerDesignationGame3Team1.wrappedValue = match.player3FirstName
                    $match.firstServerDesignationGame5Team1.wrappedValue = match.player3FirstName
                } else {
                    $match.firstServerDesignationGame3Team1.wrappedValue = match.player4FirstName
                    $match.firstServerDesignationGame5Team1.wrappedValue = match.player4FirstName
                }
            }
            
        } else if match.currentGameArrayIndex == 3 {
            // This is game 4, so only changes can be for Team 1
            // Only change if slectedFirstServerTeam2 was changed
            let firstServerTm1Game3 = match.games[3].selectedFirstServerTeam1
            if !(firstServerTm1Game3 == match.games[match.currentGameArrayIndex].selectedFirstServerTeam1) {
                // selectedFirstServerTeam1 changed so change info for game 4 when Team 1 will be serving first
                if match.games[match.currentGameArrayIndex].selectedFirstServerTeam1 == 1 {
                    $match.firstServerDesignationGame4Team2.wrappedValue = match.player1FirstName
                } else {
                    $match.firstServerDesignationGame4Team2.wrappedValue = match.player2FirstName
                }
            }
        } else if match.currentGameArrayIndex == 4 {
            // This is game 5, so only changes can be for Team 2
            // All values were already set for all games, so now only need to make changes if needed for game 5
            // Only change if slectedFirstServerTeam2 was changed from game 4 setting
            let firstServerTm2Game4 = match.games[3].selectedFirstServerTeam2
            if !(firstServerTm2Game4 == match.games[match.currentGameArrayIndex].selectedFirstServerTeam2) {
                // selectedFirstServerTeam2 changed so change info for game 5 when Team 2 will be serving first
                if match.games[match.currentGameArrayIndex].selectedFirstServerTeam1 == 3 {
                    $match.firstServerDesignationGame5Team1.wrappedValue = match.player3FirstName
                } else {
                    $match.firstServerDesignationGame5Team1.wrappedValue = match.player4FirstName
                }
            }
        }
    }
    
    func setServingPlayerNumber() {
        
        switch match.servingPlayerNumber {
        case 1:
            if scoresheetManager.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam2) % 2) == 0 {
                    $match.servingPlayerNumber.wrappedValue = 3
                } else {
                    $match.servingPlayerNumber.wrappedValue = 4
                }
            } else {
                $match.servingPlayerNumber.wrappedValue = 2
            }
        case 2:
            if scoresheetManager.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam2) % 2) == 0 {
                    $match.servingPlayerNumber.wrappedValue = 3
                } else {
                    $match.servingPlayerNumber.wrappedValue = 4
                }
            } else {
                $match.servingPlayerNumber.wrappedValue = 1
            }
        case 3:
            if scoresheetManager.isSecondServer {
                if ((match.games[match.currentGameNumber - 1].gameScoreTeam1) % 2) == 0 {
                    $match.servingPlayerNumber.wrappedValue = 1
                } else {
                    $match.servingPlayerNumber.wrappedValue = 2
                }
            } else {
                $match.servingPlayerNumber.wrappedValue = 4
            }
        case 4:
            if scoresheetManager.isSecondServer {
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
    
    func setupNewGame() {
        
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
            $scoresheetManager.isTeam1Serving.wrappedValue = false
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
            $scoresheetManager.isTeam1Serving.wrappedValue = true
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
        $scoresheetManager.isServerSideSet.wrappedValue = true
        //        $match.games[match.currentGameNumber - 1].gameStartDateValue.wrappedValue = Date.now
        //        $match.games[match.currentGameNumber - 1].isServerSideSet.wrappedValue = true
        $scoresheetManager.isSecondServer.wrappedValue = true
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
    
    func setupNewMatch() {
        print("Starting setupNewMatch")
    }
    
    func updateScore() {
        
        let tm1Score = (match.games[match.currentGameNumber - 1].player1Points) + (match.games[match.currentGameNumber - 1].player2Points)
        let tm2Score = (match.games[match.currentGameNumber - 1].player3Points) + (match.games[match.currentGameNumber - 1].player4Points)
        let server = scoresheetManager.isSecondServer == true ? "2" : "1"
        
        if scoresheetManager.isTeam1Serving {
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

