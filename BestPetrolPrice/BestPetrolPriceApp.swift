import SwiftUI

@main
struct BestPetrolPriceApp: App {
    @AppStorage("isOnboarded") var isOnboardViewShown = true
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .fullScreenCover(isPresented: $isOnboardViewShown, content: {
                    OnboardView()
                })
        }
    }
}
