import SwiftUI

@main
struct MyApp: App {
    
    init() {
        FontStyle.registerFonts()
    }
    var body: some Scene {
        WindowGroup {
            MenuView()
        }
    }
}
