import Foundation

@Observable
class ContentViewModel {
    var stations = [Station]()
    
    func fetchData(radius: String = "10", type: String = "all") async {
        let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
        
        if let apiKey = apiKey {
            let urlStr = "https://creativecommons.tankerkoenig.de/json/list.php?lat=49.39239&lng=6.7018&rad=\(radius)&sort=dist&type=\(type)&apikey=\(apiKey)"
            if let url = URL(string: urlStr) {
                do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    let response = try JSONDecoder().decode(Response.self, from: data)
                    self.stations = response.stations
                } catch {
                    print(error)
                }
            }
        } else {
            print("Something has gone wrong, reading the API-key.")
        }
    }
}
