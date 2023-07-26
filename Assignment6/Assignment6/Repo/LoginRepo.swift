import Foundation

struct LoginCredentials: Codable {
    var email: String
    var password: String
}

struct LoginRepo {
    
    
    static func loginAPI(credentials: LoginCredentials, callback: @escaping (Member) -> Void?) {
      var  request = URLRequest(url: URL(string: "https://cse118.com/api/v1/login")!)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Content-Type": "application/json",
                                       "Accept": "application/json"]
        request.httpBody = try! JSONEncoder().encode(credentials)
      URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
          if let todos = try? JSONDecoder().decode(Member.self, from: data) {
            callback(todos)
          }
        }
      }.resume()
    }
  }
