# DVD-Player-Components

![Test](https://raw.githubusercontent.com/bufhdy/DVD-Player-Components/main/test.gif)

Testing drawer-like interface using SwiftUI. [Original design](https://dribbble.com/shots/14674250-Video-Player-Light) by [7ahang](https://dribbble.com/7ahang).

## Issue

As it involves resizing, animation needs to be added. `CAMediaTimingFunction` and `Animation.timingCurve` (SwiftUI) use the same parametres to match the animation, however, there can be a very small time difference and therefore cause the window to flicker irregularly. Relevant code below:

In `AppDelegate.swift`, custom `AnimatableWindow`:

```swift
NSAnimationContext.runAnimationGroup { context in
    context.timingFunction = CAMediaTimingFunction(controlPoints: 0.68, -0.55, 0.265, 1.55)
    context.duration = 0.4
    animator().setFrame(NSRect(origin: frame.origin, size: size), display: true, animate: true)
}
```

In `ContentView.swift`:

```swift
.onTapGesture {
    withAnimation(Animation.timingCurve(0.68, -0.55, 0.265, 1.55, duration: 0.4)) {
        showsDrawer.toggle()
    }
}
```

