
import SwiftUI

struct WorkspaceCard: View {
  @EnvironmentObject var model: ViewModel
  let workspace: Workspace
  var body: some View {
    HStack() {
        Text(workspace.name)
        Text(String(workspace.channels))
    }
  }
}
