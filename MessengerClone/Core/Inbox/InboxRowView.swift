//
//  InboxRowView.swift
//  MessengerClone
//
//  Created by Gytis Ptašinskas on 2023-07-31.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            CircularProfileImageView(user: User.Mock_User, size: .medium)
            VStack (alignment: .leading, spacing: 4) {
                Text("Vincentas Skarbalius")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("Some kind of text message")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(12)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            HStack{
                Text("Yesterday")
                
                Image(systemName: "chevron.right")
                
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .frame(height: 72)
    }
}

struct InboxRowView_Previews: PreviewProvider {
    static var previews: some View {
        InboxRowView()
    }
}
