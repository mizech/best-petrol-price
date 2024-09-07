import SwiftUI

struct StationDetails: View {
    var station: Station
    
    var body: some View {
        Form {
            Section {
                Text(station.name)
                Text("\(station.street) \(station.houseNumber)")
                Text("\(station.postCode) \(station.place)")
            } header: {
                Text("Address Information")
            }
            Section {
                Text("\(station.diesel) €")
            } header: {
                Text("Diesel-Price")
            }
            Section {
                Text("\(station.e5) €")
            } header: {
                Text("E5-Price")
            }
            Section {
                Text("\(station.e10) €")
            } header: {
                Text("E5-Price")
            }
        }
    }
}

#Preview {
    StationDetails(
        station: Station(
            id: "9",
            name: "Test Station",
            street: "Test Street",
            place: "Test Place",
            dist: 8,
            diesel: 3.0,
            e5: 3.0,
            e10: 3.10,
            isOpen: true,
            houseNumber: "87",
            postCode: 49
        )
    )
}
