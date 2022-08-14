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
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 90.0, height: Constants.BOX_DIMENSION, alignment: .leading)
                        .border(.black, width: 1.0)
                        .overlay(Text(match.games[3].serverNameGame4Team1).font(.caption).italic())
                        
                    
                    //Empty space column
                    VStack (spacing: 0) {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION, alignment: .leading)
                    }
                    
                    Group {
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point1Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)

                            Text("1")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point2Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            Text("2")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point3Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                            Text("3")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point4Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)

                            Text("4")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point5Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)

                            Text("5")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point6Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)

                            Text("6")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point7Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)

                            Text("7")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point8Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)

                            Text("8")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point9Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)

                            Text("9")
                                .foregroundColor(Constants.SILVER)
                        }
                    }
                    Group {
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point10Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)

                            Text("10")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point11Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)

                            Text("11")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point12Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)

                            Text("12")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point13Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)

                            Text("13")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point14Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)

                            Text("14")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point15Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)

                            Text("15")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point16Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)

                            Text("16")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point17Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)

                            Text("17")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point18Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)

                            Text("18")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point19Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)

                            Text("19")
                                .foregroundColor(Constants.SILVER)
                        }
                    }
                    
                    Group {
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point20Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)

                            Text("20")
                                .foregroundColor(Constants.SILVER)
                        }
                        ZStack {
                            Image(match.games[match.currentGameNumber - 1].point21Game4ImageTm1)
                                .resizable()
                                .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)

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
                        
                        Image(match.games[match.currentGameNumber - 1].timeOut1Game4ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        Text("1")
                            .foregroundColor(Constants.DARK_SLATE)
                    }
                    ZStack {
                        
                        Image(match.games[match.currentGameNumber - 1].timeOut2Game4ImageTm1)
                            .resizable()
                            .frame(width: Constants.BOX_DIMENSION, height: Constants.BOX_DIMENSION)
                        Text("2")
                            .foregroundColor(Constants.DARK_SLATE)
                    }
                    ZStack {
                        
                        Image(match.games[match.currentGameNumber - 1].timeOut3Game4ImageTm1)
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
