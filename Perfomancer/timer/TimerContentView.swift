//
//  TimerContentView.swift
//  Perfomancer
//
//  Created by George Ter-Grigoryantc on 21/04/24.
//

import SwiftUI

struct TimerContentView: View {

    @StateObject var viewModel: TimerViewModel = TimerViewModel()

    var body: some View {
        HStack {
            Text(viewModel.timerText)
                .font(.largeTitle)
            
            Button(action: {
                viewModel.isRunning ? viewModel.stop() : viewModel.start()
            }) {
                Text(viewModel.isRunning ? "Stop" : "Start")
            }

            Button(action: {
                viewModel.resetTimer()
            }) {
                Text("Reset")
            }
            .disabled(!viewModel.isResetEnabled)
        }.fixedSize()
    }
}
