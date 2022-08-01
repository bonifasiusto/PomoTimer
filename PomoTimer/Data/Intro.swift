//
//  Intro.swift
//  PomoTimer
//
//  Created by Bonifasius Toto Neguisa Ginting on 22/07/22.
//

import Foundation
import SwiftUI

// Intro model & sample

struct Intro: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
    var color: Color
}

var intros: [Intro] = [

    Intro(image: "IllustrationTomato", title: "Focus on a task", description: "A great way to stay focused.The Pomodoro technique is a time management method and it uses a kitchen clock to divide your work into short break intervals (usually 25 minutes).", color: Color("Tomato")),
    
    Intro(image: "IllustrationBreak", title: "Take a break", description: "By balancing work-break time, you can improve your concentration and increase productivity.", color: Color("BlueIllustration"))

]

