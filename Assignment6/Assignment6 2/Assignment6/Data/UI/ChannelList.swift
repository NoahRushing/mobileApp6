
import SwiftUI

struct ChannelList: View {
  @EnvironmentObject var model: ViewModel
    let workspace: Workspace
  var body: some View {
          VStack() {
            if model.channels.isEmpty {
              ProgressView()
            }
            else {
              List {
                ForEach(model.channels) {channel in
                    NavigationLink(destination: MessageList(channel: channel, workspace: workspace)) {
                        ChannelCard(channel: channel)
                    }.accessibilityLabel(channel.name)
                }
              }
              .navigationTitle(workspace.name)
            }
          }
          .onAppear {
              model.getChannels(workspace: workspace)
              model.getMembers()

          }
  }
}

