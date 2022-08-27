//
//  ScoresheetManager.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/24/22.
//

import Foundation


final class ScoresheetManager: ObservableObject {
   
    @Published var gameDuration = 0.0
    @Published var gameElapsedTime = 0.0
    @Published var gameTimerStartDate = Date.now
    @Published var gameTimerEndDate = Date.now
    @Published var matchDuration = 0.0
    @Published var isMatchRunning = false
    @Published var isMatchSetupCompleted = false
    @Published var matchElapsedTime = 0.0
    @Published var matchTimerStartDate = Date.now
    @Published var matchTimerEndDate = Date.now
    @Published var team1Serving = false
    @Published var secondsElapsedInGame = 0.0
    @Published var secondsElapsedInMatch = 0.0
    
   
    var gameComputedDuration: Double {
        // Gets milliseconds
        let gameDuration = gameTimerEndDate.timeIntervalSince(gameTimerStartDate)
        // Return game duration in minutes
        return (gameDuration.truncatingRemainder(dividingBy: 3600)) / 60
    }
    
    var matchComputedDuration: Double {
        // Gets milliseconds
        let matchDuration = matchTimerEndDate.timeIntervalSince(matchTimerStartDate)
        // Return match duration in minutes
        return (matchDuration.truncatingRemainder(dividingBy: 3600)) / 60
    }
}

// to format string from Int - String(format: "%02d", minutes

//final class SheetManager: ObservableObject {
//
//    typealias Config = SheetAction.Info
//
//    enum SheetAction {
//
//        struct Info {
//            let systemName: String
//            let title: String
//            let content: String
//        }
//
//        case notAvailable
//        case present(info: Info)
//        case dismiss
//    }
//
//    @Published private(set) var action: SheetAction = .notAvailable
//
//    func present(with config: Config) {
//        // guard to see if already presented so don't present twice
//        guard !action.isPresented else { return }
//        self.action = .present(info: config)
//    }
//
//    func dismiss() {
//        self.action = .dismiss
//    }
//
//}
//
//extension SheetManager.SheetAction {
//    // Tells if presented instead of using == on each case. Computed value.
//    var isPresented: Bool {
//        guard case.present(_) = self else { return false }
//        return true
//
//    }
//}
