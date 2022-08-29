//
//  PointsFifthRowTeam1View.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/20/22.
//

import RealmSwift
import SwiftUI

struct PointsFifthRowTeam1View: View {
    
    @ObservedRealmObject var match: Match
    
    var body: some View {
        
        VStack (spacing: 0) {
            HStack (alignment: .top, spacing: 0) {
                
                if match.currentGameNumber == 5 {
                    Rectangle()
                        .foregroundColor(Constants.MINT_LEAF)
                        .opacity(0.1)
                        .frame(width: (Constants.BOX_DIMENSION * 3), height: Constants.BOX_DIMENSION, alignment: .leading)
                        .border(.black, width: 1.0)
                        .overlay(Text(match.firstServerDesignationGame5Team1).font(.caption).italic())
                }else {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: (Constants.BOX_DIMENSION * 3), height: Constants.BOX_DIMENSION, alignment: .leading)
                        .border(.black, width: 1.0)
                        .overlay(Text(match.firstServerDesignationGame5Team1).font(.caption).italic())
                }
                
                
                //Empty space column
                VStack (spacing: 0) {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION, alignment: .leading)
                }
                
                Group {
                    ZStack {
                        Image(match.point1Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint0Game5Team1 {
                            Image(Constants.SIDEOUT_LEFT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        if match.isSideoutPoint1Game5Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("1")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point2Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint2Game5Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("2")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point3Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint3Game5Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("3")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point4Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint4Game5Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("4")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point5Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint5Game5Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("5")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point6Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint6Game5Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("6")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point7Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint7Game5Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("7")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point8Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint8Game5Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("8")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point9Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint9Game5Team1 {
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
                        Image(match.point10Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint10Game5Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("10")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point11Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint11Game5Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("11")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point12Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint12Game5Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("12")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point13Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint13Game5Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("13")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point14Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint14Game5Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("14")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point15Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint15Game5Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("15")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point16Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint16Game5Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("16")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point17Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint17Game5Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("17")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point18Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint18Game5Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("18")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point19Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint19Game5Team1 {
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
                        Image(match.point20Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint20Game5Team1 {
                            Image(Constants.SIDEOUT_RIGHT)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        }
                        Text("20")
                            .foregroundColor(Constants.SILVER)
                    }
                    ZStack {
                        Image(match.point21Game5ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        if match.isSideoutPoint21Game5Team1 {
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
                    
                    Image(match.timeOut1Game5ImageTm1)
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    Text("1")
                        .foregroundColor(Constants.DARK_SLATE)
                }
                ZStack {
                    
                    Image(match.timeOut2Game5ImageTm1)
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    Text("2")
                        .foregroundColor(Constants.DARK_SLATE)
                }
                ZStack {
                    
                    Image(match.timeOut3Game5ImageTm1)
                        .resizable()
                        .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                    Text("3")
                        .foregroundColor(Constants.DARK_SLATE)
                }

            }
        }
    }
}

//struct PointsFifthRowTeam1View_Previews: PreviewProvider {
//    static var previews: some View {
//        PointsFifthRowTeam1View()
//    }
//}

