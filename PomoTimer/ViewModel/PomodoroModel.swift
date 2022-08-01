//
//  PomodoroModel.swift
//  PomoTimer
//
//  Created by Bonifasius Toto Neguisa Ginting on 25/07/22.
//

import SwiftUI

class PomodoroModel: NSObject,ObservableObject {
// MARK: Properti Timer
    @Published var progress: CGFloat = 1
    @Published var timerStringValue: String = "00:00"
    @Published var isStarted: Bool = false
    @Published var addNewTimer: Bool = false
    
    @Published var hour: Int = 0
    @Published var minutes: Int = 0
    @Published var seconds: Int = 0
    
    
}

