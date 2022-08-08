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

struct PointsSideoutButtonStyle: ButtonStyle {

    private struct ContentView<Content: View>: View {

        var view: Content

        @Environment(\.isEnabled) private var isEnabled

        var body: some View {
            view
                .padding()
                .frame(width: 170, height: 50)
                .background(backgroundColor)
                .font(.title)
                .foregroundColor(foregroundColor)
                .clipShape(Capsule())
        }

        var backgroundColor: Color {
            isEnabled ? Constants.MINT_LEAF : Constants.SILVER
        }
        var foregroundColor: Color {
            isEnabled ? Constants.WHITE : Constants.DARK_SLATE
        }
    }

    func makeBody(configuration: Configuration) -> some View {
        ContentView(view: configuration.label)
            .scaleEffect(configuration.isPressed ? 1.2 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

//struct PointSideoutButtonOriginal: ButtonStyle {
//
//    // Point & 2nd Server Burttons
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .padding()
//            .frame(width: 170, height: 50)
//            .background(Constants.MINT_LEAF)
//            .font(.title)
//            .foregroundColor(Constants.DARK_SLATE)
//            .clipShape(Capsule())
//            .scaleEffect(configuration.isPressed ? 1.2 : 1.0)
//            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
//    }
//
//}

struct OptionsButtonStyle: ButtonStyle {
    
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

struct TimeoutsButtonStyle: ButtonStyle {

    private struct ContentView<Content: View>: View {

        var view: Content

        @Environment(\.isEnabled) private var isEnabled

        var body: some View {
            view
                .padding()
                .frame(width: 180, height: 40)
                .background(backgroundColor)
                .font(.body)
                .foregroundColor(foregroundColor)
                .clipShape(Capsule())
        }

        var backgroundColor: Color {
            isEnabled ? Constants.MINT_LEAF : Constants.SILVER
        }
        var foregroundColor: Color {
            isEnabled ? Constants.WHITE : Constants.DARK_SLATE
        }
    }

    func makeBody(configuration: Configuration) -> some View {
        ContentView(view: configuration.label)
            .scaleEffect(configuration.isPressed ? 1.2 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

//struct TimeoutsButtonOriginal: ButtonStyle {
//
//    // Options Buttons - Match Setup / Introduction / Reference / Etc.
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .padding()
//            .frame(width: 180, height: 40)
//            .background(Constants.SILVER)
//            .font(.body)
//            .foregroundColor(Constants.DARK_SLATE)
//            .clipShape(Capsule())
//            .scaleEffect(configuration.isPressed ? 1.2 : 1.0)
//            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
//    }
//}

struct SheetButtonStyle: ButtonStyle {
    
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

struct MediumButtonStyle: ButtonStyle {
    
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


// One Tutorial Solution for changing buttons using .isEnabled
public struct ButtonStyleContent<Content: View>: View {

    public init(@ViewBuilder viewBuilder: @escaping ContentBuilder) {
        self.viewBuilder = viewBuilder
    }

    public typealias ContentBuilder = (_ isEnabled: Bool) -> Content

    private let viewBuilder: ContentBuilder

    @Environment(\.isEnabled)
    public var isEnabled: Bool

    public var body: some View {
        viewBuilder(isEnabled)
    }
}
// One Tutorial Solution for changing buttons using .isEnabled
struct MyButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        ButtonStyleContent { isEnabled in
            configuration.label
                .padding()
                .background(backgroundColor(isEnabled: isEnabled))
                .clipShape(Capsule())
        }
    }

    func backgroundColor(isEnabled: Bool) -> Color {
        isEnabled ? .green : .red
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

