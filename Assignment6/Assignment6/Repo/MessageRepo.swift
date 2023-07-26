import Foundation

struct MessageRepo {
    
    static func load(member: Member, channel: Channel, callback: @escaping ([Message]) -> Void?) {
        var  request = URLRequest(url: URL(string: "https://cse118.com/api/v1/channel/\(channel.id)/message")!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["Accept": "application/json",
                                       "Authorization": "Bearer \(member.accessToken)"]
      URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            print("BBB")
          if let todos = try? JSONDecoder().decode([Message].self, from: data) {
            callback(todos)
          }
        }
      }.resume()
    }
    
     static func add(member: Member, channel: Channel, content: String) {
         var  request = URLRequest(url: URL(string: "https://cse118.com/api/v1/channel/\(channel.id)/message")!)
         request.httpMethod = "POST"
         request.allHTTPHeaderFields = ["Content-Type": "application/json",
                                        "Accept": "application/json",
                                        "Authorization": "Bearer \(member.accessToken)"]
         let body = ["content": content]
         let bodyData = try? JSONSerialization.data(
             withJSONObject: body,
             options: []
         )
        request.httpBody = bodyData
         let session = URLSession.shared
         let task = session.dataTask(with: request) { (data, response, error) in


         }
         task.resume()

       }
    
    static func delete(member: Member, message: Message) {
        var  request = URLRequest(url: URL(string: "https://cse118.com/api/v1/message/\(message.id)")!)
        request.httpMethod = "DELETE"
        request.allHTTPHeaderFields = ["Content-Type": "application/json",
                                       "Accept": "application/json",
                                       "Authorization": "Bearer \(member.accessToken)"]
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
        }
        task.resume()
      }
}
