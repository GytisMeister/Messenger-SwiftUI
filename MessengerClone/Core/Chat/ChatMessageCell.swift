//
//  ChatMessageCell.swift
//  MessengerClone
//
//  Created by Gytis Ptašinskas on 2023-08-02.
//

import SwiftUI

struct ChatMessageCell: View {
    let isFromCurrentUser: Bool
    var body: some View {
        HStack {
            if isFromCurrentUser {
                Spacer()
                
                Text("This is a test message")
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5 , alignment: .trailing)
            } else {
                HStack(alignment: .bottom,spacing: 8) {
                    CircularProfileImageView(user: User.Mock_User, size: .xxSmall)
                    Text("This is a test message")
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.75 , alignment: .leading)
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 8)
    }
}

struct ChatMessageCell_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageCell(isFromCurrentUser: false)
    }
}
