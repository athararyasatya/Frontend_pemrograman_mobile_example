import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }
<<<<<<< HEAD
=======

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }
>>>>>>> 84243e0 (order detail)
}
