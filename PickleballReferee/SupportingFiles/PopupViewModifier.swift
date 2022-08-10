//
//  PopupViewModifier.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/10/22.
//

import SwiftUI

struct PopupViewModifier: ViewModifier {
    
    @ObservedObject var sheetManager: SheetManager
    
    func body(content: Content) -> some View {
        
        content
        .overlay(alignment: .center) {
            //if sheetManager.action.isPresented {
            if case let .present(config) = sheetManager.action {
                PopupView (config: config) {
                    withAnimation (.spring()) {
                        sheetManager.dismiss()
                    }
                }
            }
            
            
        }
    }
}

extension View {
    func popup(with sheetManager: SheetManager) -> some View {
        self.modifier(PopupViewModifier(sheetManager: sheetManager))
    }
}
