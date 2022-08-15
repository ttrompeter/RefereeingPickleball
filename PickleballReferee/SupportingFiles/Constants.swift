//
//  Constants.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

import SwiftUI

struct Constants {
    
    
    //********************************************************************************
    // MISCELLANEOUS
    
    static var BOX_DIMENSION = CGFloat(30)
    
    
    //********************************************************************************
    //     COLORS
    // Medium Dark Gray
    static var AMERICAN_RIVER = Color(red: 99/255, green: 110/255, blue: 116/255)
    // Dark Yellow / Gold
    static var BRIGHT_YARROW = Color(red: 253/255, green: 203/255, blue: 110/255)
    // Light Silver Gray
    static var CLOUDS = Color(red: 236/255, green: 240/255, blue: 241/255)
    static var CRIMSON = Color(red: 220/255, green: 20/255, blue: 60/255)
    static var DARK_GRAY = Color(red: 169/255, green: 169/255, blue: 169/255)
    static var DARK_SLATE = Color(red: 47/255, green: 79/255, blue: 79/255)
    static var DARK_RED = Color(red: 139/255, green: 0/255, blue: 0/255)
    // Medoium Blue
    static var ELECTRON_BLUE = Color(red: 9/255, green: 132/255, blue: 227/255)
    static var EXODUS_FRUIT = Color(red: 108/255, green: 92/255, blue: 231/255)
    // Aquamarine
    static var FADED_POSTER = Color(red: 129/255, green: 236/255, blue: 236/255)
    static var LIGHT_GRAY = Color(red: 211/255, green: 211/255, blue: 211/255)
    // Medium Green
    static var MINT_LEAF = Color(red: 0/255, green: 184/255, blue: 148/255)
    // Medium Gray
    static var SILVER = Color(red: 189/255, green: 195/255, blue: 199/255)
    static var SLATE_GRAY = Color(red: 112/255, green: 128/255, blue: 144/255)
    // Medium Gray
    static var SOOTHING_BREEZE = Color(red: 178/255, green: 211901/255, blue: 195/255)
    // Light Yellow
    static var SOUR_LEMON = Color(red: 255/255, green: 234/255, blue: 167/255)
    static var WHITE = Color(red: 255/255, green: 255/255, blue: 255/255)
   
    
    //CITY LIGHTS       rgba(223, 230, 233,1.0) Light Gray
    // DRACULA ORCHID   rgba(45, 52, 54,1.0)  // Black
    // CONCRETE         rgba(149, 165, 166,1.0)  // Medium Gray
    // ASBESTOS         rgba(127, 140, 141,1.0)  // Dark Gray
    // MIDNIGHT BLUE    rgba(44, 62, 80,1.0)
    // WET ASPHALT      rgba(52, 73, 94,1.0)
    // PETER RIVER      rgba(52, 152, 219,1.0)
    // BELIZE HOLE      rgba(41, 128, 185,1.0)
    // POMAGRANATE      rgba(192, 57, 43,1.0)
    // EMERALD          rgba(46, 204, 113,1.0)
    
    
    //********************************************************************************
    //     IMAGES
    
    static var BOX = "box"
    static var BOX_BLANK = "boxblank"
    static var BOX_BACK_SLASH = "boxbackslash"
    static var BOX_FORWARD_SLASH = "boxfwdslash"
    
    static var BOX_LEFT = "boxleft"
    static var BOX_LEFT_BACK_SLASH = "boxleftbackslash"
    static var BOX_LEFT_FORWARD_SLASH = "boxleftfwdslash"
    
    static var BOX_BOTTOM_LEFT = "boxbottomleft"
    static var BOX_BOTTOM_LEFT_BACK_SLASH = "boxbottomleftbackslash"
    static var BOX_BOTTOM_LEFT_FORWARD_SLASH = "boxbottomleftbackslash"
   
    static var BOX_RIGHT_END = "boxrightend"
    static var BOX_RIGHT_END_BACK_SLASH = "boxrightendbackslash"
    static var BOX_RIGHT_END_FORWARD_SLASH = "boxrightendfwdslash"
    
    static var SIDEOUT_LEFT = "sideoutleft"
    static var SIDEOUT_RIGHT = "sideoutright"
    
    static var TRIANGLE = "triangle"
    
    //********************************************************************************
    
    
    
    
    //    static var SQUARE_LEFT = "squareleft"
    //    static var SQUARE_LEFT_SIDEOUT = "squareleftsideout"
    //    static var SQUARE_LEFT_FORWARD_SLASH = "squareleftfwdslash"
    //    static var SQUARE_LEFT_FORWARD_SLASH_SIDEOUT = "squareleftfwdslashsideout"
    //    static var SQUARE_LEFT_BACK_SLASH = "squareleftbackslash"
    //    static var SQUARE_LEFT_BACK_SLASH_SIDEOUT = "squareleftbackslashsideout"
    //
    //    static var SQUARE_MIDDLE_LEFT = "squaremiddleleft"
    //    static var SQUARE_MIDDLE_LEFT_SIDEOUT = "squaremiddleleftsideout"
    //    static var SQUARE_MIDDLE_LEFT_FORWARD_SLASH = "squaremiddleleftfwdslash"
    //    static var SQUARE_MIDDLE_LEFT_FORWARD_SLASH_SIDEOUT = "squaremiddleleftfwdslashsideout"
    //    static var SQUARE_MIDDLE_LEFT_BACK_SLASH = "squaremiddleleftbackslash"
    //    static var SQUARE_MIDDLE_LEFT_BACK_SLASH_SIDEOUT = "squareleftbackslashsideout"
    //
    //    static var SQUARE_MIDDLE_RIGHT = "squaremiddleright"
    //    static var SQUARE_MIDDLE_RIGHT_FORWARD_SLASH = "squaremiddlerightfwdslash"
    //    static var SQUARE_MIDDLE_RIGHT_FORWARD_SLASH_SIDEOUT = "squaremiddlerightfwdslashsideout"
    //    static var SQUARE_MIDDLE_RIGHT_BACK_SLASH = "squaremiddlerightbackslash"
    //    static var SQUARE_MIDDLE_RIGHT_BACK_SLASH_SIDEOUT = "squaremiddlerightbackslashsideout"
    //    static var SQUARE_MIDDLE_RIGHT_SIDEOUT = "squaremiddlerightsideout"
    
    //static var BOX_BOTTOM_LEFT_FORWARD_SLASH_SIDEOUT = "boxbottomleftbackslashsideout"
    //static var BOX_BOTTOM_LEFT_SIDEOUT = "boxbottomleftsideout"
    //static var BOX_LEFT_FORWARD_SLASH_SIDEOUT = "boxleftfwdslashsideout"
    //static var BOX_LEFT_SIDEOUT = "boxleftsideout"
    //static var BOX_BACK_SLASH_SIDEOUT = "boxbackslashsideout"
    //static var BOX_FORWARD_SLASH_SIDEOUT = "boxfwdslashsideout"
    //static var BOX_SIDEOUT = "boxsideout"
    //static var BOX_LEFT_BACK_SLASH_SIDEOUT = "boxleftbackslashsideout"
    //static var BOX_RIGHT_END_FORWARD_SLASH_SIDEOUT = "boxrightendfwdslashsideout"
    //static var BOX_RIGHT_END_BACK_SLASH_SIDEOUT = "boxrightendbackslashsideout"
    //static var BOX_BOTTOM_LEFT_BACK_SLASH_SIDEOUT = "boxbottomleftbackslashsideout"
    
    
}
