import Foundation

struct WorkspaceRepo {
    
    static func load(member: Member, callback: @escaping ([Workspace]) -> Void?) {
      var  request = URLRequest(url: URL(string: "https://cse118.com/api/v1/workspace")!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["Accept": "application/json",
                                       "Authorization": "Bearer \(member.accessToken)"]
      URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
          if let todos = try? JSONDecoder().decode([Workspace].self, from: data) {
            callback(todos)
          }
        }
      }.resume()
    }
}
