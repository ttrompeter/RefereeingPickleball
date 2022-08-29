//
//  PointsSecondRowTeam1View.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import RealmSwift
import SwiftUI

struct PointsSecondRowTeam1View: View {
    
    @ObservedRealmObject var match: Match
    
    var body: some View {
        
        VStack (spacing: 0) {
            HStack (alignment: .top, spacing: 0) {
                
                if match.currentGameNumber == 2 {
                    Rectangle()
                        .foregroundColor(Constants.MINT_LEAF)
                        .opacity(0.1)
                        .frame(width: (Constants.BOX_DIMENSION * 3), height: Constants.BOX_DIMENSION, alignment: .leading)
                        .border(.black, width: 1.0)
                        .overlay(Text(match.firstServerDesignationGame2Team1).font(.caption).italic())
                }else {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: (Constants.BOX_DIMENSION * 3), height: Constants.BOX_DIMENSION, alignment: .leading)
                        .border(.black, width: 1.0)
                        .overlay(Text(match.firstServerDesignationGame2Team1).font(.caption).italic())
                }
                    
                
                //Empty space column
                VStack (spacing: 0) {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION, alignment: .leading)
                }
                
                Group {
                    ZStack {
                        Image(match.point1Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint0Game2Team1 {
                            Image(Constants.SIDEOUT_LEFT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        if match.isSideoutPoint1Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("1")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point2Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint2Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("2")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point3Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint3Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("3")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point4Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint4Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("4")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point5Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint5Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("5")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point6Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint6Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("6")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point7Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint7Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("7")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point8Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint8Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("8")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point9Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint9Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("9")
                            .foregroundColor(Constants.SILVER)
                    }
                }
                Group {
                    ZStack {
                        Image(match.point10Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint10Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("10")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point11Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint11Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("11")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point12Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint12Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("12")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point13Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint13Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("13")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point14Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint14Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("14")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point15Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint15Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("15")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point16Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint16Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("16")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point17Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint17Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("17")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point18Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint18Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("18")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point19Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint19Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("19")
                            .foregroundColor(Constants.SILVER)
                    }
                }
                
                Group {
                    ZStack {
                        Image(match.point20Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint20Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("20")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point21Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint21Game2Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("21")
                            .foregroundColor(Constants.SILVER)
                    }
                }
                //Empty space column
                VStack (spacing: 0) {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION, alignment: .leading)
                }
                // Timeouts
                ZStack {
                    
                    Image(match.timeOut1Game2ImageTm1)
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    Text("1")
                        .foregroundColor(Constants.DARK_SLATE)
                }
                if match.selectedMatchFormat == 3 {
                    ZStack {
                        
                        Image(match.timeOut2_5Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        Text("2")
                            .foregroundColor(Constants.DARK_SLATE)
                    }
                } else {
                    ZStack {
                        
                        Image(match.timeOut2Game2ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        Text("2")
                            .foregroundColor(Constants.DARK_SLATE)
                    }
                }
                
                // If match is best 3 games of 5 games then show 3 timeouts else just show 2 timeouts
                if match.selectedMatchFormat == 3 {
                    ZStack {
                        
                        Image(match.timeOut3Game1ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        Text("3")
                            .foregroundColor(Constants.DARK_SLATE)
                    }
                }

            }
        }
    }
}

struct PointsSecondRowTeam1View_Previews: PreviewProvider {
    static var previews: some View {
        PointsSecondRowTeam1View(match: Match())
    }
}
