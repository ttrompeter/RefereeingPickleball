//
//  Styles.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

//
//  Styles.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/11/22.
//

import SwiftUI


struct PointSideoutButton: ButtonStyle {
    
    // Point & 2nd Server Burttons
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 170, height: 50)
            .background(Constants.MINT_LEAF)
            .font(.title)
            .foregroundColor(Constants.DARK_SLATE)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
    
}

struct OptionsButton: ButtonStyle {
    
    // Options Buttons - Match Setup / Introduction / Reference / Etc.
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 140, height: 40)
            .background(Constants.SILVER)
            .font(.body)
            .foregroundColor(Constants.DARK_SLATE)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
    
}

struct TimeoutsButton: ButtonStyle {
    
    // Options Buttons - Match Setup / Introduction / Reference / Etc.
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 180, height: 40)
            .background(Constants.SILVER)
            .font(.body)
            .foregroundColor(Constants.DARK_SLATE)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
    
}

struct SheetButton: ButtonStyle {
    
    // Options Buttons - Match Setup / Introduction / Reference / Etc.
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 90, height: 26)
            .background(Constants.SILVER)
            .font(.body)
            .foregroundColor(Constants.DARK_SLATE)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
    
}

struct MediumButton: ButtonStyle {
    
    // Point & 2nd Server Burttons
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 100, height: 40)
            .background(Constants.SILVER)
            .font(.body)
            .foregroundColor(Constants.DARK_SLATE)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
    
}

// Information about styling TextField objects
//struct ContentView: View {
//    @State private var text = ""
//
//    var body: some View {
//        TextField("type something...", text: $text)
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//    }
//}

//struct SuperCustomTextFieldStyle: TextFieldStyle {
//    func _body(configuration: TextField<_Label>) -> some View {
//        configuration
//            .padding()
//            .border(Color.accentColor)
//    }
//}

//struct ContentView: View {
//    @State private var text = ""
//
//    var body: some View {
//        TextField("type something...", text: $text)
//            .textFieldStyle(SuperCustomTextFieldStyle())
//    }
//}

