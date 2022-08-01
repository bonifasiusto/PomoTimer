//
//  ContentTimerView.swift
//  PomoTimer
//
//  Created by Bonifasius Toto Neguisa Ginting on 25/07/22.
//

import SwiftUI

struct ContentTimerView: View {
    
    @EnvironmentObject var pomodoroModel: PomodoroModel
    var body: some View {
        HomeTimerView()
            .environmentObject(pomodoroModel)
    }
}

struct ContentTimerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTimerView()
    }
}
