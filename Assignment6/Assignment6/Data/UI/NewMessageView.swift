//
//  NewMessageView.swift
//  Assignment6
//
//  Created by Noah Rushing on 11/6/22.
//

import SwiftUI


struct NewMessageView: View {
    @EnvironmentObject var model: ViewModel
    @State private var content = ""
    @State private var goBack = false
    var e = UITextView()
    var channel: Channel
    var workspace: Workspace
    var body: some View {
        if goBack {
            MessageList(channel: channel, workspace: workspace)
        } else {
            VStack() {
                //TextView
                //e.text = content
                TextEditor(text: $content).accessibilityLabel("Message")
                Button("Cancel"){
                    goBack = true
                }
                Button("OK") {
                    MessageRepo.add(member: model.logMember, channel: channel, content: content)
                    sleep(1)
                    model.getMessages(channel: channel)
                    goBack = true
                }

            }
            .navigationBarTitle("New Message")
        }
    }
}


/*List() {
    NavigationLink(destination: MessageList(channel: channel)) {
        Button("Cancel"){
        }
    }
    NavigationLink(destination: MessageList(channel: channel)) {
        Button("OK") {
            print("ppppppppp")
            model.addMessage(channel: channel, content: content)
        }
    }
}*/
