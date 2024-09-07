import SwiftUI

struct OnboardView: View {
    @AppStorage("isOnboarded") var isOnboardViewShown = true
    
    var body: some View {
        Form {
            Section {
                Text("Use the left top-button to specify the search-radius.")
                Text("Use the right top-button to specify the petrol-type.")
                Text("Tab on one of the search-results for getting detailed information about the petrol-station.")
                Text("HINT: The API, which I have used provides results only for within Germany. Therefore the latitude and longitude is currently hard-coded. I plan to improve the app, that it  uses the current location of the user. But with that feature it wouldn't work, when you run it in Canada. :)")
            } header: {
                Text("How to use the Best-Petrol-Price App")
            } footer: {
                Button(action: {
                    isOnboardViewShown = false
                }, label: {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .frame(height: 30)
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .bold()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }).padding()
            }

        }
    }
}

#Preview {
    OnboardView()
}
