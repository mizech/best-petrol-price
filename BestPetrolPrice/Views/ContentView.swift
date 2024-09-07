import SwiftUI

struct ContentView: View {
    let contentVM = ContentViewModel()
    @State private var selectedType = "all"
    private let types = ["all", "e5", "e10", "diesel"]
    
    @State private var selectedRadius = 5
    private let radius = [5, 10, 25]
    
    var body: some View {
        NavigationStack {
            Text("Radius: \(selectedRadius) km -> \(contentVM.stations.count) petrol stations")
                .bold()
            VStack {
                List {
                    ForEach(contentVM.stations) { station in
                        NavigationLink {
                            StationDetails(station: station)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(station.name)
                                    .bold()
                                Text(station.street)
                            }
                        }
                    }
                }.listStyle(.plain)
                    .onChange(of: selectedType) { oldValue, newValue in
                        Task {
                            await contentVM.fetchData(radius: String(selectedRadius), type: selectedType)
                        }
                    }
                    .onChange(of: selectedRadius) { oldValue, newValue in
                        Task {
                            await contentVM.fetchData(radius: String(selectedRadius), type: selectedType)
                        }
                    }
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Petrol Type", systemImage: "fuelpump") {
                        Picker("Type", selection: $selectedType) {
                            ForEach(types, id: \.self) { type in
                                Text(type.capitalized).tag(type)
                            }
                        }
                    }
                }
                
            })
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Radius (km)", systemImage: "circle.circle") {
                        Picker("Radius", selection: $selectedRadius) {
                            ForEach(radius, id: \.self) { currRadius in
                                Text("\(currRadius) km").tag(currRadius)
                            }
                        }
                    }
                }
            })
        }
        .task {
            await contentVM.fetchData(radius: String(selectedRadius), type: "all")
        }
    }
}

#Preview {
    ContentView()
}
