
import SwiftUI



struct WorkspaceList: View {
    
  @EnvironmentObject var model: ViewModel
  var body: some View {
      
          VStack() {
            if model.workspaces.isEmpty {
              ProgressView()
            }
            else {
              List {
                ForEach(model.workspaces) {workspace in
                    NavigationLink(destination: ChannelList(workspace: workspace)) {
                        WorkspaceCard(workspace: workspace)
                    }.accessibilityLabel(workspace.name)
                  //WorkspaceCard(workspace: workspace)
                }
              }
              .navigationTitle("Workspaces")
              .toolbar {
                  NavigationLink(destination:LoginView()) {
                      Button("Logout") {
                          model.logMember = Member(id: UUID(), name: "", accessToken: "")
                      }
                  }

              }
            }
          }

          .onAppear {
              model.getWorkspaces()
          }
  }
}

