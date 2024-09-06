import Foundation

class Station: Codable, Identifiable {
    var id: String
    var name: String
    var street: String
    var place: String
    var dist: Double
    var diesel: Double
    var e5: Double
    var e10: Double
    var isOpen: Bool
    var houseNumber: String
    var postCode: Int
}
