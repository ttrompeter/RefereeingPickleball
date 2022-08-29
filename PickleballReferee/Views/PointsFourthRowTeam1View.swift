//
//  PointsFourthRowTeam1View.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/6/22.
//

import RealmSwift
import SwiftUI

struct PointsFourthRowTeam1View: View {
    
    @ObservedRealmObject var match: Match
    
    var body: some View {
        
        VStack (spacing: 0) {
                HStack (alignment: .top, spacing: 0) {
                    
                    if match.currentGameNumber == 4 {
                        Rectangle()
                            .foregroundColor(Constants.MINT_LEAF)
                            .opacity(0.1)
                            .frame(width: (Constants.BOX_DIMENSION * 3), height: Constants.BOX_DIMENSION, alignment: .leading)
                            .border(.black, width: 1.0)
                            .overlay(Text(match.firstServerDesignationGame4Team1).font(.caption).italic())
                    }else {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: (Constants.BOX_DIMENSION * 3), height: Constants.BOX_DIMENSION, alignment: .leading)
                            .border(.black, width: 1.0)
                            .overlay(Text(match.firstServerDesignationGame4Team1).font(.caption).italic())
                    }
                        
                    
                    //Empty space column
                    VStack (spacing: 0) {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION, alignment: .leading)
                    }
                    
                    Group {
                        ZStack {
                            Image(match.point1Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint0Game4Team1 {
                                Image(Constants.SIDEOUT_LEFT)
                                    .resizable()
                                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            }
                            if match.isSideoutPoint1Game4Team1 {
                                Image(Constants.SIDEOUT_RIGHT)
                                    .resizable()
                                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            }
                            Text("1")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.point2Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint2Game4Team1 {
                                Image(Constants.SIDEOUT_RIGHT)
                                    .resizable()
                                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            }
                            Text("2")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.point3Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint3Game4Team1 {
                                Image(Constants.SIDEOUT_RIGHT)
                                    .resizable()
                                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            }
                            Text("3")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.point4Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint4Game4Team1 {
                                Image(Constants.SIDEOUT_RIGHT)
                                    .resizable()
                                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            }
                            Text("4")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.point5Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint5Game4Team1 {
                                Image(Constants.SIDEOUT_RIGHT)
                                    .resizable()
                                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            }
                            Text("5")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.point6Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint6Game4Team1 {
                                Image(Constants.SIDEOUT_RIGHT)
                                    .resizable()
                                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            }
                            Text("6")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.point7Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint7Game4Team1 {
                                Image(Constants.SIDEOUT_RIGHT)
                                    .resizable()
                                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            }
                            Text("7")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.point8Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint8Game4Team1 {
                                Image(Constants.SIDEOUT_RIGHT)
                                    .resizable()
                                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            }
                            Text("8")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.point9Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint9Game4Team1 {
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
                            Image(match.point10Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint10Game4Team1 {
                                Image(Constants.SIDEOUT_RIGHT)
                                    .resizable()
                                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            }
                            Text("10")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.point11Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint11Game4Team1 {
                                Image(Constants.SIDEOUT_RIGHT)
                                    .resizable()
                                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            }
                            Text("11")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.point12Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint12Game4Team1 {
                                Image(Constants.SIDEOUT_RIGHT)
                                    .resizable()
                                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            }
                            Text("12")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.point13Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint13Game4Team1 {
                                Image(Constants.SIDEOUT_RIGHT)
                                    .resizable()
                                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            }
                            Text("13")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.point14Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint14Game4Team1 {
                                Image(Constants.SIDEOUT_RIGHT)
                                    .resizable()
                                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            }
                            Text("14")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.point15Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint15Game4Team1 {
                                Image(Constants.SIDEOUT_RIGHT)
                                    .resizable()
                                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            }
                            Text("15")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.point16Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint16Game4Team1 {
                                Image(Constants.SIDEOUT_RIGHT)
                                    .resizable()
                                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            }
                            Text("16")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.point17Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint17Game4Team1 {
                                Image(Constants.SIDEOUT_RIGHT)
                                    .resizable()
                                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            }
                            Text("17")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.point18Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint18Game4Team1 {
                                Image(Constants.SIDEOUT_RIGHT)
                                    .resizable()
                                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            }
                            Text("18")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.point19Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint19Game4Team1 {
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
                            Image(match.point20Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint20Game4Team1 {
                                Image(Constants.SIDEOUT_RIGHT)
                                    .resizable()
                                    .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            }
                            Text("20")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.point21Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            if match.isSideoutPoint21Game4Team1 {
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
                        
                        Image(match.timeOut1Game4ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        Text("1")
                            .foregroundColor(Constants.DARK_SLATE)
                    }
                    ZStack {
                        
                        Image(match.timeOut2Game4ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        Text("2")
                            .foregroundColor(Constants.DARK_SLATE)
                    }
                    ZStack {
                        
                        Image(match.timeOut3Game4ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        Text("3")
                            .foregroundColor(Constants.DARK_SLATE)
                    }

                }
            }
    }
}

//struct PointsFourthRowTeam1View_Previews: PreviewProvider {
//    static var previews: some View {
//        PointsFourthRowTeam1View()
//    }
//}
