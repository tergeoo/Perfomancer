//
//  TimerViewController.swift
//  Perfomancer
//
//  Created by George Ter-Grigoryantc on 21/04/24.
//

import Foundation
import Combine

class TimerViewModel : ObservableObject {
    
    @Published var timerText = ""
    @Published var isRunning = false
    @Published var isResetEnabled = false
    
    private var days: Int = 0
    private var hours: Int = 0
    private var minutes: Int = 0
    private var seconds: Int = 0
    private var secondsElapsed = 0
    private var timer: AnyCancellable? = nil
    
    init() {
        updateTimerText()
    }
    
    func start(){
        guard !isRunning else { return }
        
        isRunning = true
        
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            .sink(receiveValue: { [weak self] _ in self?.updateTimer()})
    }
 
    func stop(){
        isRunning = false
        timer = nil
        updateResetEnabled()
    }
    
    func resetTimer(){
        isRunning = false
        timer = nil
        secondsElapsed = 0
        seconds = 0
        minutes = 0
        hours = 0
        
        updateTimerText()
        updateResetEnabled()
    }
    
    private func updateTimer(){
        self.secondsElapsed += 1
        
        seconds = secondsElapsed % 60
        minutes = (secondsElapsed % 3600) / 60
        hours = secondsElapsed / 3600
        
        updateTimerText()
        updateResetEnabled()
    }
    
    private func updateResetEnabled() {
        isResetEnabled = isRunning && secondsElapsed > 0
    }
    
    private func updateTimerText(){
        let secondText = seconds > 10 ? "\(seconds)" : "0\(seconds)"
        let minuteText = minutes > 10 ? "\(minutes)" : "0\(minutes)"
        let hourText = hours > 10 ? "\(hours)" : "0\(hours)"
        
        timerText = "\(hourText):\(minuteText):\(secondText)"
    }
}
