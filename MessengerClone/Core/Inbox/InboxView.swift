//
//  InboxView.swift
//  MessengerClone
//
//  Created by Gytis Ptašinskas on 2023-07-31.
//

import SwiftUI

struct InboxView: View {
    @State private var showNewMessageView = false
    @State private var user = User.Mock_User
    var body: some View {
        NavigationStack{
            ScrollView{
                ActiveNowView()
                
                List {
                    ForEach(0 ... 20, id: \.self) { message in
                        InboxRowView()
                    }
                }
                .listStyle(PlainListStyle())
                .frame(height: UIScreen.main.bounds.height - 120)
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .fullScreenCover(isPresented: $showNewMessageView, content: {
                    NewMessageView()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        NavigationLink(value: user) {
                            CircularProfileImageView(user: user, size: .xSmall)
                        }
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        showNewMessageView.toggle()
                    } label:{
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(Color(.label), Color(.systemGray5))
                    }
                }
            }
        }
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
    }
}
