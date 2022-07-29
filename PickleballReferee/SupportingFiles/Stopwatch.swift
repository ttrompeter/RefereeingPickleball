//
//  Stopwatch.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/28/22.
//

//
//  Stopwatch.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 7/14/22.
//

import SwiftUI

struct Stopwatch: View {

    // Current progress time expresed in seconds
    // @State private var progressTime = 236
    // TRT Change to start at 0. Don't understand why he set it to 236 (almost 4 minutes)
    @State private var progressTime = 0
    
    @State private var isRunning = false
    
    // TRT Added to have version with just minutes and seconds
    @State var isShowHour = true

    /// Computed properties to get the progressTime in hh:mm:ss format
    var hours: Int {
        progressTime / 3600
    }

    var minutes: Int {
        (progressTime % 3600) / 60
    }

    var seconds: Int {
        progressTime % 60
    }

    /// Increase progressTime each second
    @State private var timer: Timer?

    var body: some View {
        VStack {
            HStack(spacing: 5) {
                
                if isShowHour {
                    StopwatchUnit(timeUnit: hours, timeUnitText: "HR", color: Constants.DARK_SLATE)
                    Text(":")
                        .font(.system(size: 30))
                        .foregroundColor(Constants.DARK_SLATE)
                        .offset(y: -18)
                }
                
                StopwatchUnit(timeUnit: minutes, timeUnitText: "MIN", color: Constants.DARK_SLATE)
                Text(":")
                    .font(.system(size: 30))
                    .foregroundColor(Constants.DARK_SLATE)
                    .offset(y: -18)
                
                StopwatchUnit(timeUnit: seconds, timeUnitText: "SEC", color: Constants.DARK_SLATE)
            }

            HStack {
                Button(action: {
                    if isRunning{
                        timer?.invalidate()
                    } else {
                        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
                            progressTime += 1
                        })
                    }
                    isRunning.toggle()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15.0)
                            .frame(width: 80, height: 40, alignment: .center)
                            .foregroundColor(isRunning ? .pink : .green)

                        Text(isRunning ? "Stop" : "Start")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                }

                Button(action: {
                    progressTime = 0
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15.0)
                            .frame(width: 80, height: 40, alignment: .center)
                            .foregroundColor(.gray)

                        Text("Reset")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                }
            }
            Text("Credit to: Finsi Ennes")
                .font(.caption)
                .foregroundColor(.mint)
        }
        .padding(5)
        .background(Constants.CLOUDS)
    }
}

struct StopwatchUnit: View {

    var timeUnit: Int
    var timeUnitText: String
    var color: Color

    /// Time unit expressed as String.
    /// - Includes "0" as prefix if number is less than 10.
    var timeUnitStr: String {
        let timeUnitStr = String(timeUnit)
        return timeUnit < 10 ? "0" + timeUnitStr : timeUnitStr
    }

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15.0)
                    .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round))
                    .fill(color)
                    .frame(width: 60, height: 60, alignment: .center)

                HStack(spacing: 2) {
                    Text(timeUnitStr.substring(index: 0))
                        .font(.system(size: 30))
                        .frame(width: 28)
                    Text(timeUnitStr.substring(index: 1))
                        .font(.system(size: 30))
                        .frame(width: 28)
                }
            }

            Text(timeUnitText)
                .font(.system(size: 10))
        }
        .foregroundColor(.black)
    }
}

// TRT Commented out
//struct Stopwatch_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            // TRT Commented Out:    darkGray.edgesIgnoringSafeArea(.all)
//
//            Stopwatch()
//        }
//    }
//}

extension String {
    func substring(index: Int) -> String {
        let arrayString = Array(self)
        return String(arrayString[index])
    }
}

