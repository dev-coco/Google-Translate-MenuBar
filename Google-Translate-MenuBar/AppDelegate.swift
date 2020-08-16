import Cocoa
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var statusMenu: NSMenu!
    let popover = NSPopover()
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.image = NSImage.init(named: "logo_menu")
        statusItem.button?.image = NSImage.init(named: "logo_menu")
        popover.contentViewController = NSViewController.init(nibName: "WebVC", bundle: .main)
        statusItem.button?.action = #selector(toggleWebView(_:))
    }
    @IBAction func didTappedQuit(_ sender: NSButton) {
        NSApp.terminate(self)
    }
    @objc func toggleWebView(_ sender: NSStatusBarButton) {
        if popover.isShown {
            popover.performClose(sender)
        } else {
            if let btn = statusItem.button {
                popover.show(relativeTo: btn.bounds, of: btn, preferredEdge: .minY)
            }
        }
    }
}
