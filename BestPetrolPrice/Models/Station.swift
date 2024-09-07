import Foundation

struct Station: Codable, Identifiable {
    var id: String = ""
    var name: String = ""
    var street: String = ""
    var place: String = ""
    var dist: Double = 0
    var diesel: Double = 0
    var e5: Double = 0
    var e10: Double = 0
    var isOpen: Bool = false
    var houseNumber: String = ""
    var postCode: Int = 0
}
