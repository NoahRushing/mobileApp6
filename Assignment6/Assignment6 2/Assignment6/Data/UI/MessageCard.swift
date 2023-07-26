
import SwiftUI

func convertDate(date: String) -> String {
    print(date)
    let RFC3339DateFormatter = DateFormatter()
    if date.count > 20 {
        print("1")
        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    } else {
        print("2")
        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    }
    //RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    RFC3339DateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    let d = RFC3339DateFormatter.date(from: date)!
    let formatted = d.formatted(date: .abbreviated, time: .shortened)
    return formatted
}



struct MessageCard: View {
  @EnvironmentObject var model: ViewModel
  let message: Message
  var body: some View {
      VStack() {
          VStack(alignment: .leading) {
              Text("\(model.getName(id: message.member))").bold()
              Text("\(message.content)")
          }
          Text("\(convertDate(date: message.posted))").font(.system(size: 12)).multilineTextAlignment(.trailing)
      }
  }
}
