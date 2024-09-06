import SwiftUI

struct ContentView: View {
    let contentVM = ContentViewModel()
    @State private var selectedType = "all"
    private let types = ["all", "e5", "e10", "diesel"]
    
    @State private var selectedRadius = 5
    private let radius = [5, 10, 25]
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(contentVM.stations) { station in
                        Text(station.name)
                    }
                }.listStyle(.plain)
                    .onChange(of: selectedType) { oldValue, newValue in
                        print(oldValue, newValue)
                    }
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Petrol Type", systemImage: "gear") {
                        Picker("Type", selection: $selectedType) {
                            ForEach(types, id: \.self) { type in
                                Text(type).tag(type)
                            }
                        }
                    }
                }
                
            })
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Radius (km)", systemImage: "star") {
                        Picker("Radius", selection: $selectedRadius) {
                            ForEach(radius, id: \.self) { currRadius in
                                Text("\(currRadius)").tag(currRadius)
                            }
                        }
                    }
                }
            })
        }
        .task {
            await contentVM.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
