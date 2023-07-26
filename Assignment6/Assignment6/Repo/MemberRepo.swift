import Foundation

struct MemberRepo {
    
    static func load(member: Member, callback: @escaping ([Member2]) -> Void?) {
        var  request = URLRequest(url: URL(string: "https://cse118.com/api/v1/member")!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["Accept": "application/json",
                                       "Authorization": "Bearer \(member.accessToken)"]
      URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            //print(response)
          if let todos = try? JSONDecoder().decode([Member2].self, from: data) {
            callback(todos)
          }
        }
      }.resume()
    }
}
