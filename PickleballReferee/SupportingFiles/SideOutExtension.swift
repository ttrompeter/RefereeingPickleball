//
//  SideOutExtension.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/22/22.
//

import RealmSwift
import SwiftUI

extension MatchView {
    
    func sideOut() {
       // TODO: - Add sideouts for games 2-5
        if match.servingPlayerNumber == 1 || match.servingPlayerNumber == 2 {
            // In here Team 1 was serving at sideout
            $match.games[match.currentGameNumber - 1].sideOutsTeam1.wrappedValue += 1
            switch match.games[match.currentGameNumber - 1].gameScoreTeam1 {
            case 0:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint0Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint0Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint0Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint0Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint0Game5Team1.wrappedValue = true
                }
            case 1:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint1Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint1Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint1Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint1Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint1Game5Team1.wrappedValue = true
                }
            case 2:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint2Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint2Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint2Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint2Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint2Game5Team1.wrappedValue = true
                }
            case 3:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint3Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint3Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint3Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint3Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint3Game5Team1.wrappedValue = true
                }
            case 4:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint4Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint4Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint4Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint4Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint4Game5Team1.wrappedValue = true
                }
            case 5:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint5Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint5Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint5Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint5Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint5Game5Team1.wrappedValue = true
                }
            case 6:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint6Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint6Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint6Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint6Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint6Game5Team1.wrappedValue = true
                }
            case 7:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint7Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint7Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint7Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint7Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint7Game5Team1.wrappedValue = true
                }
            case 8:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint8Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint8Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint8Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint8Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint8Game5Team1.wrappedValue = true
                }
            case 9:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint9Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint9Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint9Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint9Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint9Game5Team1.wrappedValue = true
                }
            case 10:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint10Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint10Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint10Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint10Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint10Game5Team1.wrappedValue = true
                }
            case 11:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint11Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint11Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint11Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint11Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint11Game5Team1.wrappedValue = true
                }
            case 12:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint12Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint12Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint12Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint12Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint12Game5Team1.wrappedValue = true
                }
            case 13:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint13Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint13Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint13Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint13Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint13Game5Team1.wrappedValue = true
                }
            case 14:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint14Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint14Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint14Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint14Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint14Game5Team1.wrappedValue = true
                }
            case 15:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint15Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint15Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint15Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint15Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint15Game5Team1.wrappedValue = true
                }
            case 16:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint16Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint16Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint16Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint16Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint16Game5Team1.wrappedValue = true
                }
            case 17:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint17Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint17Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint17Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint17Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint17Game5Team1.wrappedValue = true
                }
            case 18:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint18Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint18Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint18Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint18Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint18Game5Team1.wrappedValue = true
                }
            case 19:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint19Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint19Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint19Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint19Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint19Game5Team1.wrappedValue = true
                }
            case 20:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint20Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint20Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint20Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint20Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint20Game5Team1.wrappedValue = true
                }
            case 21:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint21Game1Team1.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint21Game2Team1.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint21Game3Team1.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint21Game4Team1.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint21Game5Team1.wrappedValue = true
                }
            default:
                print("Error setting image in switch statement of sideOut()")
            }
        } else if match.servingPlayerNumber == 3 || match.servingPlayerNumber == 4 {
            // In here Team 2 was serving at sideout
            $match.games[match.currentGameNumber - 1].sideOutsTeam2.wrappedValue += 1
            switch match.games[match.currentGameNumber - 1].gameScoreTeam2 {
            case 0:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint0Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint0Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint0Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint0Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint0Game5Team2.wrappedValue = true
                }
            case 1:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint1Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint1Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint1Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint1Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint1Game5Team2.wrappedValue = true
                }
            case 2:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint2Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint2Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint2Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint2Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint2Game5Team2.wrappedValue = true
                }
            case 3:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint3Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint3Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint3Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint3Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint3Game5Team2.wrappedValue = true
                }
            case 4:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint4Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint4Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint4Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint4Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint4Game5Team2.wrappedValue = true
                }
            case 5:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint5Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint5Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint5Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint5Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint5Game5Team2.wrappedValue = true
                }
            case 6:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint6Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint6Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint6Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint6Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint6Game5Team2.wrappedValue = true
                }
            case 7:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint7Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint7Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint7Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint7Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint7Game5Team2.wrappedValue = true
                }
            case 8:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint8Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint8Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint8Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint8Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint8Game5Team2.wrappedValue = true
                }
            case 9:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint9Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint9Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint9Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint9Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint9Game5Team2.wrappedValue = true
                }
            case 10:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint10Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint10Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint10Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint10Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint10Game5Team2.wrappedValue = true
                }
            case 11:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint11Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint11Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint11Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint11Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint11Game5Team2.wrappedValue = true
                }
            case 12:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint12Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint12Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint12Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint12Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint12Game5Team2.wrappedValue = true
                }
            case 13:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint13Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint13Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint13Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint13Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint13Game5Team2.wrappedValue = true
                }
            case 14:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint14Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint14Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint14Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint14Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint14Game5Team2.wrappedValue = true
                }
            case 15:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint15Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint15Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint15Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint15Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint15Game5Team2.wrappedValue = true
                }
            case 16:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint16Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint16Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint16Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint16Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint16Game5Team2.wrappedValue = true
                }
            case 17:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint17Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint17Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint17Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint17Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint17Game5Team2.wrappedValue = true
                }
            case 18:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint18Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint18Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint18Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint18Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint18Game5Team2.wrappedValue = true
                }
            case 19:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint19Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint19Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint19Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint19Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint19Game5Team2.wrappedValue = true
                }
            case 20:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint20Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint20Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint20Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint20Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint20Game5Team2.wrappedValue = true
                }
            case 21:
                if match.currentGameNumber == 1 {
                    $match.isSideoutPoint21Game1Team2.wrappedValue = true
                } else if match.currentGameNumber == 2 {
                    $match.isSideoutPoint21Game2Team2.wrappedValue = true
                } else if match.currentGameNumber == 3 {
                    $match.isSideoutPoint21Game3Team2.wrappedValue = true
                } else if match.currentGameNumber == 4 {
                    $match.isSideoutPoint21Game4Team2.wrappedValue = true
                } else if match.currentGameNumber == 5 {
                    $match.isSideoutPoint21Game5Team2.wrappedValue = true
                }
            default:
                print("Error setting image in switch statement of sideOut()")
            }
        }
        
        
        // Set server to the next server
        setWhoIsServing()
        $match.isSecondServer.wrappedValue.toggle()
        $match.whoIsServingText.wrappedValue = "1st Server"
        
        // Team service game is over so change values for isTeam1Serving and isServingLeftSide
        $match.isTeam1Serving.wrappedValue.toggle()
        $match.isServingLeftSide.wrappedValue.toggle()
        
        updateScore()
    }
}
