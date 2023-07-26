
import Foundation

class ViewModel: ObservableObject {
  @Published var workspaces = [Workspace]()
  @Published var channels = [Channel]()
  @Published var logMember = Member(id: UUID(), name: "", accessToken: "")
  @Published var currWorkspace = Workspace(id: UUID(), name: "", owner: UUID(), channels: 0)
  @Published var messages = [Message]()
  @Published var members = [Member2]()
  @Published var addedMessage = ""


  
  /*func getWorkspaces() {
    Task {
      let loaded = try! await WorkspaceRepo.load()
      DispatchQueue.main.async {
        self.posts = loaded
      }
    }
  } */
    
    func getWorkspaces() {
      Task {
          WorkspaceRepo.load(member: self.logMember) { todos in
          DispatchQueue.main.async {
              //print(todos)
              self.workspaces = todos
          }
        }
      }
    }
    func getChannels(workspace: Workspace) {
      Task {
          ChannelRepo.load(member: self.logMember, workspace: workspace) { todos in
          DispatchQueue.main.async {
              //print(todos)
              self.channels = todos
          }
        }
      }
    }
    func login(credentials: LoginCredentials) {
      Task {
          LoginRepo.loginAPI(credentials: credentials) { todos in
          DispatchQueue.main.async {
            //self.output = todos
            self.logMember = todos
                  //print(todos.name)
          }
        }
      }
    }
    func getMessages(channel: Channel) {
      Task {
          MessageRepo.load(member: self.logMember, channel: channel) { todos in
          DispatchQueue.main.async {
              //print(todos)
              self.messages = todos
          }
        }
      }
    }
    func getMembers() {
      Task {
          MemberRepo.load(member: self.logMember) { todos in
          DispatchQueue.main.async {
              self.members = todos
          }
        }
      }
    }
    /*func addMessage(channel: Channel, content: String) {
      Task {
          MessageRepo.add(member: self.logMember, channel: channel, content: content) { todos in
          DispatchQueue.main.async {
              self.addedMessage = todos
          }
        }
      }
    } */
    func getName(id: UUID) -> String {
        var r = ""
        for x in self.members {
            if x.id == id {
                r = x.name
            }
        }
        return r
    }
    
    
 /* func doLogin(credentials: LoginCredentials) {
    Task {
      let loaded = try! await LoginRepo.loginAPI(credentials: credentials)
        DispatchQueue.main.async {
          //self.log = loaded
        }
      }
    }*/
}
