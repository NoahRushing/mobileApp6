import Foundation

struct ChannelRepo {
    
    static func load(member: Member, workspace: Workspace, callback: @escaping ([Channel]) -> Void?) {
        var  request = URLRequest(url: URL(string: "https://cse118.com/api/v1/workspace/\(workspace.id)/channel")!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["Accept": "application/json",
                                       "Authorization": "Bearer \(member.accessToken)"]
      URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
          if let todos = try? JSONDecoder().decode([Channel].self, from: data) {
            callback(todos)
          }
        }
      }.resume()
    }
}
