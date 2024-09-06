import Foundation

@Observable
class ContentViewModel {
    var stations = [Station]()
    
    func fetchData(radius: String = "10", type: String = "all") async {
        let urlStr = "https://creativecommons.tankerkoenig.de/json/list.php?lat=52.521&lng=13.438&rad=\(radius)&sort=dist&type=\(type)&apikey=00000000-0000-0000-0000-000000000002"
        if let url = URL(string: urlStr) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode(Response.self, from: data)
                self.stations = response.stations
            } catch {
                print(error)
            }
        }
    }
}
