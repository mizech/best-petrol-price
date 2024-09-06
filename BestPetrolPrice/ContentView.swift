import SwiftUI

struct ContentView: View {
    let contentVM = ContentViewModel()
    
    var body: some View {
        List {
            ForEach(contentVM.stations) { station in
                Text(station.name)
            }
        }.listStyle(.plain)
        .task {
            await contentVM.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
