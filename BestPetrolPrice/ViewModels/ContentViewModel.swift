import Foundation

@Observable
class ContentViewModel {
    var stations = [Station]()
    
    func fetchData() async {
        let urlStr = "https://creativecommons.tankerkoenig.de/json/list.php?lat=52.521&lng=13.438&rad=25&sort=dist&type=all&apikey=00000000-0000-0000-0000-000000000002"
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
