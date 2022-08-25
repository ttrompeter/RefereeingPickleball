//
//  TimerWrapper.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/24/22.
//

import SwiftUI
import Combine

class TimerWrapper : ObservableObject {
    let objectWillChange = ObservableObjectPublisher()

    let gameTimer = Timer.publish(every: 60, tolerance: 0.5, on: .main, in: .common)
    let matchTimer = Timer.publish(every: 60, tolerance: 0.5, on: .main, in: .common)
    
//    var timer : Timer!
//    func start(withTimeInterval interval: Double = 0.1) {
//        self.timer?.invalidate()
//        self.timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
//            self.objectWillChange.send()
//        }
//        
//    }
    
    func startMatchTimer() {
        _ = matchTimer.connect()
    }
    
    func stopMatchTimer() {
        matchTimer.connect().cancel()
    }
    func startGameTimer() {
        _ = gameTimer.connect()
    }
    
    func stopGameTimer() {
        gameTimer.connect().cancel()
    }
    
}

