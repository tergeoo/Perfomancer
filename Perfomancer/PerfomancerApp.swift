//
//  PerfomancerApp.swift
//  Perfomancer
//
//  Created by Георгий Тер-Григорьянц on 17/04/24.
//

import SwiftUI

@main
struct PerfomancerApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            TimerContentView()
        }
    }
}


class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        for window in NSApplication.shared.windows {
            window.level = .floating
        }
    }
}
