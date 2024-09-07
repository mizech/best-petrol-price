import SwiftUI

struct StationDetails: View {
    var station: Station
    
    var body: some View {
        Form {
            Section {
                Text(station.name)
                    .bold()
                Text("\(station.street) \(station.houseNumber)")
                Text("\(station.postCode) \(station.place)")
                Text("Currently \(station.isOpen == true ? "open" : "closed")")
                    .foregroundStyle(station.isOpen ? .green : .red)
            } header: {
                Text("Address Information")
            }
            Section {
                Text(String(format: "%.2f €", station.diesel))
            } header: {
                Text("Diesel-Price")
            }
            Section {
                Text(String(format: "%.2f €", station.e5))
            } header: {
                Text("E5-Price")
            }
            Section {
                Text(String(format: "%.2f €", station.e10))
            } header: {
                Text("E10-Price")
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
            isOpen: false,
            houseNumber: "87",
            postCode: 49
        )
    )
}
