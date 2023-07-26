
import SwiftUI

struct ChannelCard: View {
  @EnvironmentObject var model: ViewModel
  let channel: Channel
  var body: some View {
    HStack() {
        Text(channel.name)
        Text(String(channel.messages))
    }
  }
}
