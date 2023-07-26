//
//  LoginView.swift
//  Assignment6
//
//  Created by Noah Rushing on 11/5/22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var model: ViewModel
    //@State private var username = "molly@cse118.com"
    //@State private var password = "molly"
    @State private var username = ""
    @State private var password = ""
    //@State private var username = "nrushing@ucsc.edu"
    //@State private var password = "1727212"
    @State private var output = Member(id: UUID(), name: "", accessToken: "")
    var body: some View {
        if model.logMember.name != "" {
            WorkspaceList()
        } else {
            VStack() {
                Text("CSE118 Assignment 6")
                Image("SlugLogo")
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 150, height: 150)
                  .clipped()
                TextField("EMail", text: $username)
                SecureField("Password", text: $password)
                Button("Login") {
                    model.login(credentials: LoginCredentials(email: username, password: password))
                }
            }
        }
    }
}
