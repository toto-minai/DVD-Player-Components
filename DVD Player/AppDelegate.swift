//
//  AppDelegate.swift
//  DVD Player
//
//  Created by Toto Minai on 2020/12/1.
//

import Cocoa
import SwiftUI

let animationTime: Double = 0.4

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window = AnimatableWindow(
            contentRect: NSRect(x: 0, y: 0, width: 190, height: 190),
            styleMask: [],
            backing: .buffered, defer: false)
        window.contentView = NSHostingView(rootView: ContentView())
        window.backgroundColor = NSColor.red // For testing, set to NSColor.clear for preview
        window.isMovableByWindowBackground = true
        window.center()
        
        window.makeKeyAndOrderFront(nil)
    }
}

class AnimatableWindow: NSWindow {
    var savedSize: CGSize = .zero

    override func setContentSize(_ size: NSSize) {
        if size == savedSize { return }
        savedSize = size

        NSAnimationContext.runAnimationGroup { context in
            context.timingFunction = CAMediaTimingFunction(controlPoints: 0, 0, 0.58, 1.00)
            context.duration = animationTime
            animator().setFrame(NSRect(origin: frame.origin, size: size), display: true, animate: true)
        }
    }
}
