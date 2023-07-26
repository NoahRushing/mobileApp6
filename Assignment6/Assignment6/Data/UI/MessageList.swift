
import SwiftUI

struct MessageList: View {
  @EnvironmentObject var model: ViewModel
    let channel: Channel
    let workspace: Workspace
  var body: some View {
    VStack() {
      if model.messages.isEmpty {
        ProgressView()
      }
      else {
        List {
          ForEach(model.messages) {message in
            MessageCard(message: message)
                  .swipeActions {
                      if workspace.owner == model.logMember.id || message.member == model.logMember.id {
                          Button("Delete") {
                              MessageRepo.delete(member: model.logMember, message: message)
                              model.getMessages(channel: channel)
                          }
                          .tint(.red)
                      }
                  }
          }
        }

        }
      }
    .navigationTitle(channel.name)
    .toolbar {
        NavigationLink(destination: NewMessageView(channel: channel, workspace: workspace)) {
            Text("New Message")
        }
    }
    .onAppear {
        model.getMessages(channel: channel)
        model.getMembers()
    }
  }
}

